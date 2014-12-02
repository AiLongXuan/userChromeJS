// ==UserScript==
// @name            youkuantiadsModY.uc.js
// @namespace       YoukuAntiADs@harv.c
// @description     视频网站去黑屏（网络本地结合版）。如果有本地播放器则使用本地的路径，否则使用默认的网络播放器
// @include         chrome://browser/content/browser.xul
// @author          ywzhaiqi && harv.c（原作者）
// @homepage        http://haoutil.tk
// @version         1.6.0.26
// @update          2014.8.10
// @compatible      firefox 17+
// @startup         window.mYoukuAntiADs.init();
// @shutdown        window.mYoukuAntiADs.destroy();
// @homePageURL     https://github.com/ywzhaiqi/userChromeJS/tree/master/YoukuantiadsModY
// @downloadURL     https://github.com/ywzhaiqi/userChromeJS/raw/master/YoukuantiadsModY/youkuantiadsModY.uc.js
// updateURL       https://j.mozest.com/ucscript/script/92.meta.js
// downloadURL     https://j.mozest.com/zh-CN/ucscript/script/92.uc.js
// @note            2014-7-21 新增下载播放器、自动更新等功能。
// @note            2014-7-1 新增：提前判断是否为 flash，加快速度。
// @note            2014-7-1 新增：本地播放器检测功能。
//+++++++++++++++自定義+++++++++++++++
// 規則提取：https://github.com/rasso1/youkuantiads/blob/master/AntiChinaVideoAds.js

// 2014.12.02       跟進ACVAA 1128版規則
// 2014.11.21       跟進ACVAA規則，修复letv外鏈
// 2014.11.18       啓用本地播放器
// 2014.11.14       跟進ACVAA規則，新增ppsiqiyi,ppslive,baiduAD
// 2014.11.08       跟進AntiChinaVideoAdsAlliances規則
// 2014.10.25       SWF換用自己的Github備份地址（從AntiChinaVideoAdsAlliances擴展提取）
// 2014.10.23       添加多玩規則
//+++++++++++++++自定義+++++++++++++++
// ==/UserScript==

(function() {
    /*
        脚本地址：http://bbs.kafan.cn/thread-1509944-1-1.html
        绿色播放器主页：https://g.mozest.com/thread-43519-1-1
     */

    var enalbe_localPlayer = true; // 是否启用本地播放器
    var SWF_DIR = 'local\\swf';           // 本地播放器路径，chrome 目录下
    // var SWF_DIR = 'local\\swf';

    var XHR_TIMEOUT = 30 * 1000;

    var updateStates = {
        noUpdate: '无更新',
        urlNotExists: '链接错误或不存在',
        xhrError: '请求出错',
        xhrTimeout: '请求超时'
    };

    var debug = false ? window.console && console.log.bind(console) : function() {};

    Cu.import("resource://gre/modules/FileUtils.jsm")
    Cu.import("resource://gre/modules/NetUtil.jsm");

    var Instances = {
        get xhr() Cc["@mozilla.org/xmlextras/xmlhttprequest;1"]
            .createInstance(Ci.nsIXMLHttpRequest),
        get wbp() Cc["@mozilla.org/embedding/browser/nsWebBrowserPersist;1"]
            .createInstance(Ci.nsIWebBrowserPersist),
        get ios() Cc["@mozilla.org/network/io-service;1"]
            .getService(Ci.nsIIOService)
    };

    var getURLSpecFromFile = Instances.ios
                    .getProtocolHandler("file").QueryInterface(Ci.nsIFileProtocolHandler)
                    .getURLSpecFromFile;

    var ProfD = 'file:///' + FileUtils.getDir('UChrm', []).path + '/';

    // 全局替换规则，后面会检验是否存在，不存在会删除
    var SpecialRules = [
        // 重定向这个网址 http://s3.music.126.net/s/2/pt_index.js?49d138c4e4dfbd143dc16794a95a4856
        {
            name: '网易云音乐 320k 辅助',
            player: ProfD + 'local\\pt_index.js',
            re: /^http:\/\/.*\.music\.126\.net\/.*pt_index\.js/i,
        }
    ];

    // YoukuAntiADs, request observer
    function YoukuAntiADs() {};
    YoukuAntiADs.prototype = {
SITES: {
        'youku_loader': {
            'player': 'http://noads.aliapp.com/swf/loader.swf',
            're': /http:\/\/static\.youku\.com(\/v[\d\.]+)?\/v\/swf\/loaders?\.swf/i
        },
        'youku_player': {
            'player': 'http://noads.aliapp.com/swf/player.swf',
            're': /http:\/\/static\.youku\.com(\/v[\d\.]+)?\/v\/swf\/q?player[^\.]*\.swf/i
        },
        'ku6': {
            'player': 'http://noads.aliapp.com/swf/ku6.swf',
            're': /http:\/\/player\.ku6cdn\.com\/default\/common\/player\/\d{12}\/player\.swf/i
        },
        'ku6_out': {
            'player': 'http://noads.aliapp.com/swf/ku6_out.swf',
            're': /http:\/\/player\.ku6cdn\.com\/default\/out\/\d{12}\/player\.swf/i
        },
        'iqiyi': {
            'player0': 'http://noads.aliapp.com/swf/iqiyi_out.swf',
            'player1': 'http://noads.aliapp.com/swf/iqiyi5.swf',
            'player2': 'http://noads.aliapp.com/swf/iqiyi.swf',
            're': /https?:\/\/www\.iqiyi\.com\/(player\/\d+\/Player|common\/flashplayer\/\d+\/(Main|Coop|Share)?Player_?.*)\.swf/i
        },
        'tudou': {
            'player': 'http://no_ads.jd-app.com/tudou.swf',
            're': /http:\/\/js\.tudouui\.com\/.*portalplayer[^\.]*\.swf/i
        },
        'tudou_olc': {
            'player': 'http://noads.aliapp.com/swf/olc_8.swf',
            're': /http:\/\/js\.tudouui\.com\/.*olc[^\.]*\.swf/i
        },
        'tudou_sp': {
            'player': 'http://noads.aliapp.com/swf/sp.swf',
            're': /http:\/\/js\.tudouui\.com\/.*\/socialplayer[^\.]*\.swf/i
        },
		'letv': {
            'player': 'http://noads.aliapp.com/swf/letv.swf',
            're': /http:\/\/.*letv[\w]*\.com\/(hz|.*\/((?!(Live|seed|Disk))(S[\w]{2,3})?(?!Live)[\w]{4}|swf))Player*\.swf/i
        },
        'letv_live': {
            'player': 'http://no_ads.jd-app.com/letvlive.swf',
            're': /http:\/\/.*letv[\w]*\.com\/p\/\d+\/\d+\/\d+\/newplayer\/LivePlayer\.swf/i
        },
        'letvskin': {
            'player': 'http://player.letvcdn.com/p/201407/24/15/newplayer/1/SSLetvPlayer.swf',
            're': /http:\/\/.*letv[\w]*\.com\/p\/\d+\/\d+\/(?!15)\d*\/newplayer\/\d+\/S?SLetvPlayer\.swf/i
        },
        'pptv': {
            'player': 'http://noads.aliapp.com/swf/pptv.in.Ikan.swf',
            're': /http:\/\/player.pplive.cn\/ikan\/.*\/player4player2\.swf/i
        },
		'pplive': {
            'player': 'http://noads.aliapp.com/swf/pptv.in.Live.swf',
            're': /http:\/\/player.pplive.cn\/live\/.*\/player4live2\.swf/i
        },
		'sohu': {
           'player': 'http://noads.aliapp.com/swf/sohu.swf',
           're': /http:\/\/tv\.sohu\.com\/upload\/swf\/(?!(live|\d+)).*\d+\/(main|PlayerShell)\.swf/i
        },
        'sohu_liv': {
           'player': 'http://noads.aliapp.com/swf/sohu_live.swf',
           're': /http:\/\/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}(:[0-9]{2,5})?(\/test)?\/(player|webplayer)\/(main|playershell)\.swf/i
        },
        'sohu_live': {
           'player': 'http://noads.aliapp.com/swf/sohu_live.swf',
           're': /http:\/\/tv\.sohu\.com\/upload\/swf\/(live\/|)\d+\/(main|PlayerShell)\.swf/i
        },
		'pps': {
            'player': 'http://no_ads.jd-app.com/pps.swf',
            're': /http:\/\/www\.iqiyi\.com\/player\/cupid\/.*\/pps[\w]+.swf/i
        },
		'ppsiqiyi': {
            'player': 'http://noads.aliapp.com/swf/iqiyi.swf',
            're': /http:\/\/www\.iqiyi\.com\/common\/flashplayer\/\d+\/PPSMainPlayer.*\.swf/i
		},	
		'ppslive': {
            'player': 'http://www.iqiyi.com/player/20140613210124/livePlayer.swf',
            're': /http:\/\/www\.iqiyi\.com\/common\/flashplayer\/\d+\/am.*\.swf/i
		},	
        'wanhenda': {
            'player': 'http://yuntv.letv.com/bcloud.swf',
            're': /http:\/\/assets\.dwstatic\.com\/.*\/vppp\.swf/i
        },
        '17173': {
            'player': 'http://noads.aliapp.com/swf/17173.in.Vod.swf',
            're': /http:\/\/f\.v\.17173cdn\.com\/\d+\/flash\/Player_file\.swf/i			                
		},
        '17173_out': {
            'player': 'http://noads.aliapp.com/swf/17173.out.Vod.swf',
  	    're': /http:\/\/f\.v\.17173cdn\.com(\/\d+)?\/flash\/Player_file_(custom)?out\.swf/i
     	},			
	    '17173_stream_customOut': {
            'player': 'http://noads.aliapp.com/swf/17173.out.Live.swf',
  	    're': /http:\/\/f\.v\.17173cdn\.com(\/\d+)?\/flash\/Player_stream_(custom)?Out\.swf/i
	    },			
        '17173_live': {
            'player': 'http://noads.aliapp.com/swf/17173.in.Live.swf',
            're': /http:\/\/f\.v\.17173cdn\.com\/\d+\/flash\/Player_stream(_firstpage)?\.swf/i
        },
		'baiduAD': {
            'player': 'http://noads.aliapp.com/swf/baidu.call.swf',
		    're': /http:\/\/list\.video\.baidu\.com\/swf\/advPlayer\.swf/i
		}
},
        os: Cc['@mozilla.org/observer-service;1']
                .getService(Ci.nsIObserverService),
        init: function() {
            var site = this.SITES['iqiyi'];
            site['preHandle'] = function(aSubject) {
                var wnd = this.getWindowForRequest(aSubject);
                if(wnd) {
                    site['cond'] = [
                        !/(^((?!baidu|61|178).)*\.iqiyi\.com|pps\.tv)/i.test(wnd.self.location.host),
                        wnd.self.document.querySelector('span[data-flashplayerparam-flashurl]'),
                        true
                    ];
                    if(!site['cond']) return;

                    for(var i = 0; i < site['cond'].length; i++) {
                        if(site['cond'][i]) {
                            if(site['player'] != site['player' + i]) {
                                site['player'] = site['player' + i];
                                site['storageStream'] = site['storageStream' + i] ? site['storageStream' + i] : null;
                                site['count'] = site['count' + i] ? site['count' + i] : null;
                            }
                            break;
                        }
                    }
                }
            };
            site['callback'] = function() {
                if(!site['cond']) return;

                for(var i = 0; i < site['cond'].length; i++) {
                    if(site['player' + i] == site['player']) {
                        site['storageStream' + i] = site['storageStream'];
                        site['count' + i] = site['count'];
                        break;
                    }
                }
            };
        },
        // getPlayer, get modified player
        getPlayer: function(site, callback) {
            NetUtil.asyncFetch(site['player'], function(inputStream, status) {
                var binaryOutputStream = Cc['@mozilla.org/binaryoutputstream;1']
                                            .createInstance(Ci['nsIBinaryOutputStream']);
                var storageStream = Cc['@mozilla.org/storagestream;1']
                                        .createInstance(Ci['nsIStorageStream']);
                var count = inputStream.available();
                var data = NetUtil.readInputStreamToString(inputStream, count);

                storageStream.init(512, count, null);
                binaryOutputStream.setOutputStream(storageStream.getOutputStream(0));
                binaryOutputStream.writeBytes(data, count);

                site['storageStream'] = storageStream;
                site['count'] = count;

                if(typeof callback === 'function') {
                    callback();
                }
            });
        },
        getWindowForRequest: function(request){
            if(request instanceof Ci.nsIRequest){
                try{
                    if(request.notificationCallbacks){
                        return request.notificationCallbacks
                                    .getInterface(Ci.nsILoadContext)
                                    .associatedWindow;
                    }
                } catch(e) {}
                try{
                    if(request.loadGroup && request.loadGroup.notificationCallbacks){
                        return request.loadGroup.notificationCallbacks
                                    .getInterface(Ci.nsILoadContext)
                                    .associatedWindow;
                    }
                } catch(e) {}
            }
            return null;
        },
        observe: function(aSubject, aTopic, aData) {
            if(aTopic != 'http-on-examine-response') return;

            var http = aSubject.QueryInterface(Ci.nsIHttpChannel),
                url = http.URI.spec;

            // 先查找全局规则
            var site = null;
            SpecialRules.some(function(rule){
                if (rule.re.test(url)){
                    site = rule;
                    return true;
                }
            });

            // 如果不存在，搜索 flash 规则
            if (!site) {
                var aVisitor = new HttpHeaderVisitor();
                http.visitResponseHeaders(aVisitor);
                if (!aVisitor.isFlash())
                    return;

                var rule;
                for(var i in this.SITES) {
                    rule = this.SITES[i];
                    // 跳过禁用的
                    if (rule.enable == false) continue;

                    if(rule['re'].test(http.URI.spec)) {
                        site = rule;
                        break;
                    }
                }
            }

            if (site) {
                // console.log('1111', site.player)
                var fn = this,
                    args = Array.prototype.slice.call(arguments);

                if(typeof site['preHandle'] === 'function')
                    site['preHandle'].apply(fn, args);

                if(!site['storageStream'] || !site['count']) {
                    http.suspend();
                    this.getPlayer(site, function() {
                        http.resume();
                        if(typeof site['callback'] === 'function')
                            site['callback'].apply(fn, args);
                    });
                }

                var newListener = new TrackingListener();
                aSubject.QueryInterface(Ci.nsITraceableChannel);
                newListener.originalListener = aSubject.setNewListener(newListener);
                newListener.site = site;
            }
        },
        QueryInterface: function(aIID) {
            if(aIID.equals(Ci.nsISupports) || aIID.equals(Ci.nsIObserver))
                return this;

            return Cr.NS_ERROR_NO_INTERFACE;
        },
        register: function() {
            this.init();
            this.os.addObserver(this, 'http-on-examine-response', false);
        },
        unregister: function() {
            this.os.removeObserver(this, 'http-on-examine-response', false);
        }
    };

    // TrackingListener, redirect youku player to modified player
    function TrackingListener() {
        this.originalListener = null;
        this.site = null;
    }
    TrackingListener.prototype = {
        onStartRequest: function(request, context) {
            this.originalListener.onStartRequest(request, context);
        },
        onStopRequest: function(request, context) {
            this.originalListener.onStopRequest(request, context, Cr.NS_OK);
        },
        onDataAvailable: function(request, context) {
            this.originalListener.onDataAvailable(request, context, this.site['storageStream'].newInputStream(0), 0, this.site['count']);
        }
    };

    function HttpHeaderVisitor() {
        this._isFlash = false;
    }
    HttpHeaderVisitor.prototype = {
        visitHeader: function(aHeader, aValue) {
            if (aHeader.indexOf("Content-Type") !== -1) {
                if (aValue.indexOf("application/x-shockwave-flash") !== -1) {
                    this._isFlash = true;
                }
            }
        },
        isFlash: function() {
            return this._isFlash;
        }
    };

    if (window.mYoukuAntiADs) {
        window.mYoukuAntiADs.destroy();
        delete window.mYoukuAntiADs;
    }

    window.mYoukuAntiADs = {
        enable: true,
        registerDone: false,

        get prefs() {
            delete this.prefs;
            return this.prefs = Services.prefs.getBranch("userChromeJS.YoukuAntiADs.");
        },

        init: function() {
            this.initSpecialRules();

            // register observer
            // uc 脚本会因为打开新窗口而重复注册
            var mediator = Cc["@mozilla.org/appshell/window-mediator;1"]
                           .getService(Ci.nsIWindowMediator);
            var enumerator = mediator.getEnumerator("navigator:browser");
            while (enumerator.hasMoreElements()) {
                var win = enumerator.getNext();
                if (win.mYoukuAntiADs && win.mYoukuAntiADs.registerDone) {
                    return;
                }
            }

            this.y = new YoukuAntiADs();
            this.y.register();
            this.registerDone = true;

            window.addEventListener('unload', this, false);


            if (!enalbe_localPlayer) return;

            this.swfDir = this.getSwfDir();

            this.addMenuItem();

            this.replaceLocalUrl();

            // this.initPrefs();
            // this.prefs.addObserver('', this, false);

            // if (!this.prefs.prefHasUserValue('enable')) {
            //     this.openPrefs();
            // } else {
            //     if (this.prefs.getBoolPref('localPlayer.enable')) {
            //         this.replaceLocalUrl();
            //     }
            // }
        },
        destroy: function() {
            this.y.unregister();

            window.removeEventListener('unload', this, false);

            // this.prefs.revemoObserver('', this, false);

            ['youkuAntiADsMod'].forEach(function(id){
                var node = document.getElementById(id);
                if (node) node.parentNode.removeChild(node);
            });
        },
        handleEvent: function(event) {
            switch (event.type) {
                case 'unload':
                    if(location == 'chrome://browser/content/browser.xul') {
                        this.y.unregister();
                    }
                    break;
            }
        },
        initSpecialRules: function() { // 移除不存在的
            SpecialRules.forEach(function(rule, i){
                var uri = Services.io.newURI(rule.player, null, null),
                    file = uri.QueryInterface(Ci.nsIFileURL).file;
                if (!file.exists()) {
                    SpecialRules.splice(i, 1);  // 从数组中移除
                }
            });
        },
        initPrefs: function() {  // 未完成
            var defPrefs = [
                ['enable', true],
                ['localPlayer.enable', true],
                // ['swfDir', '']
            ];

            defPrefs.forEach(function(item){
                if (!this.prefs.prefHasUserValue(item[0])) {
                    switch(typeof(item[1])) {
                        case 'boolean':
                            this.prefs.setBoolPref(item[0], item[1]);
                            break;
                        case 'string':
                            break;
                    }
                }
            });
        },
        observer: function(subject, topic, data) { // 未完成
            if (topic == 'nsPref:changed') {
                switch(data) {
                    case 'enable':
                        this.enable = !! this.prefs.getBoolPref('enable');
                        break;
                    case 'localPlayer.enable':
                        // if (enable) {
                        //     this.replaceLocalUrl();
                        // } else {

                        // }
                        break;
                    case 'swfDir':
                        this.swfDir = this.getSwfDir();
                        break;
                }
            }
        },
        getSwfDir: function (change) {
            if(!change){
                var aFolder;
                try {
                    aFolder = this.prefs.getComplexValue("swfDir", Ci.nsILocalFile);
                } catch (e) {}

                if (aFolder && aFolder.exists() && aFolder.isDirectory()) {}
                else {
                    aFolder = FileUtils.getDir('UChrm', SWF_DIR.replace(/\//g, '\\').split('\\'), true);
                }

                return aFolder;
            }

            var nsIFilePicker = Ci.nsIFilePicker;
            var fp = Cc["@mozilla.org/filepicker;1"].createInstance(Ci.nsIFilePicker);
            fp.init(window, '请选择播放器存放的文件夹', nsIFilePicker.modeGetFolder);
            fp.displayDirectory = FileUtils.getDir('ProfD', ['']);

            if (fp.show() != nsIFilePicker.returnOK)
                return null;

            if (fp.file.exists() && fp.file.isDirectory()) {
                this.prefs.setComplexValue("swfDir", Ci.nsILocalFile, fp.file);
                return fp.file;
            }
        },
        addMenuItem: function() {
            var menuitem = $C('menuitem', {
                id: 'youkuAntiADsMod',
                class: 'menuitem-iconic menu-iconic',
                label: '更新视频播放器',
            });

            var self = this;
            menuitem.addEventListener('command', function(){
                self.updateSiteInfo()
            }, false);
            // menuitem.addEventListener('click', function(event){
            //     if (event.button == 2) {
            //         self.openPrefs();
            //     }
            // }, false);

            var ins = $('jscmdseparator') || $('devToolsSeparator');
            ins.parentNode.insertBefore(menuitem, ins);
        },
        replaceLocalUrl: function() {
            var existPlayerSize = this.setLocalSwf(this.y.SITES);
            if (existPlayerSize === 0) {
                this.updateSiteInfo();
            }
        },

        /**
         * 如果存在本地播放器，则替换地址为本地
         * @return 本地播放器的个数
         */
        setLocalSwf: function(SITES) {  // 这个修改的是原型
            let swfPaths = {};

            // 取得所有的 .swf 文件
            let files = this.swfDir.directoryEntries.QueryInterface(Ci.nsISimpleEnumerator);
            while (files.hasMoreElements()) {
                let file = files.getNext().QueryInterface(Ci.nsIFile);
                if (file.leafName.endsWith('.swf')) {
                    swfPaths[file.leafName] = getURLSpecFromFile(file);
                }
            }

            var replaceSiteUrl = function(url, name, site) {
                let filename = getFileNameFromUrl(url);
                if (filename in swfPaths) {
                    if (name.startsWith('_')) {
                        site[name.replace(/^_/, '')] = swfPaths[filename];
                    } else {  // 先备份
                        site['_' + name] = site[name];
                        site[name] = swfPaths[filename];
                    }
                }
            };

            // 替换地址，因为 iqiyi 有 3个：player0、player1、player2
            for(let [siteName, site] in Iterator(SITES)) {
                for (let [name, url] in Iterator(site)) {
                    if (typeof url === 'string' && url.startsWith('http')) {
                        replaceSiteUrl(url, name, site);
                    }
                }
            }

            debug('成功替换播放器', SITES);

            return Object.keys(swfPaths).length;
        },
        updateSiteInfo: function() {
            this.updateMsgs = [];
            this.updateSize = 0;

            for(let [siteName, info] in Iterator(this.y.SITES)) {
                for (let [prop, value] in Iterator(info)) {
                    if (typeof value === 'string' && value.startsWith('http')) {
                        this.updateSize += 1;
                        // 备份
                        if (!prop.startsWith('_')) {
                            info['_' + prop] = info[prop];
                        }
                        // 去掉前面的 _
                        this._updateOneInfo(info, prop.replace(/^_/, ''), value);
                    }
                }
            }
        },
        _updateOneInfo: function(info, propName, url) {
            var self = this;

            var downloader = new Downloader(url, this.swfDir);
            downloader.run(function (aFile, state) {
                var msg;
                if (aFile) {
                    info[propName] = getURLSpecFromFile(aFile);
                    msg = '成功下载并替换 ' + aFile.leafName + ' 为 ' + info[propName];
                } else {
                    msg = url + ' <b>' + (updateStates[state] || state) + '</b>';
                }

                self.updateMsgs.push(msg);

                if (self.updateMsgs.length == self.updateSize) {
                    self.showUpdateMsg(self.updateMsgs.join('<br>'));
                    debug('更新并替换播放器', self.y.SITES);
                }
            });
        },
        showUpdateMsg: function(html) {
            openLinkIn('data:text/html;charset=utf-8,' + encodeURIComponent(html), 'tabshifted', {});
        },
        openPrefs: function() {
            let xul = '<?xml version="1.0"?>\
                <?xml-stylesheet href="chrome://global/skin/" type="text/css"?>\
                \
                <prefwindow\
                    xmlns="http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul"\
                    id="YoukuAntiADs"\
                    windowtype="YoukuAntiADs:Preferences">\
                    <prefpane id="main" flex="1">\
                        <preferences>\
                            <preference id="enable" type="bool" name="userChromeJS.YoukuAntiADs.enable"/>\
                            <preference id="localPlayereEnable" type="bool" name="userChromeJS.YoukuAntiADs.localPlayer.enable"/>\
                            <preference id="swfDir" type="string" name="userChromeJS.YoukuAntiADs.swfDir"/>\
                        </preferences>\
                        <checkbox label="是否启用" preferences="enable" />\
                        <checkbox label="是否启用本地播放器" preferences="localPlayereEnable" />\
                         <groupbox>\
                            <caption label="本地播放器的路径"/>\
                                 <hbox>\
                                   <textbox id="textbox_path" flex="1" preference="swfDir"/>\
                                   <button id="choosePath" label="浏览" oncommand="YoukuAntiADsConfig.pickPath()" width="90"/>\
                                 </hbox>\
                        </groupbox>\
                    </prefpane>\
                    <script>\
                        var YoukuAntiADsConfig = {\
                            mainWin: Components.classes["@mozilla.org/appshell/window-mediator;1"].getService(Components.interfaces.nsIWindowMediator).getMostRecentWindow("navigator:browser"),\
                            pickPath: function() {\
                                var aFolder = this.mainWin.getSwfDir(true);\
                                if (aFolder) {\
                                    document.getElementById("textbox_path").value = aFolder.path;\
                                }\
                            }\
                        };\
                    </script>\
                </prefwindow>\
                ';

            window.openDialog(
                "data:application/vnd.mozilla.xul+xml;charset=UTF-8," + encodeURIComponent(xul), '',
                'chrome,titlebar,toolbar,centerscreen,dialog=no');
        }
    };

    function Downloader(url, swfDir) {
        this.init.apply(this, arguments);
    }
    Downloader.prototype = {
        get player() {
            var file = this.swfDir.clone();
            file.append(this.filename);
            delete this.player;
            return this.player = file;
        },

        init: function(url, swfDir) {
            this.url = url;
            this.uri = NetUtil.newURI(url);
            this.swfDir = swfDir;

            this.filename = getFileNameFromUrl(url);
        },
        run: function(callback) {
            if (this.player.exists()) {
                this.checkUpdate(this.player, callback);
            } else {
                this.startDownload(callback);
            }
        },
        checkUpdate: function(aFile, callback) {
            var self = this;

            var xhr = Instances.xhr;
            xhr.open('HEAD', this.url, true);
            xhr.onload = function() {
                if (xhr.status != 200) {
                    callback(null, updateStates.urlNotExists)
                    return;
                }
                var modifiedTime = xhr.getResponseHeader("Last-Modified");
                // 可能存在 null 的情况
                modifiedTime = new Date(modifiedTime).getTime();
                if (modifiedTime > aFile.lastModifiedTime) {
                    self.startDownload(callback)
                } else {
                    callback(null, updateStates.noUpdate)
                }
            };
            xhr.onerror = function() {
                callback(null, updateStates.xhrError)
            };
            xhr.timeout = XHR_TIMEOUT;
            xhr.ontimeout = function(event) {
                callback(null, updateStates.xhrTimeout)
            };
            xhr.send(null);
        },
        startDownload: function(callback) {
            var targetFile = this.player;

            var persist = Instances.wbp;
            persist.persistFlags = persist.PERSIST_FLAGS_FROM_CACHE
                                 | persist.PERSIST_FLAGS_REPLACE_EXISTING_FILES;
            persist.progressListener = {
                onProgressChange: function(progress, request, aCurSelfProgress, aMaxSelfProgress, aCurTotalProgress, aMaxTotalProgress) {},
                onStateChange: function(progress, request, flags, status) {
                    if ((flags & Ci.nsIWebProgressListener.STATE_STOP) && status == 0) {
                        if (typeof callback === 'function') {
                            callback(targetFile);
                        }
                    }
                }
            };

            persist.saveURI(this.uri, null, null, null, "", targetFile, null);
        },
    };

    function $(id) document.getElementById(id)
    function $C(name, attr) {
        var el = document.createElement(name);
        if (attr) Object.keys(attr).forEach(function(n) el.setAttribute(n, attr[n]));
        return el;
    }

    function getFileNameFromUrl(url) {
        var m = url.match(/[^\/]+$/);
        if (m) {
            return m[0];
        }
    }

})();


window.mYoukuAntiADs.init();
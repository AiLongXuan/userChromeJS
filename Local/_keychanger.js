//2016.06.14

//Fn功能鍵

//組合鍵
keys['Alt+W'] = "gWHT.addWord();";//WordHighlight添加詞
keys['Alt+X'] = "gWHT.destroyToolbar();";//WordHighlight取消工具栏

keys['Ctrl+G'] = "var s = prompt('站内搜索——请输入待搜索字符串', '');if (s.length > 0) gBrowser.addTab('http://www.google.com/search?q=site:' + encodeURIComponent(content.location.host) + ' ' + encodeURIComponent(s));";//Google站内搜索

keys['Ctrl+H'] = "PlacesCommandHook.showPlacesOrganizer('History');";//我的足迹（历史）

keys['Ctrl+I'] = function() {
try {
var file = Components.classes["@mozilla.org/file/directory_service;1"].getService(Components.interfaces.nsIProperties).get("ProgF", Components.interfaces.nsILocalFile);
file.append("Internet Explorer");
file.append("iexplore.exe");
var process = Cc["@mozilla.org/process/util;1"].createInstance(Ci.nsIProcess);
process.init(file);
process.run(false, [content.location.href], 1);
} catch (ex) {
alert("\u6253\u5f00IE\u5931\u8d25!")
}
};//用IE打开当前页

keys['Ctrl+K'] = function() {
KeyChanger.makeKeyset();//KeyChanger
Redirector.reload();//Redirector
UCL.rebuild();//UserCSSLoader
USL.rebuild();//UserScriptLoader
anobtn.reload();//anobtn
addMenu.rebuild();//AddmenuPlus
MyMoveButton.delayRun();//Movebutton
/*showFlagS.rebuild();//ShowFlagS整合版*/
FeiRuoNet.Rebuild();//FeiRuoNet
};//群体重新载入，按顺序进行，遇到失效的将终止，所以请保证所有重载都是有效的。

keys['Ctrl+R'] = "gBrowser.selectedTab = gBrowser.addTab('resource://redirector-at-einaregilsson-dot-com/redirector.html');";//Redirector擴展設置頁面

/*keys['Shift+U'] = function() {
Components.classes["@mozilla.org/file/directory_service;1"].getService(Components.interfaces.nsIProperties).get("UChrm", Components.interfaces.nsILocalFile).reveal();
};//Chrome文件夹
keys['1'] = "gBrowser.selectedTab = gBrowser.addTab('https://www.google.com/ncr');";//Google
keys['5'] = function(){var newtabs=["http://ic.sjlpj.cn/UpShelf/OperationManageList","http://www.tvc-mall.com/"];var i=0;while(i<=newtabs.length-1){gBrowser.selectedTab=gBrowser.addTab(newtabs[i]);i=i+1;}};//一键打开标签组
keys['Ctrl+F'] = function() {var path = addMenu.handleRelativePath('\\chrome\\local\\FSCapture\\FSCapture.exe');addMenu.exec(path, []);};//启动FSCapture
keys['W'] = function() {
var Setting = "userchromejs.data.BingDesktopTheme";
gPrefService.setIntPref(Setting, 0);
setBingTheme();
};
keys['Shift+E'] = "window._ehhWrapper.toggleSelection();";//EHH快捷键
*/
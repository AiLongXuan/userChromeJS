
//2015.01.23 09:00 新增ft.com
//2015.01.18 08:00 新增economist.com
//2015.01.15 新增wsj.com
//2014.12.16 增加poco
//2014.11.25 增加chiphell,niunews
//2014.11.09 增加pconline和postimg

//   @NORMAL：不改变referer
//   @FORGE：发送根站点referer
//   @ORIGINAL：发送打开站点referer
//   @BLOCK : 发送空referer

sites = {
    //自定义
    'ft.com': 'https://www.google.com/',//免登陆或订阅看全文
    'economist.com': 'https://www.google.com/',//突破每週3篇限制 
    'wsj.com': 'https://www.google.com/',//免登陆或订阅看全文
    'pconline.com.cn': '@FORGE',
    'postimg.org': '@FORGE',
    'chiphell.com': '@FORGE',
    'niunews.cn': '@FORGE',
    'poco.cn': '@FORGE',
    'about:blank': '@NORMAL',
    'jump.bdimg.com': '@NORMAL',
    'img.liufen.com': 'http://www.liufen.com.cn/',
    't4.mangafiles.com' : 'http://www.imanhua.com/',
    't5.mangafiles.com' : 'http://www.imanhua.com/',
    'laibafile.cn' : 'http://www.tianya.cn/',
    'zol.com.cn' : '@FORGE',
    'tmoke.com': '@BLOCK',
    '51img1.com' : '@FORGE',
    'zol-img.com.cn' : '@FORGE',
    
    // 
    'douban.com': 'http://www.douban.com',
    'yyets.com': 'http://www.yyets.com/',
    'img.cnbeta.com': '@FORGE',
     
    // baidu 相关网站
    'hiphotos.baidu.com': '@FORGE',
    'hiphotos.bdimg.com' : '@FORGE',
    'imgsrc.baidu.com': '@FORGE',
    'baidu-img.cn': 'http://www.baidu.com/',

    // sina
    'photo.sina.com.cn': '@BLOCK',
    'sinaimg.cn': 'http://blog.sina.com.cn/',
 
    'pixiv.net': '@FORGE',
    'ph.126.net' : '@FORGE',
    'isnowfy.com': '@FORGE',
    'image.itmedia.co.jp': '@FORGE',
    '2ch.net': '@FORGE',
    'imepita.jp': '@ORIGINAL',
    'tumblr.com': '@FORGE',
    'photo.store.qq.com': '@FORGE',
    'img.pconline.com.cn': '@FORGE',
    'fc2.com': '@BLOCK',
    'blogs.yahoo.co.jp': '@BLOCK',
    'hentaiverse.net': '@BLOCK',
    'qlogo.cn': '@BLOCK',
    'qpic.cn': '@BLOCK',
    'fmn.rrfmn.com': '@BLOCK',
    'postimage.org': '@FORGE',
 
    'bdstatic.com': 'http://tieba.baidu.com/',
    'space.wenxuecity.com': 'http://bbs.wenxuecity.com/',
    'www.autoimg.cn': 'http://club.autohome.com.cn/',
    'kkkmh.com': 'http://www.kkkmh.com/',
    'nonie.1ting.com': 'http://www.1ting.com/',
    'img.knb.im': 'http://www.kenengba.com/',
    'tianya.cn': 'http://bbs.tianya.cn/',
    'xici.net': 'http://www.xici.net/',
    'media.chinagate.com': 'http://www.wenxuecity.com/',
    'jdstatic.tankr.net': 'http://jandan.net/',
    'sankakustatic.com': 'http://chan.sankakucomplex.com/',
};
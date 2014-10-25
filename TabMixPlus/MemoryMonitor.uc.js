// ==UserScript==
// @name           MemoryMonitorMod.uc.js
// @description    简单的FF内存监视器
// @include        main
// @charset        UTF-8
// @note           2014.02.10 删除自动重启功能，修复分级颜色显示：正常显示为黑色，超过预警值的0.6倍为蓝色，超出预警值显示为红色
// @note           2014.02.08 基于原MemoryMonitorMod.uc.js修改，兼容FF28+
// ==/UserScript==
var ucjsMM = {
	_interval : 10000,
	//内存刷新周期, 单位 ms
	_Warningvalue : 900,  //内存预警值, 单位 MB
	_Warningcolor : 'red',
	_Stdvalue3 : 700,  //颜色3
	_Stdcolor3 : 'orange',
	_Stdvalue2 : 400,  //颜色2
	_Stdcolor2 : 'green',
	_Stdvalue1 : 200,  //颜色1
	_Stdcolor1 : 'blue',
	_MemoryValue : 0,  //内存初始值
	_Memorycolor : 'black',
	_prefix : 'MB',    //内存单位

	interval : null,
	init : function () {
		var toolbar = document.getElementById('urlbar-icons');
		var memoryPanel = document.createElement('statusbarpanel');
		memoryPanel.id = 'MemoryDisplay';
		memoryPanel.setAttribute('label', ucjsMM._MemoryValue + ucjsMM._prefix);
		memoryPanel.setAttribute('tooltiptext', '内存监视器，点击打开about:memory');
		document.getElementById("page-report-button").parentNode.insertBefore(memoryPanel, document.getElementById("page-report-button").nextSibling);
		this.start();
		this.interval = setInterval(this.start, this._interval);
	},
	start : function () {
		try {
			const Cc = Components.classes;
			const Ci = Components.interfaces;
			var MemReporters = Cc['@mozilla.org/memory-reporter-manager;1'].getService(Ci.nsIMemoryReporterManager);
			var workingSet = MemReporters.resident;
			ucjsMM._MemoryValue = Math.round(workingSet / (1024 * 1024));
			var displayValue = ucjsMM.addFigure(ucjsMM._MemoryValue);
			var memoryPanel = document.getElementById('MemoryDisplay');
			memoryPanel.setAttribute('label', displayValue + ucjsMM._prefix);
			memoryPanel.setAttribute('onclick', "openUILinkIn('about:memory','tab')");
			if (displayValue > ucjsMM._Warningvalue) {
				memoryPanel.style.color = ucjsMM._Warningcolor;
			} else {
				if (displayValue > ucjsMM._Stdvalue3)
					memoryPanel.style.color = ucjsMM._Stdcolor3;
				else {
					if (displayValue > ucjsMM._Stdvalue2)
						memoryPanel.style.color = ucjsMM._Stdcolor2;
					else {
					if (displayValue > ucjsMM._Stdvalue1)
						memoryPanel.style.color = ucjsMM._Stdcolor1;
					else
						memoryPanel.style.color = ucjsMM._Memorycolor;
					}
				}
			}
		} catch (ex) {
			clearInterval(ucjsMM.interval);
		}
	},
	addFigure : function (str) {
		var num = new String(str).replace(/,/g, '');
		while (num != (num = num.replace(/^(-?\d+)(\d{3})/, '$1,$2')));
		return num;
	}
}
ucjsMM.init();

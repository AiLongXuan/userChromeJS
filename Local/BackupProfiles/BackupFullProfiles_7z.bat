
::2015.07.02 11:00  ��ӄh��헣�����С�{��
::2015.06.19 16:00  ����؆�
::2015.06.12 21:00  ������Ҫ�h�����Ŀ�����}�u��h������Ӱ��ԭ�ļ���
::2015.06.12 18:00  Create

echo off
Title QingFox����������
ECHO.&ECHO.�����_ʼFirefox��������������Ҫ�P�]Firefox����Ո�����Ҫ���Y��! �������I�^�m��&PAUSE >NUL 2>NUL

rem �O�Â��·���Լ��R�r�ļ��A
taskkill /im firefox.exe
@echo �P�]����g�[�����Ԅ��_ʼ��ݡ���
cd /d %~dp0
::������������λ�õ�Mozilla Firefox���ļ��A��������4��
set BackDir=..\..\..\..
set TempFolder=..\..\..\..\CingFox

taskkill /im firefox.exe

@echo ���firefox�ļ��A================================
::firefox��pcxFirefox������
xcopy "%BackDir%\firefox" %TempFolder%\firefox\  /s /y /i

@echo ���Plugins�ļ��A================================
::Plugins�����ñ�Я���
xcopy "%BackDir%\Plugins" %TempFolder%\Plugins\  /s /y /i

::��Ҫ�h������
del %TempFolder%\Plugins\sumatrapdfcache\  /s /q

@echo ���Software�ļ��A================================
::Software������ܛ��
xcopy "%BackDir%\Software" %TempFolder%\Software\  /s /y /i

::��Ҫ�h������
del %TempFolder%\Software\GFW\goagent\local\proxy.user.ini  /s /q
del %TempFolder%\Software\GFW\Shadowsocks\gui-config.json  /s /q
del %TempFolder%\Software\GFW\psiphon\psiphon3.exe.orig  /s /q 
del %TempFolder%\Software\GFW\GoGoTester\gogo_cache  /s /q 

@echo ���Profiles�ļ��A================================
rem ����Ŀ���ļ����R�r�ļ��A

::�������ļ��A
::adblockplus��ABPҎ�t��ݡ�
xcopy "%BackDir%\Profiles\adblockplus" %TempFolder%\Profiles\adblockplus\  /s /y /i
::autoproxy��AutoproxyҎ�t��ݡ�
xcopy "%BackDir%\Profiles\autoproxy" %TempFolder%\Profiles\autoproxy\  /s /y /i
::chrome��UC�_����
xcopy "%BackDir%\Profiles\chrome" %TempFolder%\Profiles\chrome\  /s /y /i
::extensions�����b�ĔUչ��
xcopy "%BackDir%\Profiles\extensions" %TempFolder%\Profiles\extensions\ /s /y /i
::extension-data��uBlock�Ĕ����ļ��������O�á�
xcopy "%BackDir%\Profiles\extension-data" %TempFolder%\Profiles\extension-data\ /s /y /i
::gm_scripts�����b���ͺ��_����
xcopy "%BackDir%\Profiles\gm_scripts" %TempFolder%\Profiles\gm_scripts\ /s /y /i
::Plugins����Я������
xcopy "%BackDir%\Profiles\Plugins" %TempFolder%\Profiles\Plugins\ /s /y /i

::��Ҫ�h������
del %TempFolder%\Profiles\chrome\UserScriptLoader\require\  /s /q
del %TempFolder%\Profiles\extensions\userChromeJS@mozdev.org\content\myNewTab\bingImg\  /s /q
 
::�������ļ�
::cert_override.txt������ʹ����ָ��������֤��(certification exceptions)��
xcopy "%BackDir%\Profiles\cert_override.txt" %TempFolder%\Profiles\ /y
::cert8.db����ȫ֤�顣
xcopy "%BackDir%\Profiles\cert8.db" %TempFolder%\Profiles\ /y
::FlashGot.exe��FlashGot�����ع��ߡ�
xcopy "%BackDir%\Profiles\FlashGot.exe" %TempFolder%\Profiles\ /y
::foxyproxy.xml��FoxyProxy���O�ü���ַ�б��ݡ�
::xcopy "%BackDir%\foxyproxy.xml" %TempFolder%\ /y
::localstore.rdf�����������Ӵ���С��λ�õ��O�����Еr�h�����Խ��һЩ�����ϵ����⡣
xcopy "%BackDir%\Profiles\localstore.rdf" %TempFolder%\Profiles\ /y
::mimeTypes.rdf�������ض����͵ĵ����rҪִ�еĄ����� �Ʉh������ԭԭ�����ص��O����
xcopy "%BackDir%\Profiles\mimeTypes.rdf" %TempFolder%\Profiles\ /y
::MyFirefox.7z����춹ٷ�FX�ı�Я�O�á�
xcopy "%BackDir%\Profiles\MyFirefox.7z" %TempFolder%\Profiles\ /y
::patternSubscriptions.json��FoxyProxy��ӆ��б��O�á�
::xcopy "%BackDir%\patternSubscriptions.json" %TempFolder%\ /y
::permissions.sqlite������ض���վ�Ƿ�ɴ�ȡ���롢cookies�������Ӵ���ͼƬ�����븽��Ԫ��������Ȩ�޵����Ͽ⡣
xcopy "%BackDir%\Profiles\permissions.sqlite" %TempFolder%\Profiles\ /y
::persdict.dat�����˵�ƴ���ֵ䡣
xcopy "%BackDir%\Profiles\persdict.dat" %TempFolder%\Profiles\ /y
::pluginreg.dat������plugin��MIME types��
xcopy "%BackDir%\Profiles\pluginreg.dat" %TempFolder%\Profiles\ /y
::Portable.7z��PCXFirefox�ı�Я�O�á�
xcopy "%BackDir%\Profiles\Portable.7z" %TempFolder%\Profiles\ /y
::readme.txt�����������޸�˵����
xcopy "%BackDir%\Profiles\readme.txt" %TempFolder%\Profiles\ /y
::stylish.sqlite��Stylish��ʽ���ݿ⡣
xcopy "%BackDir%\Profiles\stylish.sqlite" %TempFolder%\Profiles\ /y
::user.js��ʹ�����Զ����O������������O������prefs.js���O����
xcopy "%BackDir%\Profiles\user.js" %TempFolder%\Profiles\ /y
::xulstore.json�������һЩ״̬��
xcopy "%BackDir%\Profiles\xulstore.json" %TempFolder%\Profiles\ /y

::�xȡ�汾̖�����ڼ��r�g
::������������λ�õ�Firefox�����ļ��У�firefox����������4��
for /f "usebackq eol=; tokens=1,2 delims==" %%i in ("..\..\..\..\Firefox\application.ini")do (if %%i==Version set ver=%%j)
::�O�Â���ļ�·���Լ��ļ���

::�������ں͕r�g
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
set tm4=%time:~0,8%
set da1=%date:~0,4%
set da2=%date:~5,2%
set da3=%date:~8,2%
set ArchiveName=D:\CingFox_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
set ArchiveName=D:\CingFox_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

rem �_ʼ���
7z.exe u -up1q3r2x2y2z2w2 %ArchiveName% "%TempFolder%"
@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" /s/q

ECHO.&ECHO.Firefox�������Ѵ����ɣ�Ո�������I �؆�Firefox �K�˳���&PAUSE >NUL 2>NUL

@ping 127.0.0.1>nul
@start ..\..\..\..\Firefox\firefox.exe

@exit

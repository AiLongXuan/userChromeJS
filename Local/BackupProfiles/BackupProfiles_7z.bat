
::2015.07.05 22:00  ��ӄh���
::2015.06.30 13:00  ����prefs.js
::2015.06.19 16:00  ����؆�
::2015.06.12 20:00  ���}�u��h������Ӱ��ԭ�ļ�
::2015.06.08 14:00  ����_ʼ���ǰ����ʾ
::2015.06.01 20:00  ������Profiles���h��һЩ����Ҫ���Ŀ
::2015.05.27 18:00  �Q��Autoproxy�����ق��Foxy����
::2015.04.16 08:00  �����헣�����f��
::2015.01.26 12:00  �㶨�˕r�g����

echo off
Title ���Firefox�����ļ��A by Cing
ECHO.&ECHO.�����_ʼProfiles���ô������Ҫ�P�]Firefox����Ո�����Ҫ���Y��! �������I�^�m��&PAUSE >NUL 2>NUL

rem �O�Â��·���Լ��R�r�ļ��A
taskkill /im firefox.exe
@echo �P�]����g�[�����Ԅ��_ʼ��ݡ���
cd /d %~dp0
::������������λ�õ������ļ��У�Profiles����������3��
set BackDir=..\..\..
set TempFolder=..\..\..\Temp\Profiles

taskkill /im firefox.exe

rem ����Ŀ���ļ����R�r�ļ��A

::�������ļ��A
::adblockplus��ABPҎ�t��ݡ�
xcopy "%BackDir%\adblockplus" %TempFolder%\adblockplus\  /s /y /i
::autoproxy��AutoproxyҎ�t��ݡ�
xcopy "%BackDir%\autoproxy" %TempFolder%\autoproxy\  /s /y /i
::chrome��UC�_����
xcopy "%BackDir%\chrome" %TempFolder%\chrome\  /s /y /i
::extensions�����b�ĔUչ��
xcopy "%BackDir%\extensions" %TempFolder%\extensions\ /s /y /i
::extension-data��uBlock�Ĕ����ļ��������O�á�
xcopy "%BackDir%\extension-data" %TempFolder%\extension-data\ /s /y /i
::gm_scripts�����b���ͺ��_����
xcopy "%BackDir%\gm_scripts" %TempFolder%\gm_scripts\ /s /y /i
::Plugins����Я������
xcopy "%BackDir%\Plugins" %TempFolder%\Plugins\ /s /y /i
 
::��Ҫ�h������
del %TempFolder%\chrome\UserScriptLoader\require\  /s /q
del %TempFolder%\extensions\userChromeJS@mozdev.org\content\myNewTab\bingImg\  /s /q
del %TempFolder%\extensions\inspector@mozilla.org\chrome\inspector\locale\de\  /s /q
del %TempFolder%\extensions\inspector@mozilla.org\chrome\inspector\locale\en-GB\  /s /q
del %TempFolder%\extensions\inspector@mozilla.org\chrome\inspector\locale\pl\  /s /q
del %TempFolder%\extensions\inspector@mozilla.org\chrome\inspector\locale\ru\  /s /q
del %TempFolder%\extensions\inspector@mozilla.org\chrome\inspector\locale\sk\  /s /q
del %TempFolder%\extensions\support@lastpass.com\platform\Darwin\  /s /q
del %TempFolder%\extensions\support@lastpass.com\platform\Darwin_x86_64-gcc3\  /s /q
del %TempFolder%\extensions\support@lastpass.com\platform\Linux_x86_64-gcc3\  /s /q
del %TempFolder%\extensions\support@lastpass.com\platform\Linux_x86-gcc3\  /s /q
del %TempFolder%\gm_scripts\picviewer_CE.db  /s /q
del %TempFolder%\gm_scripts\picviewer_CE.db-shm  /s /q
del %TempFolder%\gm_scripts\picviewer_CE.db-wal  /s /q
del %TempFolder%\gm_scripts\YouTube_Auto_Buffer_&_Auto_HD.db  /s /q
del %TempFolder%\gm_scripts\�@�^վ�c�ȴ����R�e�a�����.db  /s /q
del %TempFolder%\gm_scripts\������վ�ȴ�����֤�뼰��¼.db  /s /q
del %TempFolder%\gm_scripts\�@�^վ�c�ȴ����R�e�a�����.db-shm  /s /q
del %TempFolder%\gm_scripts\������վ�ȴ�����֤�뼰��¼.db-wal  /s /q

::�������ļ�
::bookmarks.html���Ԅӵ�������ǩ��ݡ�
xcopy "%BackDir%\bookmarks.html" %TempFolder%\ /y
::cert_override.txt������ʹ����ָ��������֤��(certification exceptions)��
xcopy "%BackDir%\cert_override.txt" %TempFolder%\ /y
::cert8.db����ȫ֤�顣
xcopy "%BackDir%\cert8.db" %TempFolder%\ /y
::FlashGot.exe��FlashGot�����ع��ߡ�
xcopy "%BackDir%\FlashGot.exe" %TempFolder%\ /y
::foxyproxy.xml��FoxyProxy���O�ü���ַ�б��ݡ�
::xcopy "%BackDir%\foxyproxy.xml" %TempFolder%\ /y
::localstore.rdf�����������Ӵ���С��λ�õ��O�����Еr�h�����Խ��һЩ�����ϵ����⡣
xcopy "%BackDir%\localstore.rdf" %TempFolder%\ /y
::mimeTypes.rdf�������ض����͵ĵ����rҪִ�еĄ����� �Ʉh������ԭԭ�����ص��O����
xcopy "%BackDir%\mimeTypes.rdf" %TempFolder%\ /y
::MyFirefox.7z����춹ٷ�FX�ı�Я�O�á�
xcopy "%BackDir%\MyFirefox.7z" %TempFolder%\ /y
::patternSubscriptions.json��FoxyProxy��ӆ��б��O�á�
::xcopy "%BackDir%\patternSubscriptions.json" %TempFolder%\ /y
::permissions.sqlite������ض���վ�Ƿ�ɴ�ȡ���롢cookies�������Ӵ���ͼƬ�����븽��Ԫ��������Ȩ�޵����Ͽ⡣
xcopy "%BackDir%\permissions.sqlite" %TempFolder%\ /y
::persdict.dat�����˵�ƴ���ֵ䡣
xcopy "%BackDir%\persdict.dat" %TempFolder%\ /y
::pluginreg.dat������plugin��MIME types��
xcopy "%BackDir%\pluginreg.dat" %TempFolder%\ /y
::Portable.7z��PCXFirefox�ı�Я�O�á�
xcopy "%BackDir%\Portable.7z" %TempFolder%\ /y
::prefs.js��About:config�Ѓ�����O����
xcopy "%BackDir%\prefs.js" %TempFolder%\ /y
::readme.txt�����������޸�˵����
xcopy "%BackDir%\readme.txt" %TempFolder%\ /y
::stylish.sqlite��Stylish��ʽ���ݿ⡣
xcopy "%BackDir%\stylish.sqlite" %TempFolder%\ /y
::user.js��ʹ�����Զ����O������������O������prefs.js���O����
xcopy "%BackDir%\user.js" %TempFolder%\ /y
::xulstore.json�������һЩ״̬��
xcopy "%BackDir%\xulstore.json" %TempFolder%\ /y

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
set ArchiveName=D:\Profiles_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
set ArchiveName=D:\Profiles_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

rem �_ʼ���
7z.exe u -up1q3r2x2y2z2w2 %ArchiveName% "%TempFolder%"
@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" /s/q

ECHO.&ECHO.Firefox�����Ѵ����ɣ�Ո�������I �؆�Firefox �K�˳���&PAUSE >NUL 2>NUL

@ping 127.0.0.1>nul
@start ..\..\..\..\Firefox\firefox.exe

@exit
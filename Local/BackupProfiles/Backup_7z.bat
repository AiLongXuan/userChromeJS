
::2015.10.06  �����f��չʾ��ʽ
::2015.10.04  ģ�K��ÿ������Ŀ��Ȼ���ٽM�ϣ������ޔ��S�o
::2015.10.02  �����Uչ�Z��
::2015.10.01  ����ݔ����ַ
::2015.09.26  �_��7zip�O�މ��s
::2015.08.08  ���x��Flash���d��ַ
::2015.07.14  ��ӂ���~���user.js��GitHub
::2015.07.14  ����Flash���ص�ַ
::2015.07.13  4��1����

@echo off
Title �����̎�����ϰ� by Cing
::һ��������7-zip�����ַ
set zip="D:\Program Files\7-Zip\7z.exe"

:menu
cls
ECHO.
ECHO  �����̎�����ϰ�                           
ECHO.
ECHO  01�����Firefox�����ļ��A
ECHO  02��CingFox����������
ECHO  03�����Plugins��Software�ļ��A
ECHO  04����ȡFlash32λ���
ECHO  05�����һЩ�ļ���GitHub
ECHO.
set /p a=�����������Ų��س�������01����
cls

if %a%==01 goto Profiles
if %a%==02 goto CingFox
if %a%==03 goto Plugins-n-Software
if %a%==04 goto Flash32
if %a%==05 goto GitHub
goto cho

:Profiles
cls
ECHO.
ECHO  ���Firefox�����ļ��A
ECHO.
ECHO  1.ִ��
ECHO  2.����
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto Profiles-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:Profiles-1
cls
echo.
echo  **ע�⣺
echo.
echo  1. ��Ҫ�P�]Firefox����Ո�����Ҫ���Y��!
echo  2. �������ᣬ�������I�؆�Firefox
echo.
echo  By Cing
echo.
echo  ���������������
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
@echo �P�]����g�[�����Ԅ��_ʼ��ݡ���
cd /d %~dp0
::������������λ�õ������ļ��У�Profiles����������3��
set BackDir=..\..\..
set TempFolder=..\..\..\Temp\Profiles
set TempFolder1=..\..\..\Temp\1
set TempFolder2=..\..\..\Temp\2
set TempFolder3=..\..\..\Temp\3

::���ݔ����ַ
set TargetFolder="D:\My Documents\Baiduyun\Firefox\Profiles"

taskkill /im firefox.exe

rem ����Ŀ���ļ����R�r�ļ��A

::�������ļ��A
::adblockplus��ABPҎ�t��ݡ�
::xcopy "%BackDir%\adblockplus" %TempFolder%\adblockplus\  /s /y /i
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
::SimpleProxy��SimpleProxy�����б�
xcopy "%BackDir%\SimpleProxy" %TempFolder%\SimpleProxy\ /s /y /i

::�h��Lastpass��һЩ��Ŀ
::��һ������Platform
del %TempFolder%\extensions\support@lastpass.com\platform\  /s /q
xcopy "%BackDir%\extensions\support@lastpass.com\platform\WINNT_x86_64-msvc" %TempFolder%\extensions\support@lastpass.com\platform\WINNT_x86_64-msvc\ /s /y /i
::����������lastpass.jar�е�����
%zip% x %TempFolder%\extensions\support@lastpass.com\chrome\lastpass.jar -o%TempFolder1%\lastpass
del %TempFolder%\extensions\support@lastpass.com\chrome\lastpass.jar  /s /q
xcopy "%TempFolder1%\lastpass\locale\en-US" %TempFolder2%\lastpass\locale\en-US\ /s /y /i
xcopy "%TempFolder1%\lastpass\locale\zh-CN" %TempFolder2%\lastpass\locale\zh-CN\ /s /y /i
xcopy "%TempFolder1%\lastpass\locale\zh-TW" %TempFolder2%\lastpass\locale\zh-TW\ /s /y /i
%zip% a -tzip -mx9 "%TempFolder1%\lastpass.jar" "%TempFolder1%\lastpass\content\" "%TempFolder1%\lastpass\icons\" "%TempFolder1%\lastpass\META-INF\" "%TempFolder1%\lastpass\skin\" "%TempFolder2%\lastpass\locale\"
xcopy "%TempFolder1%\lastpass.jar" %TempFolder%\extensions\support@lastpass.com\chrome\ /s /y /i

::�h��Inspector������
del %TempFolder%\extensions\inspector@mozilla.org\chrome\inspector\locale\  /s /q
xcopy "%BackDir%\extensions\inspector@mozilla.org\chrome\inspector\locale\en-US" %TempFolder%\extensions\inspector@mozilla.org\chrome\inspector\locale\en-US\ /s /y /i

::�h��FlashGot�Z��
%zip% x %TempFolder%\extensions\{19503e42-ca3c-4c27-b1e2-9cdb2170ee34}.xpi -o%TempFolder1%\flashgot
del %TempFolder%\extensions\{19503e42-ca3c-4c27-b1e2-9cdb2170ee34}.xpi  /s /q
%zip% x %TempFolder1%\flashgot\chrome\flashgot.jar -o%TempFolder2%\flashgot
del %TempFolder1%\flashgot\chrome\flashgot.jar  /s /q
xcopy "%TempFolder2%\flashgot\locale\en-US" %TempFolder3%\flashgot\locale\en-US\ /s /y /i
xcopy "%TempFolder2%\flashgot\locale\zh-CN" %TempFolder3%\flashgot\locale\zh-CN\ /s /y /i
xcopy "%TempFolder2%\flashgot\locale\zh-TW" %TempFolder3%\flashgot\locale\zh-TW\ /s /y /i
%zip% a -tzip -mx9 "%TempFolder2%\flashgot.jar" "%TempFolder2%\flashgot\content\" "%TempFolder2%\flashgot\skin\" "%TempFolder3%\flashgot\locale\"
xcopy "%TempFolder2%\flashgot.jar" %TempFolder1%\flashgot\chrome\ /s /y /i
%zip% a -tzip -mx9 "%TempFolder1%\{19503e42-ca3c-4c27-b1e2-9cdb2170ee34}.xpi" "%TempFolder1%\flashgot\chrome\" "%TempFolder1%\flashgot\components\" "%TempFolder1%\flashgot\defaults\" "%TempFolder1%\flashgot\META-INF\" "%TempFolder1%\flashgot\chrome.manifest" "%TempFolder1%\flashgot\install.js" "%TempFolder1%\flashgot\install.rdf"
xcopy "%TempFolder1%\{19503e42-ca3c-4c27-b1e2-9cdb2170ee34}.xpi" %TempFolder%\extensions\ /s /y /i

::�h��Stylish�Z��
%zip% x %TempFolder%\extensions\{46551EC9-40F0-4e47-8E18-8E5CF550CFB8}.xpi -o%TempFolder1%\stylish
del %TempFolder%\extensions\{46551EC9-40F0-4e47-8E18-8E5CF550CFB8}.xpi  /s /q
xcopy "%TempFolder1%\stylish\locale\en-US" %TempFolder2%\stylish\locale\en-US\ /s /y /i
xcopy "%TempFolder1%\stylish\locale\zh-CN" %TempFolder2%\stylish\locale\zh-CN\ /s /y /i
xcopy "%TempFolder1%\stylish\locale\zh-TW" %TempFolder2%\stylish\locale\zh-TW\ /s /y /i
%zip% a -tzip -mx9 "%TempFolder1%\{46551EC9-40F0-4e47-8E18-8E5CF550CFB8}.xpi" "%TempFolder1%\stylish\components\" "%TempFolder1%\stylish\content\" "%TempFolder1%\stylish\defaults\" "%TempFolder1%\stylish\idl\" "%TempFolder1%\stylish\META-INF\" "%TempFolder1%\stylish\skin\" "%TempFolder1%\stylish\chrome.manifest" "%TempFolder1%\stylish\generate_xpt" "%TempFolder1%\stylish\install.rdf" "%TempFolder2%\stylish\locale\"
xcopy "%TempFolder1%\{46551EC9-40F0-4e47-8E18-8E5CF550CFB8}.xpi" %TempFolder%\extensions\ /s /y /i

::�h��ABP�Z��
%zip% x %TempFolder%\extensions\{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi -o%TempFolder1%\abp
del %TempFolder%\extensions\{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi  /s /q
xcopy "%TempFolder1%\abp\chrome\locale\en-US" %TempFolder2%\abp\chrome\locale\en-US\ /s /y /i
xcopy "%TempFolder1%\abp\chrome\locale\zh-CN" %TempFolder2%\abp\chrome\locale\zh-CN\ /s /y /i
xcopy "%TempFolder1%\abp\chrome\locale\zh-TW" %TempFolder2%\abp\chrome\locale\zh-TW\ /s /y /i
del "%TempFolder1%\abp\chrome\locale"  /s /q
xcopy "%TempFolder2%\abp\chrome\locale" %TempFolder1%\abp\chrome\locale\ /s /y /i
%zip% a -tzip -mx9 "%TempFolder1%\{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi" "%TempFolder1%\abp\chrome\" "%TempFolder1%\abp\defaults\" "%TempFolder1%\abp\lib\" "%TempFolder1%\abp\META-INF\" "%TempFolder1%\abp\bootstrap.js" "%TempFolder1%\abp\chrome.manifest" "%TempFolder1%\abp\icon.png" "%TempFolder1%\abp\icon64.png" "%TempFolder1%\abp\install.rdf"
xcopy "%TempFolder1%\{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi" %TempFolder%\extensions\ /s /y /i

::�h��EHH�Z��
%zip% x %TempFolder%\extensions\elemhidehelper@adblockplus.org.xpi -o%TempFolder1%\ehh
del %TempFolder%\extensions\elemhidehelper@adblockplus.org.xpi  /s /q
xcopy "%TempFolder1%\ehh\chrome\locale\en-US" %TempFolder2%\ehh\chrome\locale\en-US\ /s /y /i
xcopy "%TempFolder1%\ehh\chrome\locale\zh-CN" %TempFolder2%\ehh\chrome\locale\zh-CN\ /s /y /i
xcopy "%TempFolder1%\ehh\chrome\locale\zh-TW" %TempFolder2%\ehh\chrome\locale\zh-TW\ /s /y /i
del "%TempFolder1%\ehh\chrome\locale"  /s /q
xcopy "%TempFolder2%\ehh\chrome\locale" %TempFolder1%\ehh\chrome\locale\ /s /y /i
%zip% a -tzip -mx9 "%TempFolder1%\elemhidehelper@adblockplus.org.xpi" "%TempFolder1%\ehh\chrome\" "%TempFolder1%\ehh\defaults\" "%TempFolder1%\ehh\lib\" "%TempFolder1%\ehh\META-INF\" "%TempFolder1%\ehh\bootstrap.js" "%TempFolder1%\ehh\chrome.manifest" "%TempFolder1%\ehh\icon.png" "%TempFolder1%\ehh\icon64.png" "%TempFolder1%\ehh\install.rdf"
xcopy "%TempFolder1%\elemhidehelper@adblockplus.org.xpi" %TempFolder%\extensions\ /s /y /i

::�h��Greasemonkey�Z��
%zip% x %TempFolder%\extensions\{e4a8a97b-f2ed-450b-b12d-ee082ba24781}.xpi -o%TempFolder1%\gm
del %TempFolder%\extensions\{e4a8a97b-f2ed-450b-b12d-ee082ba24781}.xpi  /s /q
xcopy "%TempFolder1%\gm\locale\en-US" %TempFolder2%\gm\locale\en-US\ /s /y /i
xcopy "%TempFolder1%\gm\locale\zh-CN" %TempFolder2%\gm\locale\zh-CN\ /s /y /i
xcopy "%TempFolder1%\gm\locale\zh-TW" %TempFolder2%\gm\locale\zh-TW\ /s /y /i
%zip% a -tzip -mx9 "%TempFolder1%\{e4a8a97b-f2ed-450b-b12d-ee082ba24781}.xpi" "%TempFolder1%\gm\components\" "%TempFolder1%\gm\content\" "%TempFolder1%\gm\defaults\" "%TempFolder1%\gm\META-INF\" "%TempFolder1%\gm\modules\" "%TempFolder1%\gm\skin\" "%TempFolder1%\gm\chrome.manifest" "%TempFolder1%\gm\CREDITS" "%TempFolder1%\gm\install.rdf" "%TempFolder1%\gm\LICENSE.bsd" "%TempFolder1%\gm\LICENSE.mit" "%TempFolder1%\gm\LICENSE.mpl" "%TempFolder2%\gm\locale\"
xcopy "%TempFolder1%\{e4a8a97b-f2ed-450b-b12d-ee082ba24781}.xpi" %TempFolder%\extensions\ /s /y /i

::�����h����
del %TempFolder%\chrome\UserScriptLoader\require\  /s /q
del %TempFolder%\extensions\userChromeJS@mozdev.org\content\myNewTab\bingImg\  /s /q

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
::xcopy "%BackDir%\prefs.js" %TempFolder%\ /y
::readme.txt�����������޸�˵����
xcopy "%BackDir%\readme.txt" %TempFolder%\ /y
::stylish.sqlite��Stylish��ʽ���ݿ⡣
xcopy "%BackDir%\stylish.sqlite" %TempFolder%\ /y
::user.js��ʹ�����Զ����O������������O������Ĭ���O����
xcopy "%BackDir%\user.js" %TempFolder%\ /y
::xulstore.json�������һЩ״̬��
xcopy "%BackDir%\xulstore.json" %TempFolder%\ /y

::�xȡ�汾̖�����ڼ��r�g
::������������λ�õ�Firefox�����ļ��У�firefox����������4��
for /f "usebackq eol=; tokens=1,2 delims==" %%i in ("..\..\..\..\Firefox\application.ini")do (if %%i==Version set ver=%%j)
::�O�Â���ļ�·���Լ��ļ���

ECHO.&ECHO.Profiles�ļ��A���}�u��ɣ�Ո�������I�^�m��&PAUSE >NUL 2>NUL

:Profiles or CingFox
cls
ECHO.
ECHO  ���Firefox�����ļ��A or CingFox
ECHO.
ECHO  1.���Firefox�����ļ��A
ECHO  2.�����u��CingFox(֮��)
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto Profiles-2
If ErrorLevel 2 If Not ErrorLevel 3 Goto Plugins-n-Software-1

:Profiles-2
cls
::�������ں͕r�g
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
set tm4=%time:~0,8%
set da1=%date:~0,4%
set da2=%date:~5,2%
set da3=%date:~8,2%
::ݔ���ļ���
set Name=Profiles_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
::ݔ���ļ���
set Name=Profiles_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

rem �_ʼ���
::-mx9����ѹ�� -mhc���������ļ�ͷѹ�� -r�ݹ鵽���е���Ŀ¼
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name% "%TempFolder%"
@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" "%TempFolder1%" "%TempFolder2%" "%TempFolder3%" /s/q

ECHO.&ECHO.Firefox�����Ѵ����ɣ�Ո�������I �؆�Firefox �K�˳���&PAUSE >NUL 2>NUL

@ping 127.0.0.1>nul
@start ..\..\..\..\Firefox\firefox.exe

Goto end

:CingFox
cls
ECHO.
ECHO  CingFox����������
ECHO.
ECHO  1.ִ��
ECHO  2.����
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto CingFox-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:CingFox-1
cls
echo.
echo  *** CingFox���������� ***
echo.
echo  **ע�⣺
echo.
echo  1. ��Ҫ�P�]Firefox����Ո�����Ҫ���Y��!
echo  2. 3�����E��Profiles + Plugins&Software + firefox
echo  3. �������ᣬ�������I�؆�Firefox
echo.
echo  By Cing
echo.
echo  ���������������
pause>nul
cls

goto Profiles-1

:pcxFirefox
cls
Title CingFox����������

set BackDir=..\..\..\..
set TempFolder=..\..\..\Temp
xcopy "%BackDir%\firefox" %TempFolder%\firefox\  /s /y /i
goto CingFox-2

:CingFox-2
cls
::CingFoxݔ����ַ
set TargetFolder="D:"

::��Ҫ�h������
del %TempFolder%\Software\GFW\goagent\  /s /q
del %TempFolder%\Software\GFW\IP-Update\  /s /q
del %TempFolder%\Software\GFW\Shadowsocks\  /s /q
del %TempFolder%\Software\GFW\psiphon\psiphon3.exe.orig  /s /q
del %TempFolder%\Profiles\bookmarks.html  /s /q

::�o��һ�����ļ��ACingFox
xcopy "%TempFolder%\firefox" %TempFolder%\CingFox\firefox\ /s /y /i
xcopy "%TempFolder%\Profiles" %TempFolder%\CingFox\Profiles\ /s /y /i
xcopy "%TempFolder%\Plugins" %TempFolder%\CingFox\Plugins\ /s /y /i
xcopy "%TempFolder%\Software" %TempFolder%\CingFox\Software\ /s /y /i

::�������ں͕r�g
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
set tm4=%time:~0,8%
set da1=%date:~0,4%
set da2=%date:~5,2%
set da3=%date:~8,2%
::ݔ���ļ���
set Name=CingFox_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
::ݔ���ļ���
set Name=CingFox_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

rem �_ʼ���
::-mx9����ѹ�� -mhc���������ļ�ͷѹ�� -r�ݹ鵽���е���Ŀ¼
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name% "%TempFolder%\CingFox\"
@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" /s/q

ECHO.&ECHO.Firefox�������Ѵ����ɣ�Ո�������I �؆�Firefox �K�˳���&PAUSE >NUL 2>NUL

@ping 127.0.0.1>nul
@start ..\..\..\..\Firefox\firefox.exe

Goto end

:Plugins-n-Software
cls
ECHO.
ECHO  ���Plugins��Software�ļ��A
ECHO.
ECHO  1.ִ��
ECHO  2.����
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto Plugins-n-Software-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:Plugins-n-Software-1
cls
echo.
echo  *** ���Plugins��Software�ļ��A ***
echo.
echo  By Cing
echo.
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
cd /d %~dp0
::������������λ�õ�Plugins��Software�ļ��A��ֻ����4��
set BackDir=..\..\..\..\
set TempFolder=..\..\..\Temp

rem ����Ŀ���ļ����R�r�ļ��A

::�������ļ��A
::Plugins�����ñ�Я���
xcopy "%BackDir%\Plugins" %TempFolder%\Plugins\  /s /y /i
::Software������ܛ��
xcopy "%BackDir%\Software" %TempFolder%\Software\  /s /y /i

::��Ҫ�h������
del %TempFolder%\Plugins\sumatrapdfcache\  /s /q 
del %TempFolder%\Software\GFW\psiphon\psiphon3.exe.orig  /s /q 
del %TempFolder%\Software\GFW\GoGoTester\gogo_cache  /s /q 

ECHO.&ECHO.Plugins��Software�ļ��A�Ѵ����ɣ�Ո�������I�˳���&PAUSE >NUL 2>NUL

:Plugins-n-Software or CingFox
cls
ECHO.
ECHO  ���Plugins��Software or CingFox
ECHO.
ECHO  1.���Plugins��Software
ECHO  2.�����u��CingFox(֮��)
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto Plugins-n-Software-2
If ErrorLevel 2 If Not ErrorLevel 3 Goto pcxFirefox

:Plugins-n-Software-2
cls
::ݔ����ַ
set TargetFolder="D:\My Documents\Baiduyun\Firefox\Profiles\Software & Plugins"

::�O�Â���ļ�·���Լ��ļ���

::�������ں͕r�g
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
set tm4=%time:~0,8%
set da1=%date:~0,4%
set da2=%date:~5,2%
set da3=%date:~8,2%
set Name=Plugins-n-Software_%da1%%da2%%da3%-%tm1%%tm2%%tm3%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
set Name=Plugins-n-Software_%da1%%da2%%da3%-%tm1%%tm2%%tm3%.7z

rem �_ʼ���
::-mx9����ѹ�� -mhc���������ļ�ͷѹ�� -r�ݹ鵽���е���Ŀ¼
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name% "%TempFolder%\Plugins" "%TempFolder%\Software"
@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" /s/q

ECHO.&ECHO.Plugins��Software�ļ��A�Ѵ����ɣ�Ո�������I�˳���&PAUSE >NUL 2>NUL

Goto end

:Flash32
cls
ECHO.
ECHO  ��ȡFlash32λ���
ECHO.
ECHO  1.ִ��
ECHO  2.����
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto Flash32-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:Flash32-1
cls
echo.
echo  *** ��ȡFlash32λ��� ***
echo.
echo  **ע�⣺
echo.
echo  1.��Ҫ�Ȱ�װ��IE��Adobe Flash Player�����
echo  2.��������������ȡ32λ����������
echo  3.������ȡ64λFlash�����޸�BackDirλ��
echo.
echo  Edit By yndoc��
echo  Mod By Cing
echo.
echo    ���������������
pause>nul

cls
echo.
echo  01�����ٷ����ط�IE��Flash�����װ����ȡ��
echo  02���Ѿ���װ��IE��Flash�����ֱ����ȡ��
echo  03���������ˆΡ�
echo.
set /p id=��ѡ�񣬰��س���ִ�У����磺01��:
cls

if "%id%"=="01" goto install
if "%id%"=="02" goto set
if "%id%"=="03" goto menu

:install
cls
echo.
echo  01����Flash�ٷ����d������ʽ�棡
echo  02����Flash�ٷ����d����beta�棡
echo  03���������ˆΡ�
echo.
set /p id=��ѡ�񣬰��س���ִ�У����磺01��:
cls

if "%id%"=="01" goto download1
if "%id%"=="02" goto download2
if "%id%"=="03" goto menu

:download1
cls
start "" http://www.adobe.com/in/products/flashplayer/distribution3.html
echo.
echo  *����ʱ��Ҫ�رո���������
echo.
echo  *������Ѱ�װ���Adobe Flash Player������밴�������������
pause>nul
goto set

:download2
cls
start "" http://labs.adobe.com/downloads/flashplayer.html
echo.
echo  *����ʱ��Ҫ�رո���������
echo.
echo  *������Ѱ�װ���Adobe Flash Player������밴�������������
pause>nul
goto set

:set
cd /d %~dp0
set BackDir=C:\Windows\SysWOW64\Macromed\Flash
set TempFolder=D:\Flash32
::ݔ����ַ
set TargetFolder="D:\My Documents\Baiduyun\Firefox\��FX����\Flash32λԭ����ȡ��vch��exe"

::�}�u������R�r�ļ��A
xcopy "%BackDir%\NPSWF32*.dll" %TempFolder%\  /s /y /i
xcopy "%BackDir%\FlashPlayerPlugin*.exe" %TempFolder%\  /s /y /i
xcopy "%BackDir%\plugin.vch" %TempFolder%\  /s /y /i

::�xȡ�汾̖
::���˺þã���K����@���ش��ҵ��˴𰸣�http://zhidao.baidu.com/question/289963233.html
for /f "delims=" %%i in ('dir /a-d /b "%BackDir%\NPSWF32*.dll"') do (set ver=%%i)
echo %ver%

::�������ں͕r�g
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
set tm4=%time:~0,8%
set da1=%date:~0,4%
set da2=%date:~5,2%
set da3=%date:~8,2%
set Name=%ver%_%da1%%da2%%da3%-%tm1%%tm2%%tm3%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
set Name=%ver%_%da1%%da2%%da3%-%tm1%%tm2%%tm3%.7z

rem �_ʼ���
::-mx9����ѹ�� -mhc���������ļ�ͷѹ�� -r�ݹ鵽���е���Ŀ¼
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name% "%TempFolder%"
@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" /s/q

ECHO.&ECHO.�Ѵ����ɣ�Ո�������I�˳��������D��ϵ�y/�������/�����c���ܣ�&PAUSE >NUL 2>NUL

::���D��ϵ�y/�������/�����c����
appwiz.cpl
rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl

Goto end

:GitHub
cls
ECHO.
ECHO  ���һЩ�ļ���GitHub
ECHO.
ECHO  1.ִ��
ECHO  2.����
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto GitHub-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:GitHub-1
cls
echo.
echo  *** ���һЩ�ļ���GitHub ***
echo.
echo  **ע�⣺
echo.
echo  1. ���˅����O�ã�user.js
echo  2. �~�䣺persdict.dat
echo  3. Stylish��ʽ�죺stylish.sqlite
echo.
echo  By Cing
echo.
echo  ���������������
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
cd /d %~dp0
set dir1=..\..\..
set dir2=D:\My Documents\GitHub\Customization
xcopy "%dir1%\persdict.dat" "%dir2%\persdict.dat"  /s /y /i
xcopy "%dir1%\stylish.sqlite" "%dir2%\stylish.sqlite"  /s /y /i
xcopy "%dir1%\user.js" "%dir2%\user.js"  /s /y /i

ECHO.&ECHO.���һЩ�ļ���GitHub����ɣ�Ո�������I�˳���&PAUSE >NUL 2>NUL

Goto end

:end
cls
ECHO  ����ɣ���һ����
ECHO.
ECHO  1.�˳�
ECHO  2.�������ˆ�
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto exit
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

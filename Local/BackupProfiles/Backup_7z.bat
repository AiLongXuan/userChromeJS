
::2015.10.01  ����ݔ����ַ�;����Uչ�Z��
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
MODE con: COLS=80 LINES=25
ECHO.
ECHO =============================================================================
ECHO                           �����̎�����ϰ�                           
ECHO    #+++++++++++++++++++++++++++++++++#+++++++++++++++++++++++++++++++++++#
ECHO    # 01�����Firefox�����ļ��A             #02��CingFox����������        #
ECHO    # 03�����Plugins��Software�ļ��A       #04����ȡFlash32λ���        #
ECHO    # 05�����һЩ�ļ���GitHub                                            #
ECHO    #                                                                     #
ECHO    #+++++++++++++++++++++++++++++++++#+++++++++++++++++++++++++++++++++++#
ECHO =============================================================================

set /p a=.                  �����������Ų��س�������07����
if %a%==01 goto Profiles
if %a%==02 goto CingFox
if %a%==03 goto Plugins-n-Software
if %a%==04 goto Flash32
if %a%==05 goto GitHub
goto cho

:Profiles
CLS
MODE con: COLS=45 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          ���Firefox�����ļ��A
ECHO.
ECHO                1.ִ��
ECHO.
ECHO                2.����
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto Profiles-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:Profiles-1
MODE con: COLS=80 LINES=25
Title ���Firefox�����ļ��A by Cing
echo.
echo    *** ���Firefox�����ļ��A ***
echo.
echo ============================================================
echo    **ע�⣺
echo.
echo    1. ��Ҫ�P�]Firefox����Ո�����Ҫ���Y��!
echo.
echo    2. �������ᣬ�������I�؆�Firefox
echo.
echo    By Cing
echo.
echo    ���������������
echo =============================================================
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
%zip% x %TempFolder%\extensions\support@lastpass.com\chrome\lastpass.jar -o%TempFolder1%\jar
del %TempFolder%\extensions\support@lastpass.com\chrome\lastpass.jar  /s /q
xcopy "%TempFolder1%\jar\locale\en-US" %TempFolder2%\jar\locale\en-US\ /s /y /i
xcopy "%TempFolder1%\jar\locale\zh-CN" %TempFolder2%\jar\locale\zh-CN\ /s /y /i
xcopy "%TempFolder1%\jar\locale\zh-TW" %TempFolder2%\jar\locale\zh-TW\ /s /y /i
%zip% a -tzip -mx9 "%TempFolder1%\lastpass.jar" "%TempFolder1%\jar\content\" "%TempFolder1%\jar\icons\" "%TempFolder1%\jar\META-INF\" "%TempFolder1%\jar\skin\" "%TempFolder2%\jar\locale\"
xcopy "%TempFolder1%\lastpass.jar" %TempFolder%\extensions\support@lastpass.com\chrome\ /s /y /i

::�h��Inspector������
del %TempFolder%\extensions\inspector@mozilla.org\chrome\inspector\locale\  /s /q
xcopy "%BackDir%\extensions\inspector@mozilla.org\chrome\inspector\locale\en-US" %TempFolder%\extensions\inspector@mozilla.org\chrome\inspector\locale\en-US\ /s /y /i

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
rd "%TempFolder%" "%TempFolder1%" "%TempFolder2%" /s/q

ECHO.&ECHO.Firefox�����Ѵ����ɣ�Ո�������I �؆�Firefox �K�˳���&PAUSE >NUL 2>NUL

@ping 127.0.0.1>nul
@start ..\..\..\..\Firefox\firefox.exe

Goto end

:CingFox
CLS
MODE con: COLS=45 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           CingFox����������
ECHO.
ECHO                1.ִ��
ECHO.
ECHO                2.����
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto CingFox-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:CingFox-1
MODE con: COLS=80 LINES=25
Title CingFox���������� by Cing
echo.
echo    *** CingFox���������� ***
echo.
echo ============================================================
echo    **ע�⣺
echo.
echo    1. ��Ҫ�P�]Firefox����Ո�����Ҫ���Y��!
echo.
echo    2. �������ᣬ�������I�؆�Firefox
echo.
echo    By Cing
echo.
echo    ���������������
echo =============================================================
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
@echo �P�]����g�[�����Ԅ��_ʼ��ݡ���
cd /d %~dp0
::������������λ�õ�Mozilla Firefox���ļ��A��������4��
set BackDir=..\..\..\..
set TempFolder=..\..\..\..\CingFox
set TempFolder1=..\..\..\..\1
set TempFolder2=..\..\..\..\2
::CingFoxݔ����ַ
set TargetFolder="D:"

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
del %TempFolder%\Software\GFW\goagent\  /s /q
del %TempFolder%\Software\GFW\IP-Update\  /s /q
del %TempFolder%\Software\GFW\Shadowsocks\  /s /q
del %TempFolder%\Software\GFW\psiphon\psiphon3.exe.orig  /s /q

@echo ���Profiles�ļ��A================================
rem ����Ŀ���ļ����R�r�ļ��A

::�������ļ��A
::adblockplus��ABPҎ�t��ݡ�
::xcopy "%BackDir%\Profiles\adblockplus" %TempFolder%\Profiles\adblockplus\  /s /y /i
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
::SimpleProxy��SimpleProxy�����б�
xcopy "%BackDir%\Profiles\SimpleProxy" %TempFolder%\Profiles\SimpleProxy\ /s /y /i

::�h��Lastpass��һЩ��Ŀ
::��һ������Platform
del %TempFolder%\Profiles\extensions\support@lastpass.com\platform\  /s /q
xcopy "%BackDir%\Profiles\extensions\support@lastpass.com\platform\WINNT_x86_64-msvc" %TempFolder%\Profiles\extensions\support@lastpass.com\platform\WINNT_x86_64-msvc\ /s /y /i
::����������lastpass.jar�е�����
%zip% x %TempFolder%\Profiles\extensions\support@lastpass.com\chrome\lastpass.jar -o%TempFolder1%\jar
del %TempFolder%\Profiles\extensions\support@lastpass.com\chrome\lastpass.jar  /s /q
xcopy "%TempFolder1%\jar\locale\en-US" %TempFolder2%\jar\locale\en-US\ /s /y /i
xcopy "%TempFolder1%\jar\locale\zh-CN" %TempFolder2%\jar\locale\zh-CN\ /s /y /i
xcopy "%TempFolder1%\jar\locale\zh-TW" %TempFolder2%\jar\locale\zh-TW\ /s /y /i
%zip% a -tzip "%TempFolder1%\lastpass.jar" "%TempFolder1%\jar\content\" "%TempFolder1%\jar\icons\" "%TempFolder1%\jar\META-INF\" "%TempFolder1%\jar\skin\" "%TempFolder2%\jar\locale\"
xcopy "%TempFolder1%\lastpass.jar" %TempFolder%\Profiles\extensions\support@lastpass.com\chrome\ /s /y /i

::�h��Inspector������
del %TempFolder%\Profiles\extensions\inspector@mozilla.org\chrome\inspector\locale\  /s /q
xcopy "%BackDir%\Profiles\extensions\inspector@mozilla.org\chrome\inspector\locale\en-US" %TempFolder%\Profiles\extensions\inspector@mozilla.org\chrome\inspector\locale\en-US\ /s /y /i

::�����h����
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
::prefs.js��About:config�Ѓ�����O����
::xcopy "%BackDir%\Profiles\prefs.js" %TempFolder%\Profiles\ /y
::readme.txt�����������޸�˵����
xcopy "%BackDir%\Profiles\readme.txt" %TempFolder%\Profiles\ /y
::stylish.sqlite��Stylish��ʽ���ݿ⡣
xcopy "%BackDir%\Profiles\stylish.sqlite" %TempFolder%\Profiles\ /y
::user.js��ʹ�����Զ����O������������O������Ĭ���O����
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
::ݔ���ļ���
set Name=CingFox_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
::ݔ���ļ���
set Name=CingFox_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

rem �_ʼ���
::-mx9����ѹ�� -mhc���������ļ�ͷѹ�� -r�ݹ鵽���е���Ŀ¼
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name% "%TempFolder%"
@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" "%TempFolder%1" "%TempFolder2%" /s/q

ECHO.&ECHO.Firefox�������Ѵ����ɣ�Ո�������I �؆�Firefox �K�˳���&PAUSE >NUL 2>NUL

@ping 127.0.0.1>nul
@start ..\..\..\..\Firefox\firefox.exe

Goto end

:Plugins-n-Software
CLS
MODE con: COLS=45 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO       ���Plugins��Software�ļ��A
ECHO.
ECHO                1.ִ��
ECHO.
ECHO                2.����
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto Plugins-n-Software-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:Plugins-n-Software-1
MODE con: COLS=80 LINES=25
Title ���Plugins��Software�ļ��A by Cing
echo.
echo    *** ���Plugins��Software�ļ��A ***
echo.
echo ============================================================
echo    **ע�⣺
echo.
echo    By Cing
echo.
echo    ���������������
echo =============================================================
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
cd /d %~dp0
::������������λ�õ�Plugins��Software�ļ��A��ֻ����4��
set BackDir=..\..\..\..\
set TempFolder=..\..\..\..\Plugins-n-Software
::ݔ����ַ
set TargetFolder="D:\My Documents\Baiduyun\Firefox\Profiles\Software & Plugins"

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

::�������ļ�
::patternSubscriptions.json��FoxyProxy��ӆ��б��O�á�
::xcopy "%BackDir%\patternSubscriptions.json" %TempFolder%\ /y

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
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name% "%TempFolder%"
@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" /s/q

ECHO.&ECHO.Plugins��Software�ļ��A�Ѵ����ɣ�Ո�������I�˳���&PAUSE >NUL 2>NUL

Goto end

:Flash32
CLS
MODE con: COLS=45 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           ��ȡFlash32λ���
ECHO.
ECHO                1.ִ��
ECHO.
ECHO                2.����
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto Flash32-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:Flash32-1
::color 2E
MODE con: COLS=80 LINES=25
Title ��ȡFlash32λ��� by Cing
echo.
echo    *** ��ȡFlash32λ��� ***
echo.
echo ============================================================
echo    **ע�⣺
echo.
echo    1.��Ҫ�Ȱ�װ��IE��Adobe Flash Player�����
echo.
echo    2.��������������ȡ32λ����������
echo.
echo    3.������ȡ64λFlash�����޸�BackDirλ��
echo.
echo    Edit By yndoc��
echo.
echo    Mod By Cing
echo.
echo    ���������������
echo =============================================================
pause>nul
cls
echo.
echo   01�����ٷ����ط�IE��Flash�����װ����ȡ��
echo.
echo   02���Ѿ���װ��IE��Flash�����ֱ����ȡ��
echo.
echo   03���������ˆΡ�
echo.
echo.

set /p id=��ѡ�񣬰��س���ִ�У����磺07��:
cls

if "%id%"=="01" goto install
if "%id%"=="02" goto set
if "%id%"=="03" goto menu

:install
echo.
echo =============================================================
echo.
echo   01����Flash�ٷ����d������ʽ�棡
echo.
echo   02����Flash�ٷ����d����beta�棡
echo.
echo   03���������ˆΡ�
echo.
echo.
set /p id=��ѡ�񣬰��س���ִ�У����磺07��:
cls

if "%id%"=="01" goto download1
if "%id%"=="02" goto download2
if "%id%"=="03" goto menu

:download1
start "" http://www.adobe.com/in/products/flashplayer/distribution3.html
cls
echo.
echo    *����ʱ��Ҫ�رո���������
echo.
echo    *������Ѱ�װ���Adobe Flash Player������밴�������������
pause>nul
goto set

:download2
start "" http://labs.adobe.com/downloads/flashplayer.html
cls
echo.
echo    *����ʱ��Ҫ�رո���������
echo.
echo    *������Ѱ�װ���Adobe Flash Player������밴�������������
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
CLS
MODE con: COLS=45 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        ���һЩ�ļ���GitHub
ECHO.
ECHO                1.ִ��
ECHO.
ECHO                2.����
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto GitHub-1
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:GitHub-1
MODE con: COLS=80 LINES=25
Title ���һЩ�ļ���GitHub by Cing
echo.
echo    *** ���һЩ�ļ���GitHub ***
echo.
echo ============================================================
echo    **ע�⣺
echo.
echo    1. ���˅����O�ã�user.js
echo.
echo    2. �~�䣺persdict.dat
echo.
echo    3. Stylish��ʽ�죺stylish.sqlite
echo.
echo    By Cing
echo.
echo    ���������������
echo =============================================================
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
CLS
MODE con: COLS=45 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO             ����ɣ���һ����
ECHO.
ECHO                1.�˳�
ECHO.
ECHO                2.�������ˆ�
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto exit
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

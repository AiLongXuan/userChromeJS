::2016.05.19

:Profiles-1
cls
echo.
echo  ��Ҫ�P�]Firefox����Ո�����Ҫ���Y��!
echo.
echo  ���������������
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
@echo �P�]����g�[�����Ԅ��_ʼ��ݡ���
taskkill /im firefox.exe
cd /d %~dp0
::������������λ�õ������ļ��У�Profiles����������4��
set BackDir=..\..\..\..

::�O���R�r�ļ��A
set TempFolder1="%TempFolder%\1"
set TempFolder2="%TempFolder%\2"
set TempFolder3="%TempFolder%\3"

::���\��һ�η�ֹ��һ��δ�ܽKֹ
taskkill /im firefox.exe

rem ����Ŀ���ļ����R�r�ļ��A

::�������ļ��A
xcopy "%BackDir%\adblockplus" %TempFolder%\Profiles\adblockplus\  /s /y /i
xcopy "%BackDir%\autoproxy" %TempFolder%\Profiles\autoproxy\  /s /y /i
xcopy "%BackDir%\chrome" %TempFolder%\Profiles\chrome\  /s /y /i
xcopy "%BackDir%\extensions" %TempFolder%\Profiles\extensions\ /s /y /i
xcopy "%BackDir%\fireie" %TempFolder%\Profiles\fireie\ /s /y /i
xcopy "%BackDir%\gm_scripts" %TempFolder%\Profiles\gm_scripts\ /s /y /i
xcopy "%BackDir%\browser-extension-data" %TempFolder%\Profiles\browser-extension-data\ /s /y /i
xcopy "%BackDir%\iMacros" %TempFolder%\Profiles\iMacros\ /s /y /i

::�������ļ�
xcopy "%BackDir%\bookmarks.html" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\cert8.db" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\FlashGot.exe" %TempFolder%\Profiles\ /y
::xcopy "%BackDir%\foxyproxy.xml" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\mimeTypes.rdf" %TempFolder%\Profiles\ /y
::xcopy "%BackDir%\patternSubscriptions.json" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\permissions.sqlite" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\persdict.dat" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\pluginreg.dat" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\Portable.7z" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\stylish.sqlite" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\user.js" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\prefs.js" %TempFolder%\Profiles\ /y
xcopy "%BackDir%\xulstore.json" %TempFolder%\Profiles\ /y

::�����h����
del %TempFolder%\Profiles\chrome\UserScriptLoader\require\  /s /q
del %TempFolder%\Profiles\extensions\userChromeJS@mozdev.org\content\myNewTab\bingImg\  /s /q

::�h��Lastpass��һЩ��Ŀ
::����Platform
del %TempFolder%\Profiles\extensions\support@lastpass.com\platform\  /s /q
xcopy "%BackDir%\extensions\support@lastpass.com\platform\WINNT_x86_64-msvc" %TempFolder%\Profiles\extensions\support@lastpass.com\platform\WINNT_x86_64-msvc\ /s /y /i


::�xȡ�汾̖�����ڼ��r�g
::������������λ�õ�Firefox�����ļ��У�firefox����������5��
for /f "usebackq eol=; tokens=1,2 delims==" %%i in ("..\..\..\..\..\Firefox\application.ini")do (if %%i==Version set ver=%%j)

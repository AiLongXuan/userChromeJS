
::2015.06.01 20:00  ������Profiles���h��һЩ����Ҫ���Ŀ
::2015.05.27 18:00  �Q��Autoproxy�����ق��Foxy����
::2015.05.25 17:00  ����foxyproxyӆ��б��O��
::2015.04.21 09:00  �����f��
::2015.04.16 08:00  �����헣�����f��
::2015.04.06 07:00  ������
::2015.01.26 12:00  �㶨��ʱ������

echo off
Title ���Firefox�����ļ��A
rem ���ñ���·���Լ���ʱ�ļ���
taskkill /im firefox.exe
@echo �رջ����������Զ���ʼ���ݡ���
cd /d %~dp0
set BackDir=..\..\..
set TempFolder=..\..\..\Temp\Profiles

rem ����Ŀ���ļ�����ʱ�ļ���
::��Ҫɾ������
del %BackDir%\chrome\UserScriptLoader\require\  /s /q 

::�������ļ���
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
::Plugins����?������
xcopy "%BackDir%\Plugins" %TempFolder%\Plugins\ /s /y /i
 
::�������ļ�
::bookmarks.html���Զ���������ǩ���ݡ�
xcopy "%BackDir%\bookmarks.html" %TempFolder%\ /y
::cert_override.txt������ʹ����ָ��������֤��(certification exceptions)��
xcopy "%BackDir%\cert_override.txt" %TempFolder%\ /y
::cert8.db����ȫ֤�顣
xcopy "%BackDir%\cert8.db" %TempFolder%\ /y
::FlashGot.exe��FlashGot�����ع��ߡ�
xcopy "%BackDir%\FlashGot.exe" %TempFolder%\ /y
::foxyproxy.xml��FoxyProxy�����ü���ַ�б��ݡ�
::xcopy "%BackDir%\foxyproxy.xml" %TempFolder%\ /y
::localstore.rdf�����������Ӵ���С��λ�õ��趨����ʱɾ�����Խ��һЩ�����ϵ����⡣
xcopy "%BackDir%\localstore.rdf" %TempFolder%\ /y
::mimeTypes.rdf�������ض����͵ĵ���ʱҪִ�еĶ����� ��ɾ������ԭԭ�����ص��趨��
xcopy "%BackDir%\mimeTypes.rdf" %TempFolder%\ /y
::MyFirefox.7z����춹ٷ�FX�ı�Я���á�
xcopy "%BackDir%\MyFirefox.7z" %TempFolder%\ /y
::patternSubscriptions.json��FoxyProxy��ӆ��б��O�á�
::xcopy "%BackDir%\patternSubscriptions.json" %TempFolder%\ /y
::permissions.sqlite������ض���վ�Ƿ�ɴ�ȡ���롢cookies�������Ӵ���ͼƬ�����븽��Ԫ��������Ȩ�޵����Ͽ⡣
xcopy "%BackDir%\permissions.sqlite" %TempFolder%\ /y
::persdict.dat�����˵�ƴ���ֵ䡣
xcopy "%BackDir%\persdict.dat" %TempFolder%\ /y
::pluginreg.dat������plugin��MIME types��
xcopy "%BackDir%\pluginreg.dat" %TempFolder%\ /y
::Portable.7z��PCXFirefox�ı�Я���á�
xcopy "%BackDir%\Portable.7z" %TempFolder%\ /y
::readme.txt�����������޸�˵����
xcopy "%BackDir%\readme.txt" %TempFolder%\ /y
::stylish.sqlite��Stylish��ʽ���ݿ⡣
xcopy "%BackDir%\stylish.sqlite" %TempFolder%\ /y
::user.js��ʹ�����Զ����趨����������趨����prefs.js���趨��
xcopy "%BackDir%\user.js" %TempFolder%\ /y
::xulstore.json�������һЩ״̬��
xcopy "%BackDir%\xulstore.json" %TempFolder%\ /y

::��ȡ�汾�ź����ڼ�ʱ��
for /f "usebackq eol=; tokens=1,2 delims==" %%i in ("..\..\..\..\Firefox\application.ini")do (if %%i==Version set ver=%%j)
::���ñ����ļ�·���Լ��ļ���

::�������ں�ʱ��
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
set tm4=%time:~0,8%
set da1=%date:~0,4%
set da2=%date:~5,2%
set da3=%date:~8,2%
set ArchiveName=D:\Profiles_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

::Сʱ��С��10��ʱ������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
set ArchiveName=D:\Profiles_%da1%%da2%%da3%-%tm1%%tm2%%tm3%_%ver%.7z

rem ��ʼ����
7z.exe u -up1q3r2x2y2z2w2 %ArchiveName% "%TempFolder%"
@echo ������ɣ�ɾ����ʱ�ļ���
rd "%TempFolder%" /s/q

ECHO.&ECHO.Firefox�����Ѵ�����,������Firefox,����������˳�! &PAUSE >NUL 2>NUL

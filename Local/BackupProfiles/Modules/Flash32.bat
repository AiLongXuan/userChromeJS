::2016.01.27

:Flash32
cls
ECHO.
ECHO  ��ȡFlash32λ���
ECHO.
ECHO  1.ִ��
ECHO  2.����
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto download
If ErrorLevel 2 If Not ErrorLevel 3 Goto menu

:download
cls
echo  *���d��D:\Temp�ļ���
::Beta����棺http://labs.adobe.com/downloads/flashplayer.html
::start "" https://fpdownload.macromedia.com/pub/labs/flashruntimes/flashplayer/install_flash_player.exe

wget --ca-certificate=ca-bundle.crt -c -N -P %TempFolder% https://fpdownload.macromedia.com/pub/labs/flashruntimes/flashplayer/install_flash_player.exe
goto install

:install
start "" %TempFolder%\install_flash_player.exe

echo.
echo  *����ʱ��Ҫ�رո���������
echo.
echo  *����Ѱ�װ��ϣ��밴�������������
pause>nul
goto set

:set
cd /d %~dp0
set BackDir=C:\Windows\SysWOW64\Macromed\Flash

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
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder4%\%Name% "%TempFolder%\NPSWF32*.dll" "%TempFolder%\FlashPlayerPlugin*.exe" "%TempFolder%\plugin.vch"
move %TargetFolder%\%Name% %TargetFolder4%

@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%"  /s/q

ECHO.&ECHO.�Ѵ����ɣ�Ո�������I�˳��������D��ϵ�y/�������/�����c���ܣ�&PAUSE >NUL 2>NUL

::���D��ϵ�y/�������/�����c����
appwiz.cpl
rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl

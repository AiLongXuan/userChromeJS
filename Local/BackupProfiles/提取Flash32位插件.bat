
::2015.07.11 22:00  �����x�
::2015.06.27 11:00  �����ȡ�r�g
::2015.06.25 13:00  ���F�@ȡFlash�汾̖
::2015.06.23 18:00  Create

@echo off
Title ��ȡFlash32λ��� by Cing
::color 2E
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
echo    Mod By Cing(Dupontjoy)
echo.
echo    ���������������
echo =============================================================
pause>nul
cls
echo.
echo   1�����ٷ����ط�IE��Flash�����װ����ȡ��
echo.
echo   2���Ѿ���װ��IE��Flash�����ֱ����ȡ��
echo.
echo   3���˳���������
echo.
echo.

set /p id=��ѡ�񣬰��س���ִ��:
cls

if "%id%"=="1" goto install
if "%id%"=="2" goto set
if "%id%"=="3" goto exit

:install
echo.
echo    �����������Flash�ٷ����ص�ַ����
echo.
pause>nul&start "" http://www.adobe.com/in/products/flashplayer/distribution3.html
cls
echo.
echo    *����ʱ��Ҫ�رո���������
echo.
echo    *������Ѱ�װ���Adobe Flash Player������밴�������������
pause>nul

:set
cd /d %~dp0
set BackDir=C:\Windows\SysWOW64\Macromed\Flash
set TempFolder=D:\Flash32

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
set ArchiveName=D:\%ver%_%da1%%da2%%da3%-%tm1%%tm2%%tm3%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
set ArchiveName=D:\%ver%_%da1%%da2%%da3%-%tm1%%tm2%%tm3%.7z

rem �_ʼ���
7z.exe u -up1q3r2x2y2z2w2 %ArchiveName% "%TempFolder%"
@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" /s/q

ECHO.&ECHO.�Ѵ����ɣ�Ո�������I�˳��������D��ϵ�y/�������/�����c���ܣ�&PAUSE >NUL 2>NUL

::���D��ϵ�y/�������/�����c����
appwiz.cpl
rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl

@exit

::2015.12.19  ����ģ�K��
::2015.10.30  ��ӄh��DTA�Z��
::2015.10.23  ���һ��Firefox�����ļ�
::2015.10.10  �����f��չʾ��ʽ
::2015.10.04  ģ�K��ÿ������Ŀ��Ȼ���ٽM�ϣ������ޔ��S�o
::2015.10.02  �����Uչ�Z��
::2015.10.01  ����ݔ����ַ
::2015.09.26  �_��7zip�O�މ��s

@echo off
Title �����̎�����ϰ� by Cing
::�����С��ColsΪ��LinesΪ��
MODE con: COLS=80 LINES=25
cd /d %~dp0
::�O��ģ�K·��
::����ǰĿ¼���浽����b��,�Ⱥ�ǰ��Ҫ�пո�
set b=%cd%

::һ��������7-zip�����ַ
set zip="D:\Program Files\7-Zip\7z.exe"

::�O��Profilesݔ����ַ
set TargetFolder1="D:\My Documents\Yunpan\Firefox\Profiles"

::�O��CingFoxݔ����ַ
set TargetFolder2="D:"

::�O��Plugins��Softwareݔ����ַ
set TargetFolder3="D:\My Documents\Yunpan\Firefox\Profiles\Software & Plugins"

::�O��Flash32ݔ����ַ
set TargetFolder4="D:\My Documents\Yunpan\Firefox\��FX����\Flash32λԭ����ȡ��vch��exe"

:menu
cls
ECHO.
ECHO  �����̎�����ϰ�                           
ECHO.
ECHO  1�����Firefox�����ļ��A
ECHO  2��CingFox����������
ECHO  3�����Plugins��Software�ļ��A
ECHO  4����ȡFlash32λ���
ECHO  5�����һЩ�ļ���GitHub
ECHO  6��ͬ��GitHub�O���ļ�������
ECHO.
set /p a=�����������Ų��س���1��2����
cls

if %a%==1 goto Profiles
if %a%==2 goto CingFox
if %a%==3 goto Plugins-n-Software
if %a%==4 goto Flash32
if %a%==5 goto GitHub
if %a%==6 goto Sync
goto cho

:Profiles
cls
@echo off
CALL "%b%\Modules\Profiles-1.bat"
CALL "%b%\Modules\Profiles-2.bat"
@echo.
Goto end

:CingFox
cls
@echo off
CALL "%b%\Modules\Profiles-1.bat"
CALL "%b%\Modules\Plugins-n-Software-1.bat"
CALL "%b%\Modules\CingFox-3.bat"
@echo.
Goto end

:Plugins-n-Software
cls
@echo off
CALL "%b%\Modules\Plugins-n-Software-1.bat"
CALL "%b%\Modules\Plugins-n-Software-2.bat"
@echo.
Goto end

:Flash32
cls
@echo off
CALL "%b%\Modules\Flash32.bat"
@echo.
Goto end

:GitHub
cls
@echo off
CALL "%b%\Modules\GitHub.bat"
@echo.
Goto end

:Sync
cls
@echo off
CALL "%b%\Modules\Sync.bat"
@echo.
Goto end

:end
cls
ECHO  ����ɣ���һ����
ECHO.
ECHO  1.�������ˆ�
ECHO  2.�˳�
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto menu
If ErrorLevel 2 If Not ErrorLevel 3 Goto exit


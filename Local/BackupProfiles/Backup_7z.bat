
::2015.11.08  ����ģ�K��
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
::һ��������7-zip�����ַ
set zip="D:\Program Files\7-Zip\7z.exe"
::�O��ģ�K·��
::����ǰĿ¼���浽����b��,�Ⱥ�ǰ��Ҫ�пո�
set b=%cd%


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


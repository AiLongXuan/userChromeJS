::2015.12.19

:Sync
cls
echo.
echo  *** ͬ��һЩܛ�����O���ļ� ***
echo.
echo  1. Foxmail�^�V����163.com, qq.com
echo  2. ProcessLaso�O��
echo  3. PicPick�O��
echo.
echo  ���������������
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
cd /d %~dp0

::��ݎׂ�Firefox�ļ�
::������������λ�õ�Profiles�ļ��У�������4��
::set dir1=..\..\..\..
set dir2=D:\My Documents\GitHub\Customization
::set dir2=D:\My Documents\Baiduyun\Firefox\Settings

::ͬ��Foxmail Filter
set dir3=D:\Program Files\Tencent\Foxmail\Storage
xcopy "%dir2%\Foxmail-Filter\163.com\1.fter" "%dir3%\dupontjoy@163.com\Filter\1.fter" /s /y /i
xcopy "%dir2%\Foxmail-Filter\qq.com\1.fter" "%dir3%\dupontjoy@qq.com\Filter\1.fter"  /s /y /i

::ͬ��ProcessLaso�O��
set dir4=D:\Program Files\System Tools\ProcessLassoPortable
xcopy "%dir2%\ProcessLaso\prolasso.ini" "%dir4%\prolasso.ini"  /s /y /i

::ͬ��PicPick�O��
set dir5=D:\Program Files\Mozilla Firefox\Software\Other\PicPick
xcopy "%dir2%\PicPick\picpick.ini" "%dir5%\picpick.ini"  /s /y /i

::2015.12.28

:GitHub
cls
echo.
echo  *** ���һЩ�ļ���GitHub ***
echo.
echo  1. Firefox�ļ���user.js, persdict.dat, stylish.sqlite
echo  2. Foxmail�^�V����163.com, qq.com
echo  3. ProcessLaso�O��
echo  4. PicPick�O��
echo  5. FastCopy-M�O��
echo.
echo  ���������������
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
cd /d %~dp0

::��ݎׂ�Firefox�ļ�
::������������λ�õ�Profiles�ļ��У�������4��
set dir1=..\..\..\..
set dir2=D:\My Documents\GitHub\Customization
::set dir2=D:\My Documents\Baiduyun\Firefox\Settings

xcopy "%dir1%\persdict.dat" "%dir2%\persdict.dat"  /s /y /i
xcopy "%dir1%\stylish.sqlite" "%dir2%\stylish.sqlite"  /s /y /i
xcopy "%dir1%\user.js" "%dir2%\user.js"  /s /y /i

::���Foxmail Filter
set dir3=D:\Program Files\Tencent\Foxmail\Storage
xcopy "%dir3%\dupontjoy@163.com\Filter\1.fter" "%dir2%\Foxmail-Filter\163.com\1.fter"  /s /y /i
xcopy "%dir3%\dupontjoy@qq.com\Filter\1.fter" "%dir2%\Foxmail-Filter\qq.com\1.fter"  /s /y /i

::���ProcessLaso�O��
set dir4=D:\Program Files\System Tools\ProcessLassoPortable
xcopy "%dir4%\prolasso.ini" "%dir2%\ProcessLaso\prolasso.ini"  /s /y /i

::���PicPick�O��
set dir5=D:\Program Files\Mozilla Firefox\Software\Other\PicPick
xcopy "%dir5%\picpick.ini" "%dir2%\PicPick\picpick.ini"  /s /y /i

::���FastCopy-M�O��
set dir6=D:\Program Files\FastCopy-M
xcopy "%dir6%\FastCopy2.ini" "%dir2%\FastCopy-M\FastCopy2.ini"  /s /y /i

::2016.02.12

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
echo  6. Shadowsocks-Pac�O��
echo  7. CCleaner�O��
echo.
echo  ���������������
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
cd /d %~dp0

::�O���ļ�����λ��
::������������λ�õ�Profiles�ļ��У�������4��
set dir1=..\..\..\..
set dir2=D:\My Documents\GitHub\Customization

::��ݎׂ�Firefox�ļ�
xcopy "%dir1%\persdict.dat" "%dir2%\Firefox\persdict.dat"  /s /y /i
xcopy "%dir1%\stylish.sqlite" "%dir2%\Firefox\stylish.sqlite"  /s /y /i
xcopy "%dir1%\user.js" "%dir2%\Firefox\user.js"  /s /y /i

::���Foxmail Filter
xcopy "%dir1%\..\..\Tencent\Foxmail\Storage\dupontjoy@163.com\Filter\1.fter" "%dir2%\Foxmail-Filter\163.com\1.fter"  /s /y /i

::���ProcessLaso�O��
xcopy "%dir1%\..\..\System Tools\ProcessLassoPortable\prolasso.ini" "%dir2%\ProcessLaso\prolasso.ini"  /s /y /i

::���PicPick�O��
xcopy "%dir1%\..\Software\Image\PicPick\picpick.ini" "%dir2%\PicPick\picpick.ini"  /s /y /i

::���FastCopy-M�O��
xcopy "%dir1%\..\..\FastCopy-M\FastCopy2.ini" "%dir2%\FastCopy-M\FastCopy2.ini"  /s /y /i

::���Shadowsocks-Pac�O��
xcopy "%dir1%\..\Software\GFW\Shadowsocks\pac.txt" "%dir2%\Rules\Shadowsocks\pac.txt"  /s /y /i
xcopy "%dir1%\..\Software\GFW\Shadowsocks\user-rule.txt" "%dir2%\Rules\Shadowsocks\user-rule.txt"  /s /y /i

::���CCleaner�O��
xcopy "%dir1%\..\..\System Tools\CCleaner\ccleaner.ini" "%dir2%\CCleaner\ccleaner.ini"  /s /y /i
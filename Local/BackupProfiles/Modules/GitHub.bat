:GitHub
cls
echo.
echo  *** ���һЩ�ļ���GitHub ***
echo.
echo  1. ���˅����O�ã�user.js
echo  2. �~�䣺persdict.dat
echo  3. Stylish��ʽ�죺stylish.sqlite
echo.
echo  ���������������
pause>nul
cls

rem �O�Â��·���Լ��R�r�ļ��A
cd /d %~dp0
::������������λ�õ�Profiles�ļ��У�������4��
set dir1=..\..\..\..
set dir2=D:\My Documents\GitHub\Customization
xcopy "%dir1%\persdict.dat" "%dir2%\persdict.dat"  /s /y /i
xcopy "%dir1%\stylish.sqlite" "%dir2%\stylish.sqlite"  /s /y /i
xcopy "%dir1%\user.js" "%dir2%\user.js"  /s /y /i

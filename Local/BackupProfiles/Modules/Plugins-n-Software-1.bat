:Plugins-n-Software-1
cls

rem �O�Â��·���Լ��R�r�ļ��A
cd /d %~dp0
::������������λ�õ�Plugins��Software�ļ��A������5��
set BackDir=..\..\..\..\..\
::������������λ�õ�Profiles�ļ��У�����4��
set TempFolder=..\..\..\..\Temp
::ݔ����ַ
set TargetFolder="D:\My Documents\Baiduyun\Firefox\Profiles\Software & Plugins"

rem ����Ŀ���ļ����R�r�ļ��A

::�������ļ��A
::Plugins�����ñ�Я���
xcopy "%BackDir%\Plugins" %TempFolder%\Plugins\  /s /y /i
::Software������ܛ��
xcopy "%BackDir%\Software" %TempFolder%\Software\  /s /y /i

::��Ҫ�h������
del %TempFolder%\Plugins\sumatrapdfcache\  /s /q 
del %TempFolder%\Software\GFW\psiphon\psiphon3.exe.orig  /s /q 
del %TempFolder%\Software\GFW\GoGoTester\gogo_cache  /s /q 
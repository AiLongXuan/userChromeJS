::2015.12.22 �{�����Q��ʽ

:pcxFirefox
::�}�uPcxFirefox������
cls

::������������λ�õ�Mozilla Firefox�ļ��У�������5��
set BackDir=..\..\..\..\..

::�}�ufirefox���R�r�ļ��A
xcopy "%BackDir%\firefox" %TempFolder%\firefox\  /s /y /i

:CingFox-2
::��Ҫ�h������
del %TempFolder%\Software\GFW\goagent\  /s /q
del %TempFolder%\Software\GFW\IP-Update\  /s /q
del %TempFolder%\Software\GFW\Shadowsocks\  /s /q
del %TempFolder%\Software\GFW\psiphon\psiphon3.exe.orig  /s /q
del %TempFolder%\Profiles\bookmarks.html  /s /q

::�o��һ�����ļ��ACingFox
xcopy "%TempFolder%\firefox" %TempFolder%\CingFox\firefox\ /s /y /i
xcopy "%TempFolder%\Profiles" %TempFolder%\CingFox\Profiles\ /s /y /i
xcopy "%TempFolder%\Plugins" %TempFolder%\CingFox\Plugins\ /s /y /i
xcopy "%TempFolder%\Software" %TempFolder%\CingFox\Software\ /s /y /i

::�������ں͕r�g
set tm1=%time:~0,2%
set tm2=%time:~3,2%
set tm3=%time:~6,2%
set tm4=%time:~0,8%
set da1=%date:~0,4%
set da2=%date:~5,2%
set da3=%date:~8,2%
::ݔ���ļ���
set Name=CingFox_%ver%_%da1%%da2%%da3%-%tm1%%tm2%%tm3%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
::ݔ���ļ���
set Name=CingFox_%ver%_%da1%%da2%%da3%-%tm1%%tm2%%tm3%.7z

rem �_ʼ���
::-mx9����ѹ�� -mhc���������ļ�ͷѹ�� -r�ݹ鵽���е���Ŀ¼
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name% "%TempFolder%\CingFox\"
move %TargetFolder%\%Name% %TargetFolder2%\

@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" /s/q

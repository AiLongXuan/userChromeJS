::2016.09.13

::���

::�������ں͕r�g
set YY=%date:~0,4%
set MON=%date:~5,2%
set DD=%date:~8,2%
set hh=%time:~0,2%
set mm=%time:~3,2%
set ss=%time:~6,2%

::ݔ���ļ���
set Name=CingFox_%ver%_%YY%%MON%%DD%-%hh%%mm%%ss%.7z

::С�r��С��10��r������
set /a tm1=%time:~0,2%*1
if %tm1% LSS 10 set tm1=0%tm1%
::ݔ���ļ���
set Name=CingFox_Full_%ver%_%YY%%MON%%DD%-%hh%%mm%%ss%.7z
set Name1=CingFox_Profiles_%ver%_%YY%%MON%%DD%-%hh%%mm%%ss%.7z
set Name2=CingFox_Advanced_%ver%_%YY%%MON%%DD%-%hh%%mm%%ss%.7z

rem �_ʼ���
::-mx9����ѹ�� -mhc���������ļ�ͷѹ�� -r�ݹ鵽���е���Ŀ¼
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name% "%TempFolder%\CingFox\"
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name1% "%TempFolder%\CingFox\Profiles\"
%zip% -mx9 -mhc -r u -up1q3r2x2y2z2w2 %TargetFolder%\%Name2% "%TempFolder%\Advanced\"

::���TargetFolder2�ļ����µ������ļ�, ������TargetFolder2�ļ���
::del /s /f /q %TargetFolder2%
move %TargetFolder%\%Name% %TargetFolder2%\
move %TargetFolder%\%Name1% %TargetFolder2%\
move %TargetFolder%\%Name2% %TargetFolder2%\

@echo �����ɣ����h���R�r�ļ��A��
rd "%TempFolder%" /s/q
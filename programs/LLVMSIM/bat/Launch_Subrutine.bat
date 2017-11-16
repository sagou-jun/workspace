@echo off
cd C:\cygwin64\usr\local\programs\LLVMSIM\withMATLAB\RunTestModel2\
RunTestModel2.exe %1 %2 %3 %4 | tee RunTestModel_monitor.txt
pause
exit 0

@REM dup.bat executes a specific command multiple times
@REM usage: dup.bat {run_occurrence} {command}
@REM example: dup.bat 3 echo 123
@REM example result: 
@REM > 123
@REM > 123
@REM > 123
@REM note: do not enclose {command} with quotes
@REM ref: processing all arguments but first in Windows batch script: https://stackoverflow.com/a/26732879/23209096

@echo off
for /f "tokens=1,* delims= " %%a in ("%*") do set ALL_BUT_FIRST=%%b

for /l %%i in (1,1,%1) do (
    call %ALL_BUT_FIRST%
)
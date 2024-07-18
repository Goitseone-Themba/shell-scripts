::@echo off
REM Get current date and time
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set dt=%%I
set datetime=%dt:~0,4%-%dt:~4,2%-%dt:~6,2%-%dt:~8,2%-%dt:~10,2%

REM Create new folder in backup with timestamp
mkdir C:\Users\user\Desktop\backup\%datetime%

REM Copy file(s) from deployments to new timestamped folder
copy C:\Users\user\Desktop\deployments\*.* C:\Users\user\Desktop\backup\%datetime%

REM Delete file(s) from deployments
del /Q C:\Users\user\Desktop\deployments\*.*

REM Copy file(s) from target to deployments
copy C:\Users\user\Desktop\target C:\Users\user\Desktop\deployments

:: It is done
REM Optional: Pause the script to see the results before it closes
pause

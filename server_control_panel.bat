@echo off
setlocal enabledelayedexpansion
title Server Control Panel - v1.0.0

:: Set directories for Forge and Vanilla servers
set "forgeServerDirRoot=C:\server\Minecraft\forge\custom"
set "vanillaServerDirRoot=C:\server\Minecraft\vanilla\custom"
set "defaultForgeServerDir=C:\server\Minecraft\forge\default"
set "defaultVanillaServerDir=C:\server\Minecraft\vanilla\default"
set "backupDir=C:\server\backups"

:: Set crash detection keyword
set "crashKeyword=Exception"  :: Modify this as needed based on your logs

:menu
cls
echo ============================
echo Server Control Panel - v1.0.0
echo ============================
echo 1. Start Specific Server
echo 2. View Server Logs
echo 3. Start Default Forge Server
echo 4. Start Default Vanilla Server
echo 5. Run Server Diagnostics
echo 6. Enable Auto-Restart on Crash
echo 7. Backup Server
echo 8. Exit
echo ============================
set /p choice="Select an option (1-8): "

if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2
if "%choice%"=="3" goto option3
if "%choice%"=="4" goto option4
if "%choice%"=="5" goto diagnostics
if "%choice%"=="6" goto autorestart
if "%choice%"=="7" goto backup
if "%choice%"=="8" goto exit

:: Handle invalid input
echo Invalid choice! Please select a valid option.
pause
goto menu

:option1
cls
echo You selected to start a specific server.

:: List Forge and Vanilla Servers with Names
echo ============================
echo Available Forge Servers:
for /d %%d in ("%forgeServerDirRoot%\*") do (
    echo Forge: %%~nxd
)

echo Available Vanilla Servers:
for /d %%d in ("%vanillaServerDirRoot%\*") do (
    echo Vanilla: %%~nxd
)

:: Prompt user to select a server by name
echo ============================
set /p serverChoice="Enter the full name of the Forge or Vanilla server to start (e.g., Forge 1.21, Vanilla 1.18): "

:: Match serverChoice with actual directory names
set "selectedServer="
for /d %%d in ("%forgeServerDirRoot%\*") do (
    if /i "Forge %%~nxd"=="!serverChoice!" (
        set "selectedServer=%%d"
    )
)
for /d %%d in ("%vanillaServerDirRoot%\*") do (
    if /i "Vanilla %%~nxd"=="!serverChoice!" (
        set "selectedServer=%%d"
    )
)

:: Check if a valid server was selected
if not defined selectedServer (
    echo Invalid server selection. Please try again.
    pause
    goto menu
)

:: Debugging: Show the selected server directory
echo Selected server directory: !selectedServer!

:: Validate that the selected server directory exists
if not exist "!selectedServer!" (
    echo The selected server directory does not exist: !selectedServer!
    pause
    goto menu
)

:: Scan for potential startup files
cd /d "!selectedServer!"
echo Scanning for potential startup files...

:: Collect all .bat and .jar files
set fileList=
for %%f in (*.bat *.jar) do (
    set "fileList=!fileList! %%f"
)

:: Prompt user to select the correct startup file
echo ============================
echo Available startup files:
set /a index=0
for %%f in (!fileList!) do (
    set /a index+=1
    echo !index!: %%f
    set "file[!index!]=%%f"
)

set /p fileChoice="Enter the number of the correct startup file: "
set "startupFile=!file[%fileChoice%]!"

:runServer
echo Starting server with file: !startupFile!
set /p startChoice="Do you want to start this server? (y/n): "

if /i "!startChoice!"=="y" (
    if "!startupFile:~-4!"==".bat" (
        echo Running batch file !startupFile!...
        start cmd /k "!startupFile!"
    ) else if "!startupFile:~-4!"==".jar" (
        echo Running jar file !startupFile!...
        start cmd /k "java -jar !startupFile!"
    ) else (
        echo Unknown file type: !startupFile!. Cannot start the server.
    )
) else (
    echo Server start cancelled.
)

pause
goto menu

:option2
echo You selected to view server logs.

:: List Forge and Vanilla Servers with Names
echo ============================
echo Available Forge Servers:
for /d %%d in ("%forgeServerDirRoot%\*") do (
    echo Forge: %%~nxd
)

echo Available Vanilla Servers:
for /d %%d in ("%vanillaServerDirRoot%\*") do (
    echo Vanilla: %%~nxd
)

:: Prompt user to select a server for viewing logs
echo ============================
set /p logServerChoice="Enter the full name of the Forge or Vanilla server to view logs (e.g., Forge 1.21, Vanilla 1.18): "

:: Match serverChoice with actual directory names
set "logSelectedServer="
for /d %%d in ("%forgeServerDirRoot%\*") do (
    if /i "Forge %%~nxd"=="!logServerChoice!" (
        set "logSelectedServer=%%d"
    )
)
for /d %%d in ("%vanillaServerDirRoot%\*") do (
    if /i "Vanilla %%~nxd"=="!logServerChoice!" (
        set "logSelectedServer=%%d"
    )
)

:: Check if a valid server was selected for logs
if not defined logSelectedServer (
    echo Invalid server selection. Please try again.
    pause
    goto menu
)

:: Navigate to the logs folder
cd /d "!logSelectedServer!\logs" || (
    echo No logs directory found for the selected server.
    pause
    goto menu
)

:: Check if latest.log exists
if exist "latest.log" (
    echo Displaying latest.log for !logServerChoice!...
    type latest.log
) else (
    echo latest.log not found in the logs directory.
)
pause
goto menu

:option3
echo Starting Default Forge server...
echo Navigating to Forge directory: %defaultForgeServerDir%

:: Go to the version folder inside the default Forge directory
for /d %%d in ("%defaultForgeServerDir%\*") do (
    cd /d "%%d"
)

:: Check for server.jar first, then run.bat, and finally debug if neither exists
if exist "server.jar" (
    echo Found server.jar, starting the server...
    start cmd /k "java -jar server.jar"
) else if exist "run.bat" (
    echo server.jar not found, running run.bat...
    start cmd /k "run.bat"
) else (
    echo Neither server.jar nor run.bat found in the Forge directory.
    echo Current directory: %cd%
    dir
)
pause
goto menu

:option4
echo Starting Default Vanilla server...

:: Go to the only version folder inside the default directory
for /d %%d in ("%defaultVanillaServerDir%\*") do (
    cd /d "%%d"
)

:: Check for server.jar first, then run.bat, and finally debug if neither exists
if exist "server.jar" (
    echo Found server.jar, starting the server...
    start cmd /k "java -jar server.jar"
) else if exist "run.bat" (
    echo server.jar not found, running run.bat...
    start cmd /k "run.bat"
) else (
    echo Neither server.jar nor run.bat found. Debugging...
    echo Current directory: %cd%
    dir
)
pause
goto menu

:diagnostics
cls
echo Running diagnostics on all server directories...

:: Diagnostic feature to check for startup files in all directories
for /d %%d in ("%forgeServerDirRoot%\*" "%vanillaServerDirRoot%\*") do (
    cd /d "%%d"
    echo Checking %%~nxd for startup files...
    if exist "server.jar" (
        echo Found server.jar in %%~nxd.
    ) else if exist "run.bat" (
        echo Found run.bat in %%~nxd.
    ) else (
        echo No startup files found in %%~nxd.
    )
    echo ============================
)
pause
goto menu

:autorestart
cls
echo Auto-Restart Feature Enabled!

:: Monitor the logs for crashes based on a keyword
set /p monitorServerChoice="Enter the full name of the server to monitor for crashes: "

set "monitorServer="
for /d %%d in ("%forgeServerDirRoot%\*") do (
    if /i "Forge %%~nxd"=="!monitorServerChoice!" (
        set "monitorServer=%%d"
    )
)
for /d %%d in ("%vanillaServerDirRoot%\*") do (
    if /i "Vanilla %%~nxd"=="!monitorServerChoice!" (
        set "monitorServer=%%d"
    )
)

if not defined monitorServer (
    echo Invalid server selected for monitoring.
    pause
    goto menu
)

cd /d "!monitorServer!\logs"
:monitorLoop
echo Monitoring latest.log for crashes...
findstr /i /c:"%crashKeyword%" latest.log
if not errorlevel 1 (
    echo Crash detected! Restarting the server...
    goto runServer
)
ping localhost -n 10 > nul
goto monitorLoop

:backup
cls
echo You selected to backup a server.

:: List Forge and Vanilla Servers with Names
echo ============================
echo Available Forge Servers:
for /d %%d in ("%forgeServerDirRoot%\*") do (
    echo Forge: %%~nxd
)

echo Available Vanilla Servers:
for /d %%d in ("%vanillaServerDirRoot%\*") do (
    echo Vanilla: %%~nxd
)

:: Prompt user to select a server to backup
echo ============================
set /p backupServerChoice="Enter the full name of the Forge or Vanilla server to backup (e.g., Forge 1.21, Vanilla 1.18): "

:: Match backupServerChoice with actual directory names
set "backupServer="
for /d %%d in ("%forgeServerDirRoot%\*") do (
    if /i "Forge %%~nxd"=="!backupServerChoice!" (
        set "backupServer=%%d"
    )
)
for /d %%d in ("%vanillaServerDirRoot%\*") do (
    if /i "Vanilla %%~nxd"=="!backupServerChoice!" (
        set "backupServer=%%d"
    )
)

:: Check if a valid server was selected for backup
if not defined backupServer (
    echo Invalid server selection. Please try again.
    pause
    goto menu
)

:: Create the backup directory if it doesn't exist
if not exist "%backupDir%" (
    mkdir "%backupDir%"
)

:: Generate a timestamp for the backup
for /f "tokens=1-5 delims=/: " %%d in ("%date% %time%") do (
    set timestamp=%%d-%%e-%%f_%%g-%%h
)

:: Create a zip file of the server's directory (handle spaces with quotes)
set backupFile=%backupDir%\backup_!backupServerChoice!_!timestamp!.zip
echo Creating backup: "!backupFile!"
powershell Compress-Archive -LiteralPath "'!backupServer!'" -DestinationPath "'!backupFile!'"

if %errorlevel% neq 0 (
    echo Backup failed! Please check the path or any other issues.
) else (
    echo Backup completed: !backupFile!
)

pause
goto menu


:exit
echo Exiting...
exit

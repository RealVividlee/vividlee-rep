@echo off
title Minecraft Server Installer
echo =====================================
echo Minecraft Server Version Installer
echo =====================================
echo Select the version of Minecraft Server you want to install:
echo 1. Minecraft Server 1.21
echo 2. Minecraft Server 1.20.1
echo 3. Minecraft Server 1.19.4
echo 4. Minecraft Server 1.18.2
echo 5. Minecraft Server 1.17.1
echo 6. Minecraft Server 1.16.5
echo 7. Minecraft Server 1.15.2
echo 8. Minecraft Server 1.14.4
echo 9. Minecraft Server 1.13.2
echo 10. Minecraft Server 1.12.2
echo 11. Minecraft Server 1.11.2
echo 12. Minecraft Server 1.10.2
echo 13. Minecraft Server 1.9.4
echo 14. Minecraft Server 1.8.9
echo 15. Minecraft Server 1.7.10
echo 16. Exit
echo =====================================
set /p choice="Enter your choice (1-16): "

if "%choice%"=="1" (
    echo Downloading Minecraft Server 1.21...
    curl -O https://mcversions.net/download/1.21/server.jar
    goto install
) 
if "%choice%"=="2" (
    echo Downloading Minecraft Server 1.20.1...
    curl -O https://mcversions.net/download/1.20.1/server.jar
    goto install
) 
if "%choice%"=="3" (
    echo Downloading Minecraft Server 1.19.4...
    curl -O https://mcversions.net/download/1.19.4/server.jar
    goto install
) 
if "%choice%"=="4" (
    echo Downloading Minecraft Server 1.18.2...
    curl -O https://mcversions.net/download/1.18.2/server.jar
    goto install
) 
if "%choice%"=="5" (
    echo Downloading Minecraft Server 1.17.1...
    curl -O https://mcversions.net/download/1.17.1/server.jar
    goto install
) 
if "%choice%"=="6" (
    echo Downloading Minecraft Server 1.16.5...
    curl -O https://mcversions.net/download/1.16.5/server.jar
    goto install
) 
if "%choice%"=="7" (
    echo Downloading Minecraft Server 1.15.2...
    curl -O https://mcversions.net/download/1.15.2/server.jar
    goto install
) 
if "%choice%"=="8" (
    echo Downloading Minecraft Server 1.14.4...
    curl -O https://mcversions.net/download/1.14.4/server.jar
    goto install
) 
if "%choice%"=="9" (
    echo Downloading Minecraft Server 1.13.2...
    curl -O https://mcversions.net/download/1.13.2/server.jar
    goto install
)
if "%choice%"=="10" (
    echo Downloading Minecraft Server 1.12.2...
    curl -O https://mcversions.net/download/1.12.2/server.jar
    goto install
)
if "%choice%"=="11" (
    echo Downloading Minecraft Server 1.11.2...
    curl -O https://mcversions.net/download/1.11.2/server.jar
    goto install
)
if "%choice%"=="12" (
    echo Downloading Minecraft Server 1.10.2...
    curl -O https://mcversions.net/download/1.10.2/server.jar
    goto install
)
if "%choice%"=="13" (
    echo Downloading Minecraft Server 1.9.4...
    curl -O https://mcversions.net/download/1.9.4/server.jar
    goto install
)
if "%choice%"=="14" (
    echo Downloading Minecraft Server 1.8.9...
    curl -O https://mcversions.net/download/1.8.9/server.jar
    goto install
)
if "%choice%"=="15" (
    echo Downloading Minecraft Server 1.7.10...
    curl -O https://mcversions.net/download/1.7.10/server.jar
    goto install
)
if "%choice%"=="16" (
    echo Exiting...
    exit /b
)

:install
echo Starting installation...
:: Additional steps like creating eula.txt
echo eula=true > eula.txt
echo Minecraft server installed successfully!
pause
exit /b


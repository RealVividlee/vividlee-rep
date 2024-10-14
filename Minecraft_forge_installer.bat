@echo off
title Minecraft Forge Server Installer
echo =====================================
echo Minecraft Forge Server Version Installer
echo =====================================
echo Select the version of Minecraft Forge Server you want to install:
echo 1. Forge Server 1.21 (Replace with actual Forge version when available)
echo 2. Forge Server 1.20.1
echo 3. Forge Server 1.19.4
echo 4. Forge Server 1.18.2
echo 5. Forge Server 1.17.1
echo 6. Forge Server 1.16.5
echo 7. Forge Server 1.15.2
echo 8. Forge Server 1.14.4
echo 9. Forge Server 1.13.2
echo 10. Forge Server 1.12.2
echo 11. Forge Server 1.11.2
echo 12. Forge Server 1.10.2
echo 13. Forge Server 1.9.4
echo 14. Forge Server 1.8.9
echo 15. Forge Server 1.7.10
echo 16. Exit
echo =====================================
set /p choice="Enter your choice (1-16): "

if "%choice%"=="1" (
    echo Forge for 1.21 is not yet available...
    goto end
) 
if "%choice%"=="2" (
    echo Downloading Forge Server 1.20.1...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.1.0/forge-1.20.1-47.1.0-installer.jar
    goto install
) 
if "%choice%"=="3" (
    echo Downloading Forge Server 1.19.4...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.4-45.1.0/forge-1.19.4-45.1.0-installer.jar
    goto install
) 
if "%choice%"=="4" (
    echo Downloading Forge Server 1.18.2...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.18.2-40.2.0/forge-1.18.2-40.2.0-installer.jar
    goto install
) 
if "%choice%"=="5" (
    echo Downloading Forge Server 1.17.1...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.17.1-37.0.0/forge-1.17.1-37.0.0-installer.jar
    goto install
) 
if "%choice%"=="6" (
    echo Downloading Forge Server 1.16.5...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.16.5-36.2.0/forge-1.16.5-36.2.0-installer.jar
    goto install
) 
if "%choice%"=="7" (
    echo Downloading Forge Server 1.15.2...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.15.2-31.2.0/forge-1.15.2-31.2.0-installer.jar
    goto install
) 
if "%choice%"=="8" (
    echo Downloading Forge Server 1.14.4...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.14.4-28.2.0/forge-1.14.4-28.2.0-installer.jar
    goto install
) 
if "%choice%"=="9" (
    echo Downloading Forge Server 1.13.2...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.13.2-25.0.0/forge-1.13.2-25.0.0-installer.jar
    goto install
)
if "%choice%"=="10" (
    echo Downloading Forge Server 1.12.2...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2855/forge-1.12.2-14.23.5.2855-installer.jar
    goto install
)
if "%choice%"=="11" (
    echo Downloading Forge Server 1.11.2...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.11.2-13.20.1.2588/forge-1.11.2-13.20.1.2588-installer.jar
    goto install
)
if "%choice%"=="12" (
    echo Downloading Forge Server 1.10.2...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.10.2-12.18.3.2511/forge-1.10.2-12.18.3.2511-installer.jar
    goto install
)
if "%choice%"=="13" (
    echo Downloading Forge Server 1.9.4...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.9.4-12.17.0.1976/forge-1.9.4-12.17.0.1976-installer.jar
    goto install
)
if "%choice%"=="14" (
    echo Downloading Forge Server 1.8.9...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.8.9-11.15.1.2318/forge-1.8.9-11.15.1.2318-installer.jar
    goto install
)
if "%choice%"=="15" (
    echo Downloading Forge Server 1.7.10...
    curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614/forge-1.7.10-10.13.4.1614-installer.jar
    goto install
)
if "%choice%"=="16" (
    echo Exiting...
    exit /b
)

:install
echo Starting installation...
echo Running Forge installer...
java -jar forge-%choice%-installer.jar --installServer
echo Forge server installed successfully!
pause
exit /b

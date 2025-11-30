@echo off
REM SerialPortScanner Build Script for Windows

echo ================================
echo SerialPortScanner Junsun 8227L
echo Build Script v1.0
echo ================================
echo.

REM Verifica Java
where java >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Java nu este instalat!
    echo Instaleaza Java JDK 11 sau mai nou
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('java -version 2^>^&1 ^| findstr "version"') do set JAVA_VERSION=%%i
echo [OK] Java found: %JAVA_VERSION%
echo.

REM Verifica ANDROID_HOME
if "%ANDROID_HOME%"=="" (
    echo WARNING: ANDROID_HOME nu este setat
    echo Incearca sa gasesc Android SDK...

    if exist "%USERPROFILE%\AppData\Local\Android\Sdk" (
        set ANDROID_HOME=%USERPROFILE%\AppData\Local\Android\Sdk
        echo [OK] Android SDK gasit la: %ANDROID_HOME%
    ) else (
        echo ERROR: Android SDK nu gasit!
        echo Seteaza ANDROID_HOME sau instaleaza Android Studio
        pause
        exit /b 1
    )
) else (
    echo [OK] ANDROID_HOME: %ANDROID_HOME%
)
echo.

REM Clean build
echo [*] Curatare build anterior...
call gradlew.bat clean

REM Debug build
echo [*] Compilare DEBUG...
call gradlew.bat assembleDebug

echo.
echo ================================
echo BUILD COMPLETED SUCCESSFULLY!
echo ================================
echo.
echo APK Debug Location:
echo   app\build\outputs\apk\debug\app-debug.apk
echo.
echo Pentru instalare pe device:
echo   adb install -r app\build\outputs\apk\debug\app-debug.apk
echo.
pause

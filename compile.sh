#!/bin/bash

# SerialPortScanner Build Script
# Compilare automata pe Linux/Mac

set -e

echo "================================"
echo "SerialPortScanner Junsun 8227L"
echo "Build Script v1.0"
echo "================================"
echo ""

# Verificare Java
if ! command -v java &> /dev/null; then
    echo "ERROR: Java nu este instalat!"
    echo "Instaleaza Java JDK 11 sau mai nou"
    exit 1
fi

echo "[OK] Java found: $(java -version 2>&1 | grep 'java version')"
echo ""

# Verificare ANDROID_HOME
if [ -z "$ANDROID_HOME" ]; then
    echo "WARNING: ANDROID_HOME nu este setat"
    echo "Incearca sa gasesc Android SDK..."

    if [ -d "$HOME/Android/Sdk" ]; then
        export ANDROID_HOME="$HOME/Android/Sdk"
        echo "[OK] Android SDK gasit la: $ANDROID_HOME"
    elif [ -d "$HOME/Library/Android/sdk" ]; then
        export ANDROID_HOME="$HOME/Library/Android/sdk"
        echo "[OK] Android SDK gasit la: $ANDROID_HOME"
    else
        echo "ERROR: Android SDK nu gasit!"
        echo "Seteaza ANDROID_HOME sau instaleaza Android Studio"
        exit 1
    fi
else
    echo "[OK] ANDROID_HOME: $ANDROID_HOME"
fi
echo ""

# Clean build
echo "[*] Curatare build anterior..."
./gradlew clean

# Debug build
echo "[*] Compilare DEBUG..."
./gradlew assembleDebug

echo ""
echo "================================"
echo "BUILD COMPLETED SUCCESSFULLY!"
echo "================================"
echo ""
echo "APK Debug Location:"
echo "  app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "Pentru instalare pe device:"
echo "  adb install -r app/build/outputs/apk/debug/app-debug.apk"
echo ""

# Setup Guide - SerialPortScanner Junsun

## Verificare Cerințe

Înainte să compilezi, verifică că ai instalat:

### 1. Java JDK (Versiunea 11 sau mai nouă)

**Windows:**
```cmd
java -version
```

**Linux/Mac:**
```bash
java -version
```

Dacă nu ai Java:
- Download de pe: https://www.oracle.com/java/technologies/downloads/
- Instalează JDK 11 LTS sau mai nou

**Windows - Setează JAVA_HOME:**
```cmd
setx JAVA_HOME "C:\Program Files\Java\jdk-11.0.x"
```

**Linux/Mac - Setează JAVA_HOME:**
```bash
export JAVA_HOME=/usr/libexec/java_home
# Adaugă în ~/.bashrc sau ~/.zshrc pentru persistent
```

### 2. Android SDK (Versiunea 33 sau mai nouă)

**Opțiunea A: Instalează Android Studio** (Recommended)
- Download de pe: https://developer.android.com/studio
- Urmeaza setup wizard
- La terminare, Android SDK se instalează automat

**Opțiunea B: Command Line Tools**
```bash
# Download SDK Command Line Tools
# https://developer.android.com/studio#command-tools

# Unzip și configurează
export ANDROID_HOME=~/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH

# Instalează SDK packages
sdkmanager "platforms;android-33" "build-tools;33.0.0"
```

**Verificare SDK:**
```bash
echo $ANDROID_HOME
ls $ANDROID_HOME/platforms/
```

### 3. ADB (Android Debug Bridge) - optional

Pentru instalarea pe device:
```bash
# Windows (in Android Studio)
"C:\Users\[USERNAME]\AppData\Local\Android\Sdk\platform-tools\adb.exe"

# Linux/Mac
export PATH=$ANDROID_HOME/platform-tools:$PATH
```

## Setup Minimal

### Step 1: Instaleaza Android Studio

1. Download de pe: https://developer.android.com/studio
2. Urmeaza instalatorul default
3. Lansează Android Studio
4. Acceptă licensele: `File > Settings > Android SDK > Accept Licenses`

### Step 2: Verifica SDK

```bash
# în Android Studio:
Preferences/Settings > Appearance & Behavior > System Settings > Android SDK
```

Asigură-te că ai:
- ✓ Android SDK 33
- ✓ Android SDK Build-Tools 33.x
- ✓ CMake (optional)
- ✓ NDK (optional)

### Step 3: Deschide Proiectul

```bash
# Navigate to project
cd SerialPortScanner

# Deschide în Android Studio
open -a Android\ Studio .          # Mac
# sau Manual: Android Studio > Open > Selectează folderul
```

### Step 4: Build

**Opțiunea A: Prin Android Studio**
```
Build > Build Bundle(s)/APK(s) > Build APK(s)
```

**Opțiunea B: Prin Terminal**
```bash
./gradlew assembleDebug
```

**Opțiunea C: Automat (Windows)**
```
Double-click: compile.bat
```

**Opțiunea C: Automat (Linux/Mac)**
```bash
chmod +x compile.sh
./compile.sh
```

## Troubleshooting

### Problem: "JAVA_HOME is not set"

**Windows:**
```cmd
setx JAVA_HOME "C:\Program Files\Java\jdk-11"
# Restart Command Prompt
```

**Linux/Mac:**
```bash
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
echo $JAVA_HOME
```

### Problem: "SDK not found"

**Android Studio:**
```
Preferences > Appearance & Behavior > System Settings > Android SDK
> Edit SDK Path > /Users/[user]/Android/Sdk (or equivalent)
```

**Manual (Linux/Mac):**
```bash
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/tools:$PATH
```

**Manual (Windows):**
```cmd
setx ANDROID_HOME "%USERPROFILE%\AppData\Local\Android\Sdk"
setx PATH "%PATH%;%ANDROID_HOME%\tools"
```

### Problem: "gradlew: Permission denied"

```bash
chmod +x gradlew
./gradlew assembleDebug
```

### Problem: "Build fails - Gradle sync error"

```bash
./gradlew clean
./gradlew build
```

### Problem: "Target SDK not installed"

```bash
# List available
sdkmanager --list

# Install
sdkmanager "platforms;android-33" "build-tools;33.0.2"
```

## Verificare Setup

Rulează acest test:

```bash
cd SerialPortScanner

# Test 1: Check Gradle
./gradlew --version

# Test 2: Check Java
java -version

# Test 3: Build
./gradlew clean
./gradlew assembleDebug

# Test 4: Check APK
ls -la app/build/outputs/apk/debug/app-debug.apk
```

Dacă toate reușesc ✓ - Setup complete!

## Resurse Ajutoare

- **Android Developer Docs:** https://developer.android.com/docs
- **Gradle Documentation:** https://gradle.org/documentation/
- **Kotlin Docs:** https://kotlinlang.org/docs
- **Android Studio Guide:** https://developer.android.com/studio/intro

## Next Steps

1. [Compilare](COMPILE.md) - Detalii compilare
2. [Quick Start](QUICK_START.md) - Rulare aplicație
3. [Structura](PROJECT_STRUCTURE.md) - Structura proiectului


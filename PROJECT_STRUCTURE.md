# Structura Proiectului - SerialPortScanner

```
SerialPortScanner/
├── app/
│   ├── src/
│   │   └── main/
│   │       ├── java/com/example/serialportscannerjunsun/
│   │       │   ├── MainActivity.kt           # Activitate principală, scanare UI
│   │       │   └── SerialPort.kt             # Clasa pentru deschidere porturi UART
│   │       ├── res/
│   │       │   ├── layout/
│   │       │   │   └── activity_main.xml     # Layout interface utilizator
│   │       │   └── values/
│   │       │       └── strings.xml           # String resources
│   │       ├── jniLibs/                      # Biblioteci native (gol, optional)
│   │       │   ├── armeabi-v7a/              # 32-bit ARM
│   │       │   └── arm64-v8a/                # 64-bit ARM
│   │       └── AndroidManifest.xml           # Manifest aplicației
│   └── build.gradle                           # Build configuration app-level
├── gradle/
│   └── wrapper/
│       └── gradle-wrapper.properties          # Gradle wrapper version config
├── build.gradle                               # Root build config
├── build.gradle.kts                           # Kotlin DSL build config
├── settings.gradle                            # Gradle settings, module definitions
├── gradle.properties                          # Gradle system properties
├── gradlew                                    # Gradle wrapper (Linux/Mac)
├── gradlew.bat                                # Gradle wrapper (Windows)
├── compile.sh                                 # Script compilare automat (Linux/Mac)
├── compile.bat                                # Script compilare automat (Windows)
│
├── README.md                                  # Overview proiect
├── QUICK_START.md                             # Instrucțiuni rapide
├── COMPILE.md                                 # Instrucțiuni detaliate compilare
├── PROJECT_STRUCTURE.md                       # Acest fișier
└── .gitignore                                 # Git ignore rules

```

## Componente Principale

### 1. MainActivity.kt
- **Scop:** Interfață utilizator, gestionare scanare UART
- **Funcționalitate:**
  - Scanează porturile UART disponibile
  - Testează multiple baudrate-uri
  - Afișează datele primite în hexadecimal
  - Control buton Start/Stop

### 2. SerialPort.kt
- **Scop:** Wrapper peste porturi UART hardware
- **Funcționalitate:**
  - Deschidere/închidere port seria
  - Configurare baudrate
  - InputStream/OutputStream pentru read/write

### 3. activity_main.xml
- **Layout:** ScrollView + Button + TextView
- **Componente:**
  - Buton SCAN cu culoare orange (#FF6B35)
  - TextView pentru logging (monospace font)
  - ScrollView pentru scroll automat la mesaje noi

## Configurare Build

### build.gradle (root)
```
- Android Gradle Plugin 8.1.1
- Kotlin Plugin 1.9.10
```

### app/build.gradle
```
- compileSdk: 33
- minSdk: 21
- targetSdk: 33
- Dependencies: androidx, material design
```

## Compilare

### Debug (pentru testing)
```bash
./gradlew assembleDebug
# Output: app/build/outputs/apk/debug/app-debug.apk
```

### Release (pentru production)
```bash
./gradlew assembleRelease
# Output: app/build/outputs/apk/release/app-release-unsigned.apk
```

## Instalare

### Via ADB
```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

### Via Android Studio
1. Connect device via USB
2. Enable Developer Mode
3. Click Run in Android Studio

## Compatibilitate

- **Min API Level:** 21 (Android 5.0)
- **Target API Level:** 33 (Android 13)
- **Arch:** armeabi-v7a, arm64-v8a
- **Device Specific:** Junsun 8227L, AllWinner T3

## Fișiere Ajutator

- `compile.sh` - Compilare automată pe Linux/Mac
- `compile.bat` - Compilare automată pe Windows
- `QUICK_START.md` - Instrucțiuni rapid
- `COMPILE.md` - Detalii compilare avansată

## Resources

- Kotlin 1.9.10
- Android Gradle Plugin 8.1.1
- Gradle Wrapper 8.1.1
- AndroidX libraries

## Build Directory Structure (generat)

```
build/
├── intermediates/
│   ├── compiled/           # Klasse compilate
│   └── manifests/          # Manifest procesate
├── outputs/
│   ├── apk/
│   │   ├── debug/          # Debug APK generat
│   │   └── release/        # Release APK generat
│   └── bundle/             # Android App Bundle
└── ...
```


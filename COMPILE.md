# Instrucțiuni de Compilare - SerialPortScanner Junsun

## Cerințe

1. **Android Studio** (versiunea 2021.1+)
2. **Android SDK** (nivel 33 sau mai mare)
3. **Java JDK** (versiunea 11+)
4. **Gradle** (versiunea 8.1.1+)

## Instalare dependențe pe Windows

### 1. Instalează Java JDK
- Descarcă de pe: https://www.oracle.com/java/technologies/downloads/
- Instalează versiunea 11 sau mai nouă
- Setează variabila de mediu `JAVA_HOME` la directorul JDK

### 2. Instalează Android Studio
- Descarcă de pe: https://developer.android.com/studio
- Urmeaza instalarea implicită
- La terminare, lansează Android SDK Manager și instalează:
  - Android SDK 33
  - Android SDK Build-Tools 33.x
  - Android Emulator (opțional)

### 3. Setează variabila ANDROID_HOME
```
Windows:
setx ANDROID_HOME "C:\Users\[USERNAME]\AppData\Local\Android\Sdk"
```

## Compilare Debug APK

```bash
cd SerialPortScanner
./gradlew assembleDebug
```

Sau pe Windows:
```cmd
cd SerialPortScanner
gradlew.bat assembleDebug
```

## Compilare Release APK

```bash
cd SerialPortScanner
./gradlew assembleRelease
```

## Locație APK compilat

După compilare, APK se va găsi în:

**Debug:**
```
app/build/outputs/apk/debug/app-debug.apk
```

**Release:**
```
app/build/outputs/apk/release/app-release-unsigned.apk
```

## Instalare pe device

### Cu ADB
```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

### Prin Android Studio
1. Conectează dispozitivul via USB
2. Activează Developer Mode pe dispozitiv
3. Apasă "Run" în Android Studio

## Troubleshooting

### Eroare: "SDK not found"
```
Setează ANDROID_HOME sau configurează SDK path în Android Studio:
Settings > Appearance & Behavior > System Settings > Android SDK > SDK Location
```

### Eroare: "Java not found"
```
Setează JAVA_HOME:
Windows: setx JAVA_HOME "C:\Program Files\Java\jdk-11"
Linux/Mac: export JAVA_HOME=/usr/libexec/java_home
```

### Eroare de compilare
```bash
./gradlew clean
./gradlew assembleDebug
```

## Notă pentru Junsun 8227L

APK-ul generat este compatible cu:
- Junsun 8227L
- AllWinner T3
- Cu CanBox Hiworld PA12.20

Aplicația va autodetecta porturile UART și va scana pentru date de comunicație CAN.

# SerialPortScanner Junsun 8227L

## START HERE 👇

Aceasta este o aplicație Android **completă și gata de compilare** pentru scanarea porturilor UART pe unități Junsun 8227L cu CanBox Hiworld PA12.20.

### ⚡ Quick Setup (5 minute)

1. **Instaleaza Android Studio** (dacă nu ai)
   - https://developer.android.com/studio

2. **Deschide proiectul**
   ```
   Android Studio > Open > Selectează folderul: SerialPortScanner
   ```

3. **Compilează APK**
   ```bash
   ./gradlew assembleDebug
   ```

4. **Instalează pe device**
   ```bash
   adb install -r app/build/outputs/apk/debug/app-debug.apk
   ```

### 📋 Ce conține proiectul

```
✓ MainActivity.kt       - Interfață + logică scanare
✓ SerialPort.kt        - Wrapper porturi UART
✓ activity_main.xml    - Layout UI
✓ build.gradle         - Configurație build
✓ compile.sh/.bat      - Script compilare automată
✓ Documentație completă
```

### 🎯 Funcționalitate

- ✓ Scanare automată porturi UART
- ✓ Testare multiple baudrate-uri
- ✓ Detectare CanBox automat
- ✓ Afișare date în hexadecimal
- ✓ **Nu necesită root**
- ✓ Compatible Junsun 8227L

### 📚 Documentație

Alege ce te interesează:

| Document | Conținut |
|----------|----------|
| **QUICK_START.md** | Setup în 3 pași |
| **SETUP_GUIDE.md** | Detalii cerințe + troubleshooting |
| **COMPILE.md** | Instrucțiuni compilare avansate |
| **PROJECT_STRUCTURE.md** | Structura fișierelor |
| **README.md** | Overview proiect |

### 🚀 Compilare Rapidă

**Linux/Mac:**
```bash
chmod +x compile.sh
./compile.sh
```

**Windows:**
```
Double-click: compile.bat
```

**Manual:**
```bash
./gradlew assembleDebug
```

### 💾 Output APK

După compilare, APK se găsește la:
```
app/build/outputs/apk/debug/app-debug.apk
```

### 🔧 Cerințe Sistem

- Java JDK 11+
- Android SDK 33+
- Android Studio (recommended)

### 📱 Instalare Device

```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

Sau prin Android Studio: `Run > Run 'app'`

### ⚠️ Dacă ceva nu merge

1. Citește: **SETUP_GUIDE.md** - secțiunea Troubleshooting
2. Verifică: Java + Android SDK sunt instalate
3. Rulează: `./gradlew clean && ./gradlew assembleDebug`

### 📝 Notes

- Proiectul este configurat pentru **Junsun 8227L**
- Compatible cu CanBox Hiworld PA12.20
- Scanează porturi: `/dev/ttyS0`, `/dev/ttyS1`, `/dev/ttyS2`, `/dev/ttyS3`, etc.
- Testează baudrate: 9600, 19200, 38400, 57600, 115200

### 🎓 Structură minimă

```
SerialPortScanner/
├── app/src/main/java/...
│   ├── MainActivity.kt       ← Logică aplicație
│   └── SerialPort.kt         ← Acces UART
├── app/src/main/res/layout/
│   └── activity_main.xml     ← Interfață
├── app/build.gradle          ← Config build
├── compile.sh / compile.bat  ← Script compilare
└── Documentație (.md)
```

---

**Next Step:** Alege documentul din tabelul de mai sus, sau direct compilează!

**Version:** 1.0.0
**Platform:** Android 5.0+ (API 21+)
**Architecture:** ARM 32/64-bit
**License:** Open Source


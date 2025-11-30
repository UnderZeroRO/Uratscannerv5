# Quick Start - SerialPortScanner Junsun

## În 3 pași

### 1. Deschide proiectul în Android Studio

```
Android Studio > Open > Selectează folderul: SerialPortScanner
```

### 2. Compilare

**Opțiunea A (Recommended):**
```bash
./gradlew assembleDebug
```

**Opțiunea B (Windows):**
```cmd
gradlew.bat assembleDebug
```

**Opțiunea C (Automat, Linux/Mac):**
```bash
./compile.sh
```

**Opțiunea D (Automat, Windows):**
```
Double-click: compile.bat
```

### 3. Instalare pe device

```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

## Ce face aplicația?

✓ Scanează automat porturile UART disponibile
✓ Testează multiple baudrate-uri
✓ Detectează CanBox Hiworld PE12.20
✓ Afișează datele primite în hexadecimal
✓ **Nu necesită root**

## Porturi scannate

- /dev/ttyS0, /dev/ttyS1, /dev/ttyS2, /dev/ttyS3
- /dev/ttyMT0, /dev/ttyMT1, /dev/ttyHSL0

## Baudrate-uri testate

9600, 19200, 38400, 57600, 115200

## Output exemplu

```
SerialPortScanner Junsun 8227L
Scanare porturi UART...

--- SCANARE PORTURI UART ---

Testeaza port: /dev/ttyS0
  /dev/ttyS0 @ 9600 baud...
  /dev/ttyS0 @ 19200 baud...

Testeaza port: /dev/ttyS3
  /dev/ttyS3 @ 9600 baud...
  ✓ GASIT DATE: 02 10 01 F1 03 22 ...
  >> Port ACTIV: /dev/ttyS3 @ 9600 baud!
```

## Troubleshooting

| Problemă | Soluție |
|----------|---------|
| "SDK not found" | Instaleaza Android Studio + SDK 33 |
| "Java not found" | Instaleaza Java JDK 11+ |
| APK nu instaleaza | Conecteaza device via USB, activeaza Developer Mode |
| Aplicația crash pe device | Device-ul ar trebui Android 5.0+ cu UART accesibil |

## Support

Documentație completa în: COMPILE.md

Proiect: SerialPortScanner Junsun 8227L v1.0

# SerialPortScanner Junsun

Aplicație Android pentru scanarea automată a porturilor UART pe unități Junsun 8227L cu CanBox Hiworld PA12.xx.

## Funcționalitate

- Scanează automat porturile UART disponibile
- Testează multiple baudrate-uri: 9600, 19200, 38400, 57600, 115200
- Detectează portul activ care comunică cu CanBox
- Afișează datele primite în hexadecimal
- Nu necesită root access
- Compatible cu Junsun 8227L (AllWinner T3)

## Porturi testate

- /dev/ttyS0, /dev/ttyS1, /dev/ttyS2, /dev/ttyS3
- /dev/ttyMT0, /dev/ttyMT1
- /dev/ttyHSL0

## Compilare

```bash
cd SerialPortScanner
./gradlew assembleDebug
```

APK se va genera în: `app/build/outputs/apk/debug/app-debug.apk`

## Instalare pe dispozitiv

```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

## Versiune

1.0.0

## Licență

Open Source

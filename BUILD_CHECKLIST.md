# Build Checklist - SerialPortScanner Junsun

## ✓ Pre-Build Verification

Before building, verify you have:

### System Requirements
- [ ] Java JDK 11 or higher installed
- [ ] Android SDK 33 or higher
- [ ] Android Studio installed (optional but recommended)
- [ ] 500 MB free disk space

### Verify Installation
```bash
java -version      # Should show Java 11+
echo $ANDROID_HOME # Should show SDK path
```

## ✓ Build Steps

### Step 1: Navigate to project
```bash
cd SerialPortScanner
```

### Step 2: Clean previous builds
```bash
./gradlew clean
```

### Step 3: Build Debug APK
```bash
./gradlew assembleDebug
```

### Step 4: Verify APK created
```bash
ls -la app/build/outputs/apk/debug/app-debug.apk
```

## ✓ Alternative Build Methods

### Method A: Automatic Script (Linux/Mac)
```bash
chmod +x compile.sh
./compile.sh
```

### Method B: Automatic Script (Windows)
```
Double-click: compile.bat
```

### Method C: Using Android Studio
```
1. Open project in Android Studio
2. Build > Build Bundle(s)/APK(s) > Build APK(s)
3. Wait for build completion
```

### Method D: Build Release
```bash
./gradlew assembleRelease
# Output: app/build/outputs/apk/release/app-release-unsigned.apk
```

## ✓ Post-Build Verification

After build completes:

```bash
# Verify APK exists
ls -lh app/build/outputs/apk/debug/app-debug.apk

# Check APK size (should be 3-5 MB)
du -h app/build/outputs/apk/debug/app-debug.apk

# Verify APK contents (optional)
unzip -l app/build/outputs/apk/debug/app-debug.apk | head -20
```

## ✓ Installation on Device

### Prerequisites
- [ ] Device connected via USB
- [ ] Developer Mode enabled on device
- [ ] ADB drivers installed

### Install Commands

**Via ADB:**
```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

**Via Android Studio:**
```
1. Connect device via USB
2. Click Run > Run 'app' in Android Studio
```

**Verify Installation:**
```bash
adb shell pm list packages | grep serialport
```

## ✓ First Run

After installation:

1. Open "SerialPortScanner" app
2. Tap "SCAN PORTURI" button
3. Wait for port detection (2-10 seconds per port)
4. Log will show detected data if CanBox is connected

Expected Output:
```
SerialPortScanner Junsun 8227L
Scanare porturi UART...

--- SCANARE PORTURI UART ---

Testeaza port: /dev/ttyS0
  /dev/ttyS0 @ 9600 baud...
  /dev/ttyS0 @ 19200 baud...
  ...
Testeaza port: /dev/ttyS3
  /dev/ttyS3 @ 9600 baud...
  ✓ GASIT DATE: 02 10 01 F1 03 22 ...
  >> Port ACTIV: /dev/ttyS3 @ 9600 baud!
```

## ✓ Troubleshooting

| Issue | Solution |
|-------|----------|
| Build fails | Run `./gradlew clean` then rebuild |
| APK not found | Check console output for build errors |
| Won't install | Device not in developer mode or ADB not installed |
| App crashes on launch | Check Android version (min 5.0) |
| No data detected | CanBox not connected or port permissions |

## ✓ Build Outputs

**Debug Build:**
- APK: `app/build/outputs/apk/debug/app-debug.apk`
- Size: ~3-5 MB
- Debuggable: Yes
- Signed: Android debug key

**Release Build:**
- APK: `app/build/outputs/apk/release/app-release-unsigned.apk`
- Size: ~3-5 MB
- Debuggable: No
- Signed: Needs manual signing

## ✓ Clean Up

To remove build artifacts:
```bash
./gradlew clean
rm -rf app/build/
```

## ✓ Next Steps

1. Test on Junsun 8227L device
2. Verify UART detection works
3. Check data logging output
4. Verify no errors in logcat:
   ```bash
   adb logcat | grep serialport
   ```

---

**All checks passed?** You're ready to deploy!


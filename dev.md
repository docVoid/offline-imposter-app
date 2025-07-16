# Local Testing Guide for offline-imposter-app

## Prerequisites

1. **Node.js** and **npm** installed ([Download](https://nodejs.org/))
2. **Git** installed ([Download](https://git-scm.com/))
3. **React Native CLI** or **Expo CLI** (depending on the project)
   - Install:  
     ```bash
     npm install -g expo-cli
     ```
     or  
     ```bash
     npm install -g react-native-cli
     ```
4. **Android Studio** (for Android emulator)
5. **Xcode** (only on macOS, for iOS simulator)
6. **Physical Android device** with USB debugging enabled

---

## Note about iOS on Windows

> **You cannot build or test iOS apps directly on Windows.**
>
> A Mac with Xcode is required for iOS builds and simulator.

---

## Install the Project

```bash
git clone https://github.com/docVoid/offline-imposter-app
cd offline-imposter-app
npm install
```

---

## Android Emulator

1. Open **Android Studio**
2. Create/start an emulator via "Device Manager"
3. In the project folder:
   ```bash
   npx react-native run-android
   ```
   or (with Expo):
   ```bash
   expo start
   ```
   Then select "Run on Android device/emulator" in the browser

---

## iOS Simulator (macOS only)

1. Open **Xcode**
2. Start a simulator (e.g. iPhone 14)
3. In the project folder:
   ```bash
   npx react-native run-ios
   ```
   or (with Expo):
   ```bash
   expo start
   ```
   Then select "Run on iOS simulator" in the browser

---

## Physical Android Device

1. Enable **USB debugging** on your device (Settings > Developer options)
2. Connect the device via USB
3. In the project folder:
   ```bash
   npx react-native run-android
   ```
   or (with Expo):
   ```bash
   expo start
   ```
   Then select "Run on Android device" in the browser

---

## Notes

- With Expo, you can also start the app via QR code in the Expo Go app.
- If you encounter issues with emulators/devices:
  - Check drivers and environment variables.
  - Restart the packager (`npm start` or `expo start`).


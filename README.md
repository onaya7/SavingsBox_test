Task Manager App
# Overview
The Task Manager App is a mobile application built using Flutter. It enables users to efficiently manage their daily tasks by providing features such as task creation, updates, deletion, categorization, due dates, and reminders. The app also includes user authentication and data synchronization with a remote database.

## Features
- User Authentication: Email/password sign-up, login, and password recovery using Firebase Authentication.
- Task Management: Create, update, delete, categorize tasks, and set due dates with reminders.
- Offline Support: Local data storage using Hive, with synchronization to Firebase Firestore when online.
- Responsive Design: Clean, adaptive UI with support for light and dark modes.
- Animations: Smooth transitions for task-related actions.
- State Management: Managed using Flutter Bloc for predictable state handling.
- Cross-Platform: Deployment-ready for both Android and iOS platforms.

## Prerequisites
- Flutter: Ensure you have Flutter installed. Follow the official Flutter installation guide if necessary.
- Firebase: Set up a Firebase project for authentication and Firestore. You'll need to download google-services.json (for Android) and GoogleService-Info.plist (for iOS).

## Getting Started
1. Clone the Repository
```bash
git clone https://github.com/onaya7/SavingsBox_test.git
cd SavingsBox_test
```

2. Install Dependencies
Run the following command to fetch all the necessary dependencies:
```bash
flutter pub get
```

3. Firebase Configuration
### Android
- Place your google-services.json file in the android/app directory.

### iOS
- Place your GoogleService-Info.plist file in the ios/Runner directory.
- Open the project in Xcode (ios/Runner.xcworkspace) and ensure that the GoogleService-Info.plist file is added to the Runner target.

4. Running the App
You can run the app on an emulator or a physical device.

### Android
```bash
flutter run
```

### iOS
Ensure you've set up an iOS simulator or connected a physical device:
```bash
flutter run
```

5. Building for Production
### Android
Generate the APK or App Bundle:
```bash
flutter build apk --release
```
or
```bash
flutter build appbundle --release
```

### iOS
Ensure all provisioning profiles are set up in Xcode:
```bash
flutter build ios --release
```
Open the iOS project in Xcode to archive and distribute.

## Deployment
For detailed deployment instructions, refer to Flutter’s official documentation.

## App Icons and Splash Screens
The app includes customized icons and splash screens for both platforms. Adjustments can be made in:
- Android: android/app/src/main/res
- iOS: ios/Runner/Assets.xcassets

## Contributing
Contributions are welcome! Please submit pull requests or raise issues for any bugs or feature requests.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Video Demonstration
A video walkthrough of the app is available [here](link-to-video).
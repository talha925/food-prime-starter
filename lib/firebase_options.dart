// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBqV9RuBhU1bol1cXeIoIydn7FnGqgbC-E',
    appId: '1:782688760209:web:7e131d51d885387efdaa30',
    messagingSenderId: '782688760209',
    projectId: 'food-prime-app-622f7',
    authDomain: 'food-prime-app-622f7.firebaseapp.com',
    storageBucket: 'food-prime-app-622f7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdMWW_FMseLqnal-IXdb2AtoLcdRXW3vg',
    appId: '1:782688760209:android:84ce69033b4d5370fdaa30',
    messagingSenderId: '782688760209',
    projectId: 'food-prime-app-622f7',
    storageBucket: 'food-prime-app-622f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRtmm01VgM4OEwiLz2go1JcKU7jNlYNJk',
    appId: '1:782688760209:ios:d64ac4a23bb066fbfdaa30',
    messagingSenderId: '782688760209',
    projectId: 'food-prime-app-622f7',
    storageBucket: 'food-prime-app-622f7.appspot.com',
    iosBundleId: 'com.example.foodPrimeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRtmm01VgM4OEwiLz2go1JcKU7jNlYNJk',
    appId: '1:782688760209:ios:c5c7c4ff9fa81292fdaa30',
    messagingSenderId: '782688760209',
    projectId: 'food-prime-app-622f7',
    storageBucket: 'food-prime-app-622f7.appspot.com',
    iosBundleId: 'com.example.foodPrimeApp.RunnerTests',
  );
}

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCm8Pw-qr372PqdVEXwixA74pd7pY8XSQc',
    appId: '1:13574928418:web:d00e8f1e89e7c58333b27b',
    messagingSenderId: '13574928418',
    projectId: 'chat-project-45082',
    authDomain: 'chat-project-45082.firebaseapp.com',
    databaseURL: 'https://chat-project-45082-default-rtdb.firebaseio.com',
    storageBucket: 'chat-project-45082.appspot.com',
    measurementId: 'G-V1WVFNWET3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDuBZNynrAa4FtZGHGG1tJU09dezhtYy0',
    appId: '1:13574928418:android:caa80f93deeb8ae933b27b',
    messagingSenderId: '13574928418',
    projectId: 'chat-project-45082',
    databaseURL: 'https://chat-project-45082-default-rtdb.firebaseio.com',
    storageBucket: 'chat-project-45082.appspot.com',
  );
}

// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyC8ddfTUfoGbdTFzK_G9wqg7LCv6VPw1as',
    appId: '1:405107737161:web:6e609e2ad5ebebe909b598',
    messagingSenderId: '405107737161',
    projectId: 'admob-bd86f',
    authDomain: 'admob-bd86f.firebaseapp.com',
    storageBucket: 'admob-bd86f.appspot.com',
    measurementId: 'G-88HHE3BWV2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3jZMGa4oIZGduqz8Uu5x3498iaFD1EkM',
    appId: '1:405107737161:android:06946524a520d3ca09b598',
    messagingSenderId: '405107737161',
    projectId: 'admob-bd86f',
    storageBucket: 'admob-bd86f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSRWZGHUQ-B8mqJcc8qCUGhMQ_bTfG9Nw',
    appId: '1:405107737161:ios:537619d04ba3ff3c09b598',
    messagingSenderId: '405107737161',
    projectId: 'admob-bd86f',
    storageBucket: 'admob-bd86f.appspot.com',
    iosBundleId: 'com.example.videoDownloader',
  );
}

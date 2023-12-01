// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// ignore: depend_on_referenced_packages
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
    apiKey: 'AIzaSyApV6qMpHEMnkt5X2aGVRAjKaiQw4X7Rag',
    appId: '1:675702019005:web:d80ea251e1039494dd38d4',
    messagingSenderId: '675702019005',
    projectId: 'bljr-firebase-37e36',
    authDomain: 'bljr-firebase-37e36.firebaseapp.com',
    storageBucket: 'bljr-firebase-37e36.appspot.com',
    measurementId: 'G-QPC8K735CY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPjLIeBqyKvwue2wd8dZasGEmLPNNTVEE',
    appId: '1:675702019005:android:3bac2cca5823308ddd38d4',
    messagingSenderId: '675702019005',
    projectId: 'bljr-firebase-37e36',
    storageBucket: 'bljr-firebase-37e36.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBx_RO45QF2l2XBXignQvViJT4Hos1bgfs',
    appId: '1:675702019005:ios:9da452a83d86159bdd38d4',
    messagingSenderId: '675702019005',
    projectId: 'bljr-firebase-37e36',
    storageBucket: 'bljr-firebase-37e36.appspot.com',
    iosBundleId: 'com.example.firebaseFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBx_RO45QF2l2XBXignQvViJT4Hos1bgfs',
    appId: '1:675702019005:ios:9a163046c54b74ccdd38d4',
    messagingSenderId: '675702019005',
    projectId: 'bljr-firebase-37e36',
    storageBucket: 'bljr-firebase-37e36.appspot.com',
    iosBundleId: 'com.example.firebaseFlutter.RunnerTests',
  );
}

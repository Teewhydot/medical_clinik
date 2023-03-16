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
    apiKey: 'AIzaSyAYrqLDPBnxqE0DBDbp2tOh56gZRN2i9nU',
    appId: '1:674192726364:web:2eb93c02d4237f113a8999',
    messagingSenderId: '674192726364',
    projectId: 'medikalclinik',
    authDomain: 'medikalclinik.firebaseapp.com',
    storageBucket: 'medikalclinik.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXeAvzMdOe0NNdvxa6jl-77VAOdd1UW2c',
    appId: '1:674192726364:android:527e7baf05bf758e3a8999',
    messagingSenderId: '674192726364',
    projectId: 'medikalclinik',
    storageBucket: 'medikalclinik.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCM3SiX1H-bFb0ZVUIvPlb6o7T1y1IHdIk',
    appId: '1:674192726364:ios:f57df2a63e68d2723a8999',
    messagingSenderId: '674192726364',
    projectId: 'medikalclinik',
    storageBucket: 'medikalclinik.appspot.com',
    iosClientId: '674192726364-ip5o25sq310fv722e3q66hr0u2vrgc0i.apps.googleusercontent.com',
    iosBundleId: 'com.example.medicalClinik',
  );
}

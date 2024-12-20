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
        return windows;
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
    apiKey: 'AIzaSyA4I6NnmpW-EjxztKQBxojhbtcu0G4KYy0',
    appId: '1:503039274314:web:aaf507913cf92ee2a965b3',
    messagingSenderId: '503039274314',
    projectId: 'super-labs-task',
    authDomain: 'super-labs-task.firebaseapp.com',
    storageBucket: 'super-labs-task.firebasestorage.app',
    measurementId: 'G-0JS2Z26CHZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZGx4HZsZH2A1tz0Jr9r_iKFCJir_fe4o',
    appId: '1:503039274314:android:1a3a3381d0a351d4a965b3',
    messagingSenderId: '503039274314',
    projectId: 'super-labs-task',
    storageBucket: 'super-labs-task.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXaM1SDqkhK_dqzQsQNsugBw5x_Q66xkg',
    appId: '1:503039274314:ios:82bf1726ebd21094a965b3',
    messagingSenderId: '503039274314',
    projectId: 'super-labs-task',
    storageBucket: 'super-labs-task.firebasestorage.app',
    iosBundleId: 'com.devop.superLabsTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXaM1SDqkhK_dqzQsQNsugBw5x_Q66xkg',
    appId: '1:503039274314:ios:82bf1726ebd21094a965b3',
    messagingSenderId: '503039274314',
    projectId: 'super-labs-task',
    storageBucket: 'super-labs-task.firebasestorage.app',
    iosBundleId: 'com.devop.superLabsTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA4I6NnmpW-EjxztKQBxojhbtcu0G4KYy0',
    appId: '1:503039274314:web:16a39f2fa967c104a965b3',
    messagingSenderId: '503039274314',
    projectId: 'super-labs-task',
    authDomain: 'super-labs-task.firebaseapp.com',
    storageBucket: 'super-labs-task.firebasestorage.app',
    measurementId: 'G-7GD40C4ZCV',
  );

}
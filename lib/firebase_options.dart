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
    apiKey: 'AIzaSyAaGLfvDO6kSDtVPSxJzTAXN0floZnwQac',
    appId: '1:489157215692:web:63f44c3d50ae7aef1e4969',
    messagingSenderId: '489157215692',
    projectId: 'project-whisper-32742',
    authDomain: 'project-whisper-32742.firebaseapp.com',
    storageBucket: 'project-whisper-32742.appspot.com',
    measurementId: 'G-S4TT0GZVFG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAu0S3LENBuFnLnh3VZw8ZbWGJ2C8jY9ZM',
    appId: '1:489157215692:android:0886af56966a38031e4969',
    messagingSenderId: '489157215692',
    projectId: 'project-whisper-32742',
    storageBucket: 'project-whisper-32742.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSsxXIzMh5SEFKekEX2TaM4ox-eVziTH0',
    appId: '1:489157215692:ios:cfd20bfbfa3947cd1e4969',
    messagingSenderId: '489157215692',
    projectId: 'project-whisper-32742',
    storageBucket: 'project-whisper-32742.appspot.com',
    iosBundleId: 'com.example.projectWhisper',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSsxXIzMh5SEFKekEX2TaM4ox-eVziTH0',
    appId: '1:489157215692:ios:e92a233501c4c2cf1e4969',
    messagingSenderId: '489157215692',
    projectId: 'project-whisper-32742',
    storageBucket: 'project-whisper-32742.appspot.com',
    iosBundleId: 'com.example.projectWhisper.RunnerTests',
  );
}
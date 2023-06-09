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
    apiKey: 'AIzaSyCWLqgrYlPluoD1xHlU_WXhpcilCAxyRwI',
    appId: '1:897038968699:web:d91e97b68bdb07b8737fde',
    messagingSenderId: '897038968699',
    projectId: 'ramadan-remainder',
    authDomain: 'ramadan-remainder.firebaseapp.com',
    storageBucket: 'ramadan-remainder.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSPLR8RGF3atQIix__ypgfWoNEAksVjN0',
    appId: '1:897038968699:android:6eb05b44cddca28b737fde',
    messagingSenderId: '897038968699',
    projectId: 'ramadan-remainder',
    storageBucket: 'ramadan-remainder.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7UIJPv-uFEILS-V0gLpa2MxjWiV-GDb8',
    appId: '1:897038968699:ios:e1f4e5d5b8cee1b3737fde',
    messagingSenderId: '897038968699',
    projectId: 'ramadan-remainder',
    storageBucket: 'ramadan-remainder.appspot.com',
    iosClientId: '897038968699-d82cgtpp82kopf1tvqgs8pbpjm8slhrk.apps.googleusercontent.com',
    iosBundleId: 'com.ababildev.ramadanplanner',
  );
}

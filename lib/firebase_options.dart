import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
        throw UnsupportedError('This platform is not configured');
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMWtmHyp6ydgLcyvBfLi-h3tTYSWL4y-g', // <-- paste your real Web API Key here
    appId: '1:782709282009:android:e86bb91cdd3c58e22685ac8',
    messagingSenderId: '782709282009',
    projectId: 'healthyhms-3cbb3',
    storageBucket: 'healthyhms-3cbb3.appspot.com',
  );
}
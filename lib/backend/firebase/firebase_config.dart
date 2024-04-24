import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBf_WD3serBgvanWYRG3bYCyTay_IETR9E",
            authDomain: "snap-learning-745e8.firebaseapp.com",
            projectId: "snap-learning-745e8",
            storageBucket: "snap-learning-745e8.appspot.com",
            messagingSenderId: "566125310921",
            appId: "1:566125310921:web:6588d9fd6dd12515806e18",
            measurementId: "G-EDR0NFWPCG"));
  } else {
    await Firebase.initializeApp();
  }
}

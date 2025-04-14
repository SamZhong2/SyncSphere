import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBzYlefH9-EPMCE3mrK_KXgJiGulwJ3eqM",
            authDomain: "sync-sphere-5rp6qk.firebaseapp.com",
            projectId: "sync-sphere-5rp6qk",
            storageBucket: "sync-sphere-5rp6qk.firebasestorage.app",
            messagingSenderId: "531824345975",
            appId: "1:531824345975:web:61b5a75fbef35cab98d772",
            measurementId: "G-1V33N56W97"));
  } else {
    await Firebase.initializeApp();
  }
}

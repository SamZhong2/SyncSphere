// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart'; // Required for currentUserUid

Future<String?> signInWithGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        '531824345975-4osrc9bvcbdbrcdhl2sc9eu7dgjr380q.apps.googleusercontent.com',
    scopes: <String>[
      'https://www.googleapis.com/auth/calendar',
      'https://www.googleapis.com/auth/calendar.events',
    ],
  );

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount == null) {
    // User cancelled the sign-in
    return null;
  }

  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final String? accessToken = googleSignInAuthentication.accessToken;

  // ✅ Save token to Firestore under the current user's document
  if (accessToken != null && currentUserUid != null) {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserUid)
        .update({'googleToken': accessToken});
  }

  return accessToken;
}

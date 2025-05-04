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

import 'dart:convert';
import 'dart:math' as math;

Future<String?> pullFromCalDocument(
  String? documentField,
  DocumentReference calDocument,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  try {
    final doc = await calDocument.get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>?;
      return data?[documentField]?.toString();
    }
    return null;
  } catch (e) {
    print('Error: $e');
    return null;
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> eventToJson(
  String title,
  String description,
  DateTime startTime,
  DateTime endTime,
) async {
  final json = {
    'summary': title,
    'description': description,
    'start': {'dateTime': startTime.toUtc().toIso8601String()},
    'end': {'dateTime': endTime.toUtc().toIso8601String()},
  };
  return json;
}

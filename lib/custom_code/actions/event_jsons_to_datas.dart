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

import '/flutter_flow/custom_functions.dart';

import 'dart:convert';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

Future<List<dynamic>> eventJsonsToDatas(List<dynamic> jsonList) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  List<String> keys = [
    "description",
    "displayName",
    "location",
    "start",
    "end",
  ];

  final output = <Map<String, String>>[];

  if (jsonList is! List) return output; // ← return empty list if input bad

  try {
    final customFormat =
        DateFormat('EEEE, MMMM d @ h:mm a'); // Your desired format

    for (final json in jsonList) {
      if (json is! Map<String, dynamic>) continue;

      final values = <String, String>{};

      for (final key in keys) {
        final value = json[key];

        if (value == null) continue;

        if ((key == "start" || key == "end") &&
            value is Map<String, dynamic> &&
            value.containsKey("dateTime")) {
          final dateTimeStr = value["dateTime"];
          try {
            final dateTime = DateTime.parse(dateTimeStr).toLocal();
            values[key == "start" ? "Start" : "End"] =
                customFormat.format(dateTime);
          } catch (e) {
            values[key] = value.toString();
          }
        } else {
          values[key] = value.toString();
        }
      }

      if (values.isNotEmpty) {
        output.add(values);
      }
    }

    return output;
  } catch (e, stackTrace) {
    print('Error in eventJsonListToData: $e\n$stackTrace');
    return output; // ← even if error, still return empty or partial list
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

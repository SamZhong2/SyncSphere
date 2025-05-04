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
import 'package:http/http.dart' as http;

Future<String> addEventsToCalendar(
  String? accessToken,
  List<dynamic> jsonEvents,
  String? calendarId,
) async {
  if (accessToken == null || accessToken.isEmpty) {
    return 'Access token is missing.';
  }
  if (calendarId == null || calendarId.isEmpty) {
    calendarId = "primary";
  }

  final headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
  };

  for (int i = 0; i < jsonEvents.length; i++) {
    final event = jsonEvents[i];
    print('Sending event ${i + 1}: ${jsonEncode(event)}');

    final response = await http.post(
      Uri.parse(
          'https://www.googleapis.com/calendar/v3/calendars/${calendarId}/events'),
      headers: headers,
      body: jsonEncode(event),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      print('❌ Error inserting event ${i + 1}: ${response.statusCode}');
      print('Response body: ${response.body}');
      return 'Failed to insert event ${i + 1}: ${response.body}';
    } else {
      return '✅ Event ${i + 1} inserted successfully.';
    }
  }

  return 'All events added successfully.';
}

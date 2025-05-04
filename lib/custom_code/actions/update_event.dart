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
import 'package:intl/intl.dart';

Future<String> updateEvent(
  String? accessToken,
  String? calendarId,
  dynamic existingEvent,
  dynamic newDataJson,
) async {
  if (accessToken == null || accessToken.isEmpty) {
    return 'Access token missing.';
  }

  if (existingEvent == null || existingEvent['id'] == null) {
    return 'Existing event or event ID missing.';
  }

  if (newDataJson == null || newDataJson.isEmpty) {
    return 'New event data missing.';
  }

  final eventId = existingEvent['id'];
  final headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
  };

  final Map<String, dynamic> newData = newDataJson[0];

  // ✅ Extract the 'dateTime' string safely
  final String startDateTime = newData['start']['dateTime'];
  final String endDateTime = newData['end']['dateTime'];

  final Map<String, dynamic> updatedEvent = {
    'summary': newData['summary'],
    'description': newData['description'],
    'start': {
      'dateTime': startDateTime,
      'timeZone': 'UTC',
    },
    'end': {
      'dateTime': endDateTime,
      'timeZone': 'UTC',
    },
  };

  final url = Uri.parse(
    'https://www.googleapis.com/calendar/v3/calendars/$calendarId/events/$eventId',
  );

  try {
    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(updatedEvent),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return 'Success';
    } else {
      return 'Failed: ${response.body}';
    }
  } catch (e) {
    return 'Error: $e';
  }
}

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

Future<List<dynamic>> getEventsFromCalendar(
    String accessToken, String? calendarId) async {
  if (calendarId == null) calendarId = 'primary';
  // Add your function code here!
  final headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
  };
  final response = await http.get(
    Uri.parse(
        'https://www.googleapis.com/calendar/v3/calendars/${calendarId}/events'),
    headers: headers,
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> events = jsonResponse['items'];
    return events;
  } else {
    print('Failed to fetch events event: ${response.statusCode}');
    print('Response body: ${response.body}');
    return [];
  }
}

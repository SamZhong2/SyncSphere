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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchCalendarList(String accessToken) async {
  final headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    Uri.parse('https://www.googleapis.com/calendar/v3/users/me/calendarList'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse.containsKey('items') && jsonResponse['items'] is List) {
      final List<dynamic> calendars = jsonResponse['items'];
      // final List<String> calendarNames =
      // calendars.map((calendar) => '${calendar['summary']}, ${calendar['id']}').toList();
      // calendars.map((calendar) => calendar['summary'].toString()).toList();
      return calendars;
    }
  }

  print('Failed to fetch calendars: ${response.statusCode}');
  print('Response body: ${response.body}');
  return ['${response.statusCode}', '${response.body}'];
}

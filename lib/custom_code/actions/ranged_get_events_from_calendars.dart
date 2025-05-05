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
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart'; // Needed for signInWithGoogle()

Future<List<dynamic>> rangedGetEventsFromCalendars(
  String accessToken,
  int offset,
) async {
  final headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
  };

  // --- Step 1: Fetch calendar list ---
  final calendarListUri =
      Uri.parse('https://www.googleapis.com/calendar/v3/users/me/calendarList');
  final calendarListResponse =
      await http.get(calendarListUri, headers: headers);

  if (calendarListResponse.statusCode == 200) {
    final calendarListJson = json.decode(calendarListResponse.body);
    final List<dynamic> calendars = calendarListJson['items'] ?? [];

    // Step 2: Extract calendar IDs
    final List<String> calendarIds = calendars
        .where((calendar) => calendar != null && calendar['id'] != null)
        .map<String>((calendar) => calendar['id'] as String)
        .toList();

    // Step 3: Calculate timeMin and timeMax
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);

    final timeMin =
        offset >= 0 ? todayStart : todayStart.add(Duration(days: offset));
    final timeMax = offset >= 0
        ? todayStart.add(Duration(days: offset + 1))
        : todayStart.add(const Duration(days: 1));

    List<dynamic> allEvents = [];

    // Step 4: Fetch events for each calendar
    for (final calendarId in calendarIds) {
      if (calendarId == null) continue;

      String? nextPageToken;
      do {
        final uri;
        if (offset != null) {
          uri = Uri.parse(
            'https://www.googleapis.com/calendar/v3/calendars/$calendarId/events'
            '?timeMin=${timeMin.toUtc().toIso8601String()}'
            '&timeMax=${timeMax.toUtc().toIso8601String()}'
            '&singleEvents=true'
            '&orderBy=startTime'
            '&maxResults=250'
            '${nextPageToken != null ? '&pageToken=$nextPageToken' : ''}',
          );
        } else {
          uri = Uri.parse(
            'https://www.googleapis.com/calendar/v3/calendars/$calendarId/events'
            '&singleEvents=true'
            '&orderBy=startTime'
            '&maxResults=250'
            '${nextPageToken != null ? '&pageToken=$nextPageToken' : ''}',
          );
        }

        final response = await http.get(uri, headers: headers);

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonResponse = json.decode(response.body);
          final List<dynamic> events = jsonResponse['items'] ?? [];
          allEvents.addAll(events);

          nextPageToken = jsonResponse['nextPageToken'];
        } else if (response.statusCode == 401 || response.statusCode == 403) {
          print(
              'Access token failed while fetching events. Trying to reauthenticate...');
          final newToken = await signInWithGoogle();
          if (newToken == null) {
            throw Exception('Google Sign-In failed. Access token not renewed.');
          }
          return await rangedGetEventsFromCalendars(newToken, offset);
        } else {
          final error = json.decode(response.body);
          final message = error['error']?['message'] ?? 'Unknown error';
          throw Exception(
              'Calendar API error ${response.statusCode}: $message');
        }
      } while (nextPageToken != null);
    }

    return allEvents;
  }

  // Handle 401/403 error during calendar list fetch
  else if (calendarListResponse.statusCode == 401 ||
      calendarListResponse.statusCode == 403) {
    print(
        'Access token failed while fetching calendar list. Trying to reauthenticate...');
    final newToken = await signInWithGoogle();
    if (newToken == null) {
      throw Exception('Google Sign-In failed. Access token not renewed.');
    }
    return await rangedGetEventsFromCalendars(newToken, offset);
  }

  // Other calendar list errors
  else {
    final error = json.decode(calendarListResponse.body);
    final message =
        error['error']?['message'] ?? 'Unknown error fetching calendars';
    throw Exception(
        'Calendar List API error ${calendarListResponse.statusCode}: $message');
  }
}

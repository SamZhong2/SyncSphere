import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String convertIsoString(
  String iso8601String,
  String format,
) {
  try {
    DateTime dateTime = DateTime.parse(iso8601String);
    return DateFormat(format).format(dateTime);
  } catch (e) {
    return 'Invalid date format'; // Handle error
  }
}

dynamic calendarJsonToData(
  List<dynamic> calendarJsonList,
  int index,
  List<dynamic> eventList,
) {
  List<String> data = [
    "Time Zone: ",
    "Description: ",
    "Total Number of Events: ",
    "Number of Events With Recurrences: "
  ];
  List<String> jsonData = [
    "timeZone",
    "description",
  ];

  for (int i = 0; i < 2; i++) {
    String appenData = "Unknown";
    if (calendarJsonList[index][jsonData[i]] != null)
      appenData = calendarJsonList[index][jsonData[i]];
    data[i] += appenData;
  }
  int rCounter = 0;
  for (var json in eventList) {
    if (json['recurrence'] != null) rCounter++;
  }
  data[2] += eventList.length.toString();
  data[3] += rCounter.toString();

  return data;
}

List<String> calendarJsonToNames(List<dynamic> calendarJsonList) {
  List<String> names = [];
  for (var json in calendarJsonList) {
    if (json['summary'] != null) {
      names.add(json['summary']);
    }
  }
  return names;
}

List<String> calendarJsonToIds(List<dynamic> calendarJsonList) {
  List<String> ids = [];
  for (var json in calendarJsonList) {
    if (json['id'] != null) {
      ids.add(json['id']);
    }
  }
  return ids;
}

int decipherPosition(
  List<String> list,
  String selection,
) {
  for (int i = 0; i < list.length; i++) {
    if (selection == list[i]) return i;
  }
  return 0;
}

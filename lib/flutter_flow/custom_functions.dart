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
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int decipherPosition(
  List<String> list,
  String selection,
) {
  for (int i = 0; i < list.length; i++) {
    if (selection == list[i]) return i;
  }
  return 0;
}

bool isJson(String aiRsponse) {
  if (aiRsponse.startsWith == "JSON INCOMING:") return true;
  if (aiRsponse.startsWith == "\${warningText}") return true;

  return false;
}

String stringListToString(List<String> string) {
  // input is a string list, output is a string
  return string.join(', '); // Join the list of strings with a comma and space
}

List<String>? jsonListToStringList(List<dynamic> json) {
  // given the list of jsons as input, output those same jsons just in string format
  List<String> jsontoString(List<dynamic> json) {
    return json.map((item) => jsonEncode(item)).toList();
  }
}

List<String> calendarJsonToData(
  List<dynamic> calendarJsonList,
  int index,
  List<dynamic> eventList,
) {
  final data = <String>[
    "Description: ",
    "Time Zone: ",
    "Total Number of Events: ",
    "Number of Events With Recurrences: "
  ];

  final jsonKeys = ["description", "timeZone"];

  for (int i = 0; i < jsonKeys.length; i++) {
    final key = jsonKeys[i];
    final value = calendarJsonList[index] is Map<String, dynamic>
        ? calendarJsonList[index][key]
        : null;
    data[i] += value?.toString() ?? "Blank";
  }

  int recurrenceCount = 0;
  for (final event in eventList) {
    if (event is Map<String, dynamic> && event['recurrence'] != null) {
      recurrenceCount++;
    }
  }

  data[2] += eventList.length.toString();
  data[3] += recurrenceCount.toString();

  return data;
}

int estimateLineCount(String text) {
  double baseWidth = 10.125;
  double containerWidth = 300;
  final charWeights = {
    // Narrow chars
    'i': 0.5, 'l': 0.5, 'I': 0.6, '!': 0.5, '.': 0.5, ',': 0.5, '\'': 0.3,
    '`': 0.4,

    // Slightly narrow
    'j': 0.6, 't': 0.7, 'f': 0.7, 'r': 0.7,

    // Average width
    'a': 1.0, 'c': 1.0, 'e': 1.0, 'o': 1.0, 's': 1.0, 'u': 1.0, 'v': 1.0,
    'x': 1.0,
    'n': 1.0, 'm': 1.2, 'w': 1.2, 'A': 1.1, 'C': 1.1, 'E': 1.1, 'O': 1.1,
    'S': 1.1,
    '0': 1.0, '1': 0.8, '2': 1.0, '3': 1.0, '4': 1.0, '5': 1.0, '6': 1.0,
    '7': 1.0,
    '8': 1.0, '9': 1.0, '-': 0.9, '_': 1.0, '=': 1.0, ':': 0.5, ';': 0.5,
    '"': 0.8,

    // Wide
    'M': 1.4, 'W': 1.4, 'Q': 1.3, '@': 1.3,

    // Spaces
    ' ': 0.6,
  };

  double width = 0.0;
  for (int i = 0; i < text.length; i++) {
    final weight = charWeights[text[i]] ?? 1.0; // fallback to 1.0 for unknowns
    width += weight * baseWidth;
  }

  return (width / containerWidth).ceil();
}

List<String>? dataJsonToStrings(dynamic dataJson) {
  List<String> formattedList = [];

  dataJson.forEach((key, value) {
    // Capitalize the key (replace underscores with spaces and title case it)
    String formattedKey = key.replaceAll('_', ' ').split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      }
      return word;
    }).join(' ');

    // Add formatted key-value pair
    formattedList.add('$formattedKey: $value');
  });

  return formattedList;
}

List<String> pullFromJsonList(
  List<dynamic> jsonList,
  String item,
) {
  List<String> names = [];

  for (var json in jsonList) {
    dynamic value = json;
    List<String> parts = item.split('.');

    for (String part in parts) {
      if (value is Map<String, dynamic> && value.containsKey(part)) {
        value = value[part];
      } else {
        value = null;
        break;
      }
    }

    if (value != null) {
      names.add(value.toString());
    }
  }

  return names;
}

String? pullsFromJson(
  dynamic json,
  List<String> keys,
) {
  if (json is! Map<String, dynamic>) return null;

  try {
    if (keys.length == 1) {
      final value = json[keys.first];
      return value?.toString();
    }

    final buffer = StringBuffer();
    for (final key in keys) {
      final value = json[key];
      if (value != null) {
        buffer.writeln(value.toString());
      }
    }

    final result = buffer.toString().trim();
    return result.isEmpty ? null : result;
  } catch (e, stackTrace) {
    print('Error in pullsFromJson: $e\n$stackTrace');
    return null;
  }
}

DateTime stringToDate(String dateString) {
  // Parse the main datetime part
  DateTime parsed = DateTime.parse(dateString);

  // Find the timezone part manually
  String timezonePart = dateString.substring(dateString.length - 6);

  // Parse timezone offset
  int sign = timezonePart.startsWith('-') ? -1 : 1;
  int hoursOffset = int.parse(timezonePart.substring(1, 3));
  int minutesOffset = int.parse(timezonePart.substring(4, 6));

  // Total offset in minutes
  int totalOffsetMinutes = sign * (hoursOffset * 60 + minutesOffset);

  // Apply the offset
  DateTime adjusted = parsed.add(Duration(minutes: totalOffsetMinutes));

  return adjusted;
}

String promptModifier(String selection) {
  String output =
      '''Take on the role of a helpful calendar assistant, your name is Cal, and you are happy to help with any of the users needs.
      
      [when responding to a user, format your response in markdown.]
      ''';
  if (selection == "plan") {
    output +=
        '''You have entered plan mode: It is your primary objective to assist the user in planning something.
    
    The user may want you to offer them many possible plans or perhaps one highly detailed plan, whatever it may be ensure the user's plans are created and meet all specifications that they set.''';
  }
  if (selection == "search") {}
  if (selection == "convo") {
    output +=
        '''You have entered conversation mode: It is your primary objective to talk to the user, to be friendly, polite and when appropriate funny. you should aim to entertain the user, it is unlikely the user is attempting to generarte a meaningful conversatoion but rather a fun one.
    
    Do your best to mirror the tone and attitude of the user so whatever their conversational need may be, you can comply.''';
  }

  output += '''
  
  BELOW IS ANY CALENDAR INFORMATION THE USER HAS GIVEN YOU.
  
  if it is instead one or more calendar entries, please reference them when appropriate, if there is nothing, that means no events were found, if the user believes there should one or more events, tell them to reload the daily briefing.
  
  UPCOMING EVENTS:
  ''';
  return output;
}

List<String>? chatLogToList(String? chatLog) {
  if (chatLog == null || chatLog.isEmpty) return null;

  final RegExp entryPattern = RegExp(
    r", user prompt:\s*(.*?)\s*, your response:\s*(.*?)(?=, user prompt:|$)",
    dotAll: true,
    caseSensitive: false,
  );

  final matches = entryPattern.allMatches(chatLog);

  if (matches.isEmpty) return null;

  final List<String> entries = matches.map((match) {
    final userPrompt = match.group(1)?.trim() ?? '';
    String response = match.group(2)?.trim() ?? '';

    // Truncate response at 'USER ENDED SESSION.' if present
    final endSessionIndex = response.indexOf('USER ENDED SESSION.');
    if (endSessionIndex != -1) {
      response = response.substring(0, endSessionIndex).trim();
    }

    return 'User: $userPrompt\n\nAssistant: $response';
  }).toList();

  return entries;
}

List<int> stringListToindexList(List<String> someList) {
  // given a list of strings make a list of integers for each index
  return List<int>.generate(someList.length, (index) => index);
}

String? pullFromChatLogJsonString(
  String? input,
  int index,
) {
  if (input == null || input.isEmpty) return null;

  try {
    final titleStart = input.indexOf('Title:');
    final logStart = input.indexOf(', conversationLog:');

    if (titleStart == -1 || logStart == -1) return null;

    final title = input
        .substring(
          titleStart + 'Title:'.length,
          logStart,
        )
        .trim();

    final log = input
        .substring(
          logStart + ', conversationLog:'.length,
        )
        .trim()
        .replaceAll(RegExp(r'}\s*$'), ''); // strip trailing '}'

    if (index == 0) return title;
    if (index == 1) return log;

    return null;
  } catch (e, stackTrace) {
    print('Error in pullFromPseudoJsonAsString: $e\n$stackTrace');
    return null;
  }
}

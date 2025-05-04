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

import 'package:cloud_firestore/cloud_firestore.dart'; // Moved this import to the top

Future<String> getsEvents() async {
  StringBuffer eventList = StringBuffer();
  try {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('events').get();

    for (var doc in snapshot.docs) {
      String date = doc['date'] ?? 'No date'; // Handle null case
      String name = doc['name'] ?? 'No name'; // Handle null case
      String description =
          doc['description'] ?? 'No description'; // Handle null case
      eventList.writeln('$date: $name - $description');
    }
  } catch (e) {
    print("Error retrieving events: $e");
  }

  return eventList.toString();
}

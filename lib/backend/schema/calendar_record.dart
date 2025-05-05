import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarRecord extends FirestoreRecord {
  CalendarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CalanderName" field.
  String? _calanderName;
  String get calanderName => _calanderName ?? '';
  bool hasCalanderName() => _calanderName != null;

  // "CalendarJson" field.
  String? _calendarJson;
  String get calendarJson => _calendarJson ?? '';
  bool hasCalendarJson() => _calendarJson != null;

  // "UID" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "calendarId" field.
  String? _calendarId;
  String get calendarId => _calendarId ?? '';
  bool hasCalendarId() => _calendarId != null;

  // "CalanderDescription" field.
  List<String>? _calanderDescription;
  List<String> get calanderDescription => _calanderDescription ?? const [];
  bool hasCalanderDescription() => _calanderDescription != null;

  // "numberOfEvents" field.
  int? _numberOfEvents;
  int get numberOfEvents => _numberOfEvents ?? 0;
  bool hasNumberOfEvents() => _numberOfEvents != null;

  void _initializeFields() {
    _calanderName = snapshotData['CalanderName'] as String?;
    _calendarJson = snapshotData['CalendarJson'] as String?;
    _uid = snapshotData['UID'] as String?;
    _calendarId = snapshotData['calendarId'] as String?;
    _calanderDescription = getDataList(snapshotData['CalanderDescription']);
    _numberOfEvents = castToType<int>(snapshotData['numberOfEvents']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Calendar');

  static Stream<CalendarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CalendarRecord.fromSnapshot(s));

  static Future<CalendarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CalendarRecord.fromSnapshot(s));

  static CalendarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CalendarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CalendarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CalendarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CalendarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CalendarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCalendarRecordData({
  String? calanderName,
  String? calendarJson,
  String? uid,
  String? calendarId,
  int? numberOfEvents,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CalanderName': calanderName,
      'CalendarJson': calendarJson,
      'UID': uid,
      'calendarId': calendarId,
      'numberOfEvents': numberOfEvents,
    }.withoutNulls,
  );

  return firestoreData;
}

class CalendarRecordDocumentEquality implements Equality<CalendarRecord> {
  const CalendarRecordDocumentEquality();

  @override
  bool equals(CalendarRecord? e1, CalendarRecord? e2) {
    const listEquality = ListEquality();
    return e1?.calanderName == e2?.calanderName &&
        e1?.calendarJson == e2?.calendarJson &&
        e1?.uid == e2?.uid &&
        e1?.calendarId == e2?.calendarId &&
        listEquality.equals(e1?.calanderDescription, e2?.calanderDescription) &&
        e1?.numberOfEvents == e2?.numberOfEvents;
  }

  @override
  int hash(CalendarRecord? e) => const ListEquality().hash([
        e?.calanderName,
        e?.calendarJson,
        e?.uid,
        e?.calendarId,
        e?.calanderDescription,
        e?.numberOfEvents
      ]);

  @override
  bool isValidKey(Object? o) => o is CalendarRecord;
}

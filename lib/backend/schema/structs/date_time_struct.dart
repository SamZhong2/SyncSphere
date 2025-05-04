// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DateTimeStruct extends FFFirebaseStruct {
  DateTimeStruct({
    DateTime? dateTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dateTime = dateTime,
        super(firestoreUtilData);

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? val) => _dateTime = val;

  bool hasDateTime() => _dateTime != null;

  static DateTimeStruct fromMap(Map<String, dynamic> data) => DateTimeStruct(
        dateTime: data['dateTime'] as DateTime?,
      );

  static DateTimeStruct? maybeFromMap(dynamic data) =>
      data is Map ? DateTimeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'dateTime': _dateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dateTime': serializeParam(
          _dateTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DateTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DateTimeStruct(
        dateTime: deserializeParam(
          data['dateTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DateTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DateTimeStruct && dateTime == other.dateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([dateTime]);
}

DateTimeStruct createDateTimeStruct({
  DateTime? dateTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DateTimeStruct(
      dateTime: dateTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DateTimeStruct? updateDateTimeStruct(
  DateTimeStruct? dateTimeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dateTimeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDateTimeStructData(
  Map<String, dynamic> firestoreData,
  DateTimeStruct? dateTimeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dateTimeStruct == null) {
    return;
  }
  if (dateTimeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dateTimeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dateTimeStructData =
      getDateTimeFirestoreData(dateTimeStruct, forFieldValue);
  final nestedData =
      dateTimeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dateTimeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDateTimeFirestoreData(
  DateTimeStruct? dateTimeStruct, [
  bool forFieldValue = false,
]) {
  if (dateTimeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dateTimeStruct.toMap());

  // Add any Firestore field values
  dateTimeStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDateTimeListFirestoreData(
  List<DateTimeStruct>? dateTimeStructs,
) =>
    dateTimeStructs?.map((e) => getDateTimeFirestoreData(e, true)).toList() ??
    [];

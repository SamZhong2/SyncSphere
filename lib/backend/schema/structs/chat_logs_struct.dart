// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChatLogsStruct extends FFFirebaseStruct {
  ChatLogsStruct({
    String? title,
    String? conversationLog,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _conversationLog = conversationLog,
        super(firestoreUtilData);

  // "Title" field.
  String? _title;
  String get title => _title ?? 'Untitled';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "conversationLog" field.
  String? _conversationLog;
  String get conversationLog => _conversationLog ?? 'user prompt:';
  set conversationLog(String? val) => _conversationLog = val;

  bool hasConversationLog() => _conversationLog != null;

  static ChatLogsStruct fromMap(Map<String, dynamic> data) => ChatLogsStruct(
        title: data['Title'] as String?,
        conversationLog: data['conversationLog'] as String?,
      );

  static ChatLogsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatLogsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'conversationLog': _conversationLog,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'conversationLog': serializeParam(
          _conversationLog,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatLogsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatLogsStruct(
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        conversationLog: deserializeParam(
          data['conversationLog'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatLogsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatLogsStruct &&
        title == other.title &&
        conversationLog == other.conversationLog;
  }

  @override
  int get hashCode => const ListEquality().hash([title, conversationLog]);
}

ChatLogsStruct createChatLogsStruct({
  String? title,
  String? conversationLog,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatLogsStruct(
      title: title,
      conversationLog: conversationLog,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatLogsStruct? updateChatLogsStruct(
  ChatLogsStruct? chatLogs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatLogs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatLogsStructData(
  Map<String, dynamic> firestoreData,
  ChatLogsStruct? chatLogs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatLogs == null) {
    return;
  }
  if (chatLogs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatLogs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatLogsData = getChatLogsFirestoreData(chatLogs, forFieldValue);
  final nestedData = chatLogsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatLogs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatLogsFirestoreData(
  ChatLogsStruct? chatLogs, [
  bool forFieldValue = false,
]) {
  if (chatLogs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatLogs.toMap());

  // Add any Firestore field values
  chatLogs.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatLogsListFirestoreData(
  List<ChatLogsStruct>? chatLogss,
) =>
    chatLogss?.map((e) => getChatLogsFirestoreData(e, true)).toList() ?? [];

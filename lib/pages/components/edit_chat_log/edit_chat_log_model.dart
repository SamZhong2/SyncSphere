import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_chat_log_widget.dart' show EditChatLogWidget;
import 'package:flutter/material.dart';

class EditChatLogModel extends FlutterFlowModel<EditChatLogWidget> {
  ///  Local state fields for this component.

  String? titleField = 'Title';

  String? logField =
      ', user prompt: example prompt, your response: example response';

  List<ChatLogsStruct> newChatLogList = [];
  void addToNewChatLogList(ChatLogsStruct item) => newChatLogList.add(item);
  void removeFromNewChatLogList(ChatLogsStruct item) =>
      newChatLogList.remove(item);
  void removeAtIndexFromNewChatLogList(int index) =>
      newChatLogList.removeAt(index);
  void insertAtIndexInNewChatLogList(int index, ChatLogsStruct item) =>
      newChatLogList.insert(index, item);
  void updateNewChatLogListAtIndex(
          int index, Function(ChatLogsStruct) updateFn) =>
      newChatLogList[index] = updateFn(newChatLogList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

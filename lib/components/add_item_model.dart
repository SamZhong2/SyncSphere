import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_item_widget.dart' show AddItemWidget;
import 'package:flutter/material.dart';

class AddItemModel extends FlutterFlowModel<AddItemWidget> {
  ///  Local state fields for this component.

  List<String> calendarNameList = [];
  void addToCalendarNameList(String item) => calendarNameList.add(item);
  void removeFromCalendarNameList(String item) => calendarNameList.remove(item);
  void removeAtIndexFromCalendarNameList(int index) =>
      calendarNameList.removeAt(index);
  void insertAtIndexInCalendarNameList(int index, String item) =>
      calendarNameList.insert(index, item);
  void updateCalendarNameListAtIndex(int index, Function(String) updateFn) =>
      calendarNameList[index] = updateFn(calendarNameList[index]);

  List<String> calendarIdList = [];
  void addToCalendarIdList(String item) => calendarIdList.add(item);
  void removeFromCalendarIdList(String item) => calendarIdList.remove(item);
  void removeAtIndexFromCalendarIdList(int index) =>
      calendarIdList.removeAt(index);
  void insertAtIndexInCalendarIdList(int index, String item) =>
      calendarIdList.insert(index, item);
  void updateCalendarIdListAtIndex(int index, Function(String) updateFn) =>
      calendarIdList[index] = updateFn(calendarIdList[index]);

  int? selection;

  ///  State fields for stateful widgets in this component.

  // State field(s) for itemTypeDrop widget.
  String? itemTypeDropValue;
  FormFieldController<String>? itemTypeDropValueController;
  // State field(s) for selectionDrop widget.
  String? selectionDropValue;
  FormFieldController<String>? selectionDropValueController;
  // Stores action output result for [Custom Action - signInWithGoogle] action in Button widget.
  String? updated2GoogleToken;
  // Stores action output result for [Custom Action - getEventsFromCalendar] action in Button widget.
  List<dynamic>? eventList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

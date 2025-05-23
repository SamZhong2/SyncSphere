import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_calendar_widget.dart' show AddCalendarWidget;
import 'package:flutter/material.dart';

class AddCalendarModel extends FlutterFlowModel<AddCalendarWidget> {
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

  int loopingInt = 0;

  int eventListNum = 100;

  bool nullSelected = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for itemTypeDrop widget.
  String? itemTypeDropValue;
  FormFieldController<String>? itemTypeDropValueController;
  // State field(s) for selectionDrop widget.
  String? selectionDropValue;
  FormFieldController<String>? selectionDropValueController;
  // Stores action output result for [Custom Action - signInWithGoogle] action in Button widget.
  String? updatedGoogleToken;
  // Stores action output result for [Custom Action - getEventsFromCalendar] action in Button widget.
  List<dynamic>? eventListFromFetch;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CalendarRecord? calendarAdded;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

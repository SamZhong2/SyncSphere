import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/calendar_item/calendar_item_widget.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<CalendarRecord> calendarDoc = [];
  void addToCalendarDoc(CalendarRecord item) => calendarDoc.add(item);
  void removeFromCalendarDoc(CalendarRecord item) => calendarDoc.remove(item);
  void removeAtIndexFromCalendarDoc(int index) => calendarDoc.removeAt(index);
  void insertAtIndexInCalendarDoc(int index, CalendarRecord item) =>
      calendarDoc.insert(index, item);
  void updateCalendarDocAtIndex(int index, Function(CalendarRecord) updateFn) =>
      calendarDoc[index] = updateFn(calendarDoc[index]);

  int loopingInt = 0;

  int hourFormat = 12;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<CalendarRecord>? prevDocs;
  // Stores action output result for [Custom Action - calNamesToIds] action in HomePage widget.
  List<String>? calNames;
  // Models for calendarItem dynamic component.
  late FlutterFlowDynamicModels<CalendarItemModel> calendarItemModels;
  // Stores action output result for [Custom Action - pullFromCalDocument] action in rightButton widget.
  String? calendarNamefromPull;
  // Stores action output result for [Firestore Query - Query a collection] action in rightButton widget.
  CalendarRecord? theCalendar;
  // Stores action output result for [Custom Action - fetchCalendarList] action in IconButton widget.
  List<dynamic>? calendarListFromFetch;

  @override
  void initState(BuildContext context) {
    calendarItemModels = FlutterFlowDynamicModels(() => CalendarItemModel());
  }

  @override
  void dispose() {
    calendarItemModels.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/event_item/event_item_widget.dart';
import 'calendar_list_view_widget.dart' show CalendarListViewWidget;
import 'package:flutter/material.dart';

class CalendarListViewModel extends FlutterFlowModel<CalendarListViewWidget> {
  ///  Local state fields for this page.

  List<dynamic> eventList = [];
  void addToEventList(dynamic item) => eventList.add(item);
  void removeFromEventList(dynamic item) => eventList.remove(item);
  void removeAtIndexFromEventList(int index) => eventList.removeAt(index);
  void insertAtIndexInEventList(int index, dynamic item) =>
      eventList.insert(index, item);
  void updateEventListAtIndex(int index, Function(dynamic) updateFn) =>
      eventList[index] = updateFn(eventList[index]);

  String branch = 'noneHit';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getEventsFromCalendar] action in CalendarListView widget.
  List<dynamic>? eventListfromPort;
  // Stores action output result for [Custom Action - eventListProcessor] action in CalendarListView widget.
  List<dynamic>? listViewEventList1;
  // Stores action output result for [Custom Action - signInWithGoogle] action in CalendarListView widget.
  String? updatedGoogleToken;
  // Stores action output result for [Custom Action - getEventsFromCalendar] action in CalendarListView widget.
  List<dynamic>? eventListfromPostLog;
  // Stores action output result for [Custom Action - eventListProcessor] action in CalendarListView widget.
  List<dynamic>? listViewEventListPostLog;
  // Stores action output result for [Custom Action - eventJsonsToDatas] action in CalendarListView widget.
  List<dynamic>? eventDataJsons;
  // Models for eventItem dynamic component.
  late FlutterFlowDynamicModels<EventItemModel> eventItemModels;

  @override
  void initState(BuildContext context) {
    eventItemModels = FlutterFlowDynamicModels(() => EventItemModel());
  }

  @override
  void dispose() {
    eventItemModels.dispose();
  }
}

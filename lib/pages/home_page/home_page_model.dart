import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String projectName = 'Untitled Project';

  List<String> itemTitles = [];
  void addToItemTitles(String item) => itemTitles.add(item);
  void removeFromItemTitles(String item) => itemTitles.remove(item);
  void removeAtIndexFromItemTitles(int index) => itemTitles.removeAt(index);
  void insertAtIndexInItemTitles(int index, String item) =>
      itemTitles.insert(index, item);
  void updateItemTitlesAtIndex(int index, Function(String) updateFn) =>
      itemTitles[index] = updateFn(itemTitles[index]);

  List<String> dataSection = [];
  void addToDataSection(String item) => dataSection.add(item);
  void removeFromDataSection(String item) => dataSection.remove(item);
  void removeAtIndexFromDataSection(int index) => dataSection.removeAt(index);
  void insertAtIndexInDataSection(int index, String item) =>
      dataSection.insert(index, item);
  void updateDataSectionAtIndex(int index, Function(String) updateFn) =>
      dataSection[index] = updateFn(dataSection[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchCalendarList] action in IconButton widget.
  List<dynamic>? calendarListFromFetch;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

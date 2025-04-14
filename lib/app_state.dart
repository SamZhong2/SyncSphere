import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// a list of all of the items you can add to a project.
  ///
  /// Calendar, Document, Spreadsheet, Picture
  List<String> _itemTypeList = ['Calendar'];
  List<String> get itemTypeList => _itemTypeList;
  set itemTypeList(List<String> value) {
    _itemTypeList = value;
  }

  void addToItemTypeList(String value) {
    itemTypeList.add(value);
  }

  void removeFromItemTypeList(String value) {
    itemTypeList.remove(value);
  }

  void removeAtIndexFromItemTypeList(int index) {
    itemTypeList.removeAt(index);
  }

  void updateItemTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    itemTypeList[index] = updateFn(_itemTypeList[index]);
  }

  void insertAtIndexInItemTypeList(int index, String value) {
    itemTypeList.insert(index, value);
  }

  bool _isGoogleSelected = false;
  bool get isGoogleSelected => _isGoogleSelected;
  set isGoogleSelected(bool value) {
    _isGoogleSelected = value;
  }

  bool _isMicrosoftSelected = false;
  bool get isMicrosoftSelected => _isMicrosoftSelected;
  set isMicrosoftSelected(bool value) {
    _isMicrosoftSelected = value;
  }

  bool _isAppleSelected = false;
  bool get isAppleSelected => _isAppleSelected;
  set isAppleSelected(bool value) {
    _isAppleSelected = value;
  }

  List<dynamic> _calendarJSONList = [];
  List<dynamic> get calendarJSONList => _calendarJSONList;
  set calendarJSONList(List<dynamic> value) {
    _calendarJSONList = value;
  }

  void addToCalendarJSONList(dynamic value) {
    calendarJSONList.add(value);
  }

  void removeFromCalendarJSONList(dynamic value) {
    calendarJSONList.remove(value);
  }

  void removeAtIndexFromCalendarJSONList(int index) {
    calendarJSONList.removeAt(index);
  }

  void updateCalendarJSONListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    calendarJSONList[index] = updateFn(_calendarJSONList[index]);
  }

  void insertAtIndexInCalendarJSONList(int index, dynamic value) {
    calendarJSONList.insert(index, value);
  }

  List<String> _ProjectTitleList = [];
  List<String> get ProjectTitleList => _ProjectTitleList;
  set ProjectTitleList(List<String> value) {
    _ProjectTitleList = value;
  }

  void addToProjectTitleList(String value) {
    ProjectTitleList.add(value);
  }

  void removeFromProjectTitleList(String value) {
    ProjectTitleList.remove(value);
  }

  void removeAtIndexFromProjectTitleList(int index) {
    ProjectTitleList.removeAt(index);
  }

  void updateProjectTitleListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ProjectTitleList[index] = updateFn(_ProjectTitleList[index]);
  }

  void insertAtIndexInProjectTitleList(int index, String value) {
    ProjectTitleList.insert(index, value);
  }

  List<dynamic> _eventList = [];
  List<dynamic> get eventList => _eventList;
  set eventList(List<dynamic> value) {
    _eventList = value;
  }

  void addToEventList(dynamic value) {
    eventList.add(value);
  }

  void removeFromEventList(dynamic value) {
    eventList.remove(value);
  }

  void removeAtIndexFromEventList(int index) {
    eventList.removeAt(index);
  }

  void updateEventListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    eventList[index] = updateFn(_eventList[index]);
  }

  void insertAtIndexInEventList(int index, dynamic value) {
    eventList.insert(index, value);
  }

  List<dynamic> _projectDescriptions = [];
  List<dynamic> get projectDescriptions => _projectDescriptions;
  set projectDescriptions(List<dynamic> value) {
    _projectDescriptions = value;
  }

  void addToProjectDescriptions(dynamic value) {
    projectDescriptions.add(value);
  }

  void removeFromProjectDescriptions(dynamic value) {
    projectDescriptions.remove(value);
  }

  void removeAtIndexFromProjectDescriptions(int index) {
    projectDescriptions.removeAt(index);
  }

  void updateProjectDescriptionsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    projectDescriptions[index] = updateFn(_projectDescriptions[index]);
  }

  void insertAtIndexInProjectDescriptions(int index, dynamic value) {
    projectDescriptions.insert(index, value);
  }
}

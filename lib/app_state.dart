import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _hourTime12 = prefs.getBool('ff_hourTime12') ?? _hourTime12;
    });
    _safeInit(() {
      _MostRecentDailyBriefing =
          prefs.getStringList('ff_MostRecentDailyBriefing')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _MostRecentDailyBriefing;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  List<DocumentReference> _importedCalendars = [];
  List<DocumentReference> get importedCalendars => _importedCalendars;
  set importedCalendars(List<DocumentReference> value) {
    _importedCalendars = value;
  }

  void addToImportedCalendars(DocumentReference value) {
    importedCalendars.add(value);
  }

  void removeFromImportedCalendars(DocumentReference value) {
    importedCalendars.remove(value);
  }

  void removeAtIndexFromImportedCalendars(int index) {
    importedCalendars.removeAt(index);
  }

  void updateImportedCalendarsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    importedCalendars[index] = updateFn(_importedCalendars[index]);
  }

  void insertAtIndexInImportedCalendars(int index, DocumentReference value) {
    importedCalendars.insert(index, value);
  }

  List<String> _importedCalanderNames = [];
  List<String> get importedCalanderNames => _importedCalanderNames;
  set importedCalanderNames(List<String> value) {
    _importedCalanderNames = value;
  }

  void addToImportedCalanderNames(String value) {
    importedCalanderNames.add(value);
  }

  void removeFromImportedCalanderNames(String value) {
    importedCalanderNames.remove(value);
  }

  void removeAtIndexFromImportedCalanderNames(int index) {
    importedCalanderNames.removeAt(index);
  }

  void updateImportedCalanderNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    importedCalanderNames[index] = updateFn(_importedCalanderNames[index]);
  }

  void insertAtIndexInImportedCalanderNames(int index, String value) {
    importedCalanderNames.insert(index, value);
  }

  bool _hourTime12 = true;
  bool get hourTime12 => _hourTime12;
  set hourTime12(bool value) {
    _hourTime12 = value;
    prefs.setBool('ff_hourTime12', value);
  }

  List<dynamic> _MostRecentDailyBriefing = [];
  List<dynamic> get MostRecentDailyBriefing => _MostRecentDailyBriefing;
  set MostRecentDailyBriefing(List<dynamic> value) {
    _MostRecentDailyBriefing = value;
    prefs.setStringList(
        'ff_MostRecentDailyBriefing', value.map((x) => jsonEncode(x)).toList());
  }

  void addToMostRecentDailyBriefing(dynamic value) {
    MostRecentDailyBriefing.add(value);
    prefs.setStringList('ff_MostRecentDailyBriefing',
        _MostRecentDailyBriefing.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMostRecentDailyBriefing(dynamic value) {
    MostRecentDailyBriefing.remove(value);
    prefs.setStringList('ff_MostRecentDailyBriefing',
        _MostRecentDailyBriefing.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMostRecentDailyBriefing(int index) {
    MostRecentDailyBriefing.removeAt(index);
    prefs.setStringList('ff_MostRecentDailyBriefing',
        _MostRecentDailyBriefing.map((x) => jsonEncode(x)).toList());
  }

  void updateMostRecentDailyBriefingAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    MostRecentDailyBriefing[index] = updateFn(_MostRecentDailyBriefing[index]);
    prefs.setStringList('ff_MostRecentDailyBriefing',
        _MostRecentDailyBriefing.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInMostRecentDailyBriefing(int index, dynamic value) {
    MostRecentDailyBriefing.insert(index, value);
    prefs.setStringList('ff_MostRecentDailyBriefing',
        _MostRecentDailyBriefing.map((x) => jsonEncode(x)).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

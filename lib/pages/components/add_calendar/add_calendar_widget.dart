import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_calendar_model.dart';
export 'add_calendar_model.dart';

class AddCalendarWidget extends StatefulWidget {
  const AddCalendarWidget({super.key});

  @override
  State<AddCalendarWidget> createState() => _AddCalendarWidgetState();
}

class _AddCalendarWidgetState extends State<AddCalendarWidget> {
  late AddCalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCalendarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_CALENDAR_addCalendar_ON_INIT_STATE');
      logFirebaseEvent('addCalendar_update_component_state');
      _model.calendarNameList = functions
          .pullFromJsonList(FFAppState().calendarJSONList.toList(), 'summary')
          .toList()
          .cast<String>();
      _model.calendarIdList = functions
          .pullFromJsonList(FFAppState().calendarJSONList.toList(), 'id')
          .toList()
          .cast<String>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Container(
                width: 350.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Link New Calendar',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Container(
                      width: 350.0,
                      height: 134.19,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (FFAppState().itemTypeList.length > 1)
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 0.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.itemTypeDropValueController ??=
                                          FormFieldController<String>(null),
                                  options: FFAppState().itemTypeList,
                                  onChanged: (val) => safeSetState(
                                      () => _model.itemTypeDropValue = val),
                                  width: 200.0,
                                  height: 40.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  hintText: 'Select item type',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ),
                          if (_model.calendarNameList.length != 0)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 7.5),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.selectionDropValueController ??=
                                        FormFieldController<String>(null),
                                options: _model.calendarNameList,
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.selectionDropValue = val);
                                  logFirebaseEvent(
                                      'ADD_CALENDAR_selectionDrop_ON_FORM_WIDGE');
                                  logFirebaseEvent(
                                      'selectionDrop_update_component_state');
                                  _model.selection = functions.decipherPosition(
                                      _model.calendarNameList.toList(),
                                      _model.selectionDropValue!);
                                  _model.nullSelected = false;
                                  safeSetState(() {});
                                },
                                width: 200.0,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                hintText: 'Select a Calendar',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          if (_model.calendarNameList.length == 0)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 31.0, 0.0, 0.0),
                              child: Text(
                                'Permissions Not Enabled',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          if (_model.nullSelected)
                            Text(
                              'No Calendar Selected',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(-0.03, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 7.5, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_CALENDAR_IMPORT_CALENDAR_BTN_ON_TAP');
                                  var _shouldSetState = false;
                                  if (_model.calendarNameList.length == 0) {
                                    logFirebaseEvent('Button_custom_action');
                                    _model.updatedGoogleToken =
                                        await actions.signInWithGoogle();
                                    _shouldSetState = true;
                                    logFirebaseEvent('Button_backend_call');

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      googleToken: _model.updatedGoogleToken,
                                    ));
                                    logFirebaseEvent(
                                        'Button_update_component_state');

                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    if (_model.selection != null) {
                                      logFirebaseEvent('Button_custom_action');
                                      _model.eventListFromFetch =
                                          await actions.getEventsFromCalendar(
                                        valueOrDefault(
                                            currentUserDocument?.googleToken,
                                            ''),
                                        _model.calendarIdList
                                            .elementAtOrNull(_model.selection!),
                                      );
                                      _shouldSetState = true;
                                      if (FFAppState()
                                          .importedCalanderNames
                                          .contains(
                                              '${_model.calendarNameList.elementAtOrNull(_model.selection!)}Doc')) {
                                        logFirebaseEvent('Button_backend_call');

                                        await FFAppState()
                                            .importedCalendars
                                            .where((e) =>
                                                e.id ==
                                                '${_model.calendarNameList.elementAtOrNull(_model.selection!)}Doc')
                                            .toList()
                                            .firstOrNull!
                                            .update({
                                          ...createCalendarRecordData(
                                            calanderName: _model
                                                .calendarNameList
                                                .elementAtOrNull(
                                                    _model.selection!),
                                            calendarJson: FFAppState()
                                                .calendarJSONList
                                                .elementAtOrNull(
                                                    _model.selection!)
                                                ?.toString(),
                                            uid: currentUserUid,
                                            calendarId: _model.calendarIdList
                                                .elementAtOrNull(
                                                    _model.selection!),
                                            numberOfEvents: _model
                                                .eventListFromFetch?.length,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'CalanderDescription':
                                                  functions.calendarJsonToData(
                                                      FFAppState()
                                                          .calendarJSONList
                                                          .toList(),
                                                      _model.selection!,
                                                      _model.eventListFromFetch!
                                                          .toList()),
                                            },
                                          ),
                                        });
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        logFirebaseEvent('Button_backend_call');

                                        var calendarRecordReference =
                                            CalendarRecord.collection.doc(
                                                '${_model.calendarNameList.elementAtOrNull(_model.selection!)}Doc');
                                        await calendarRecordReference.set({
                                          ...createCalendarRecordData(
                                            calanderName: _model
                                                .calendarNameList
                                                .elementAtOrNull(
                                                    _model.selection!),
                                            calendarJson: FFAppState()
                                                .calendarJSONList
                                                .elementAtOrNull(
                                                    _model.selection!)
                                                ?.toString(),
                                            uid: currentUserUid,
                                            calendarId: _model.calendarIdList
                                                .elementAtOrNull(
                                                    _model.selection!),
                                            numberOfEvents: _model
                                                .eventListFromFetch?.length,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'CalanderDescription':
                                                  functions.calendarJsonToData(
                                                      FFAppState()
                                                          .calendarJSONList
                                                          .toList(),
                                                      _model.selection!,
                                                      _model.eventListFromFetch!
                                                          .toList()),
                                            },
                                          ),
                                        });
                                        _model.calendarAdded =
                                            CalendarRecord.getDocumentFromData({
                                          ...createCalendarRecordData(
                                            calanderName: _model
                                                .calendarNameList
                                                .elementAtOrNull(
                                                    _model.selection!),
                                            calendarJson: FFAppState()
                                                .calendarJSONList
                                                .elementAtOrNull(
                                                    _model.selection!)
                                                ?.toString(),
                                            uid: currentUserUid,
                                            calendarId: _model.calendarIdList
                                                .elementAtOrNull(
                                                    _model.selection!),
                                            numberOfEvents: _model
                                                .eventListFromFetch?.length,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'CalanderDescription':
                                                  functions.calendarJsonToData(
                                                      FFAppState()
                                                          .calendarJSONList
                                                          .toList(),
                                                      _model.selection!,
                                                      _model.eventListFromFetch!
                                                          .toList()),
                                            },
                                          ),
                                        }, calendarRecordReference);
                                        _shouldSetState = true;
                                        // calendars in firebase, but now applying them app
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().addToImportedCalendars(
                                            _model.calendarAdded!.reference);
                                        FFAppState().addToImportedCalanderNames(
                                            '${_model.calendarNameList.elementAtOrNull(_model.selection!)}Doc');
                                        FFAppState().update(() {});
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    } else {
                                      logFirebaseEvent(
                                          'Button_update_component_state');
                                      _model.nullSelected = true;
                                      safeSetState(() {});
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'import calendar',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

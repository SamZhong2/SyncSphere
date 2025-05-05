import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/add_event/add_event_widget.dart';
import '/pages/components/edit_event/edit_event_widget.dart';
import '/pages/components/event_item/event_item_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar_list_view_model.dart';
export 'calendar_list_view_model.dart';

class CalendarListViewWidget extends StatefulWidget {
  const CalendarListViewWidget({
    super.key,
    required this.calendarDoc,
  });

  final CalendarRecord? calendarDoc;

  static String routeName = 'CalendarListView';
  static String routePath = '/calendarListView';

  @override
  State<CalendarListViewWidget> createState() => _CalendarListViewWidgetState();
}

class _CalendarListViewWidgetState extends State<CalendarListViewWidget> {
  late CalendarListViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarListViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CalendarListView'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CALENDAR_LIST_VIEW_CalendarListView_ON_I');
      logFirebaseEvent('CalendarListView_custom_action');
      _model.eventListfromPort = await actions.getEventsFromCalendar(
        valueOrDefault(currentUserDocument?.googleToken, ''),
        widget.calendarDoc?.calendarId,
      );
      logFirebaseEvent('CalendarListView_custom_action');
      _model.listViewEventList1 = await actions.eventListProcessor(
        _model.eventListfromPort?.toList(),
      );
      if ((_model.eventListfromPort?.length == 0) &&
          (widget.calendarDoc?.numberOfEvents != 0)) {
        logFirebaseEvent('CalendarListView_custom_action');
        _model.updatedGoogleToken = await actions.signInWithGoogle();
        logFirebaseEvent('CalendarListView_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          googleToken: _model.updatedGoogleToken,
        ));
        logFirebaseEvent('CalendarListView_custom_action');
        _model.eventListfromPostLog = await actions.getEventsFromCalendar(
          valueOrDefault(currentUserDocument?.googleToken, ''),
          widget.calendarDoc?.calendarId,
        );
        logFirebaseEvent('CalendarListView_custom_action');
        _model.listViewEventListPostLog = await actions.eventListProcessor(
          _model.eventListfromPostLog?.toList(),
        );
        logFirebaseEvent('CalendarListView_update_page_state');
        _model.eventList = _model.listViewEventList1!.toList().cast<dynamic>();
        safeSetState(() {});
      } else {
        logFirebaseEvent('CalendarListView_update_page_state');
        _model.eventList = _model.listViewEventList1!.toList().cast<dynamic>();
        safeSetState(() {});
      }

      logFirebaseEvent('CalendarListView_custom_action');
      _model.eventDataJsons = await actions.eventJsonsToDatas(
        _model.eventList.toList(),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    '${valueOrDefault<String>(
                      widget.calendarDoc?.calanderName,
                      'Calendar1',
                    )}',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final events = _model.eventList.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: events.length,
                        itemBuilder: (context, eventsIndex) {
                          final eventsItem = events[eventsIndex];
                          return Container(
                            height: 205.49,
                            child: Stack(
                              children: [
                                wrapWithModel(
                                  model: _model.eventItemModels.getModel(
                                    eventsIndex.toString(),
                                    eventsIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: EventItemWidget(
                                    key: Key(
                                      'Keyg03_${eventsIndex.toString()}',
                                    ),
                                    itemTitle: getJsonField(
                                      _model.eventList
                                          .elementAtOrNull(eventsIndex),
                                      r'''$.summary''',
                                    ).toString(),
                                    itemData: functions.dataJsonToStrings(_model
                                        .eventDataJsons
                                        ?.elementAtOrNull(eventsIndex))!,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.87, 0.8),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CALENDAR_LIST_VIEW_Container_cvydvwd6_ON');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: EditEventWidget(
                                                title: getJsonField(
                                                  _model.eventList
                                                      .elementAtOrNull(
                                                          eventsIndex),
                                                  r'''$.summary''',
                                                ).toString(),
                                                description: getJsonField(
                                                  _model.eventList
                                                      .elementAtOrNull(
                                                          eventsIndex),
                                                  r'''$.description''',
                                                ).toString(),
                                                startTime: functions
                                                    .stringToDate(getJsonField(
                                                  _model.eventList
                                                      .elementAtOrNull(
                                                          eventsIndex),
                                                  r'''$.start.dateTime''',
                                                ).toString()),
                                                endTime: functions
                                                    .stringToDate(getJsonField(
                                                  _model.eventList
                                                      .elementAtOrNull(
                                                          eventsIndex),
                                                  r'''$.end.dateTime''',
                                                ).toString()),
                                                event: _model.eventList
                                                    .elementAtOrNull(
                                                        eventsIndex)!,
                                                calendarId: widget
                                                    .calendarDoc!.calendarId,
                                                location: getJsonField(
                                                  _model.eventList
                                                      .elementAtOrNull(
                                                          eventsIndex),
                                                  r'''$.location''',
                                                ).toString(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.add_outlined,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'CALENDAR_LIST_VIEW_add_outlined_ICN_ON_T');
                      logFirebaseEvent('IconButton_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: AddEventWidget(
                                calendarId: widget.calendarDoc!.calendarId,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

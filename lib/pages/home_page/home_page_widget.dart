import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nps_survey_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/add_calendar/add_calendar_widget.dart';
import '/pages/components/calendar_item/calendar_item_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      logFirebaseEvent('HomePage_firestore_query');
      _model.prevDocs = await queryCalendarRecordOnce(
        queryBuilder: (calendarRecord) => calendarRecord.where(
          'UID',
          isEqualTo: currentUserUid,
        ),
      );
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().importedCalendars = [];
      FFAppState().importedCalanderNames = [];
      logFirebaseEvent('HomePage_custom_action');
      _model.calNames = await actions.calNamesToIds(
        _model.prevDocs!.map((e) => e.calanderName).toList().toList(),
      );
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().importedCalendars = _model.prevDocs!
          .map((e) => e.reference)
          .toList()
          .toList()
          .cast<DocumentReference>();
      FFAppState().importedCalanderNames =
          _model.calNames!.toList().cast<String>();
      FFAppState().update(() {});
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: colorFromCssString(
          getRemoteConfigString('Background'),
          defaultColor: FlutterFlowTheme.of(context).primaryBackground,
        ),
        endDrawer: Container(
          width: 200.0,
          child: Drawer(
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Text(
                    'Settings Menu',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  indent: 10.0,
                  endIndent: 10.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('HOME_PAGE_PAGE_Row_aopp7bld_ON_TAP');
                      logFirebaseEvent('Row_close_dialog_drawer_etc');
                      Navigator.pop(context);
                      logFirebaseEvent('Row_bottom_sheet');
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
                              child: NpsSurveyWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.5, 0.0, 7.5, 0.0),
                          child: Icon(
                            Icons.star_half_sharp,
                            color: Color(0xFFF8BD16),
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Rate the app',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('HOME_PAGE_PAGE_Row_l29nm7h9_ON_TAP');
                      logFirebaseEvent('Row_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth(
                          LoginWidget.routeName, context.mounted);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.5, 0.0, 7.5, 0.0),
                          child: Icon(
                            Icons.logout_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Log Out',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ToggleIcon(
                      onPressed: () async {
                        safeSetState(() =>
                            FFAppState().hourTime12 = !FFAppState().hourTime12);
                        logFirebaseEvent('HOME_ToggleIcon_m68kyt6l_ON_TOGGLE');
                        if (FFAppState().hourTime12 == true) {
                          logFirebaseEvent('ToggleIcon_update_page_state');
                          _model.hourFormat = 12;
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('ToggleIcon_update_page_state');
                          _model.hourFormat = 24;
                          safeSetState(() {});
                        }
                      },
                      value: FFAppState().hourTime12,
                      onIcon: Icon(
                        Icons.access_time_filled_sharp,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 24.0,
                      ),
                      offIcon: Icon(
                        Icons.access_time_sharp,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      '${_model.hourFormat.toString()} hour time format',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  ],
                ),
              ].divide(SizedBox(height: 1.0)),
            ),
          ),
        ),
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
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Text(
                    'Calendars',
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
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final itemsList =
                            FFAppState().importedCalendars.toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: itemsList.length,
                          itemBuilder: (context, itemsListIndex) {
                            final itemsListItem = itemsList[itemsListIndex];
                            return Container(
                              width: 119.0,
                              height: 206.0,
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  if (FFAppState().importedCalendars.length > 0)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: StreamBuilder<CalendarRecord>(
                                        stream: CalendarRecord.getDocument(
                                            FFAppState()
                                                .importedCalendars
                                                .elementAtOrNull(
                                                    itemsListIndex)!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final calendarItemCalendarRecord =
                                              snapshot.data!;

                                          return Container(
                                            key: ValueKey('calendarItem_si15'),
                                            child: wrapWithModel(
                                              model: _model.calendarItemModels
                                                  .getModel(
                                                itemsListIndex.toString(),
                                                itemsListIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CalendarItemWidget(
                                                key: Key(
                                                  'Keyiq2_${itemsListIndex.toString()}',
                                                ),
                                                itemTitle:
                                                    calendarItemCalendarRecord
                                                        .calanderName,
                                                itemData:
                                                    calendarItemCalendarRecord
                                                        .calanderDescription,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(1.03, 0.74),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 35.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_rightButton_ON_TAP');
                                          logFirebaseEvent(
                                              'rightButton_custom_action');
                                          _model.calendarNamefromPull =
                                              await actions.pullFromCalDocument(
                                            'CalanderName',
                                            itemsListItem,
                                          );
                                          logFirebaseEvent(
                                              'rightButton_firestore_query');
                                          _model.theCalendar =
                                              await queryCalendarRecordOnce(
                                            queryBuilder: (calendarRecord) =>
                                                calendarRecord.where(
                                              'CalanderName',
                                              isEqualTo:
                                                  _model.calendarNamefromPull,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          logFirebaseEvent(
                                              'rightButton_navigate_to');

                                          context.pushNamed(
                                            CalendarListViewWidget.routeName,
                                            queryParameters: {
                                              'calendarDoc': serializeParam(
                                                _model.theCalendar,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'calendarDoc': _model.theCalendar,
                                            },
                                          );

                                          safeSetState(() {});
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
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.03, 0.74),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          35.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_PAGE_PAGE_leftButton_ON_TAP');
                                          logFirebaseEvent(
                                              'leftButton_update_app_state');
                                          FFAppState()
                                              .removeFromImportedCalendars(
                                                  itemsListItem);
                                          FFAppState()
                                              .removeFromImportedCalanderNames(
                                                  itemsListItem.id);
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'leftButton_backend_call');
                                          await itemsListItem.delete();
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
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                      child: FlutterFlowIconButton(
                        key: ValueKey('IconButton_yxdf'),
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).secondary,
                        icon: Icon(
                          Icons.add_rounded,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'HOME_PAGE_PAGE_add_rounded_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_custom_action');
                          _model.calendarListFromFetch =
                              await actions.fetchCalendarList(
                            valueOrDefault(
                                currentUserDocument?.googleToken, ''),
                          );
                          logFirebaseEvent('IconButton_update_app_state');
                          FFAppState().calendarJSONList = _model
                              .calendarListFromFetch!
                              .toList()
                              .cast<dynamic>();
                          FFAppState().update(() {});
                          logFirebaseEvent('IconButton_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: AddCalendarWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          safeSetState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

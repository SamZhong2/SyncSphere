import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/temp_test_pages/basic_form_field/basic_form_field_widget.dart';
import '/temp_test_pages/date_time_form_field/date_time_form_field_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temp_page_linking_model.dart';
export 'temp_page_linking_model.dart';

class TempPageLinkingWidget extends StatefulWidget {
  const TempPageLinkingWidget({super.key});

  static String routeName = 'tempPageLinking';
  static String routePath = '/tempPageLinking';

  @override
  State<TempPageLinkingWidget> createState() => _TempPageLinkingWidgetState();
}

class _TempPageLinkingWidgetState extends State<TempPageLinkingWidget> {
  late TempPageLinkingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TempPageLinkingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'tempPageLinking'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Add Event to Calendar',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                wrapWithModel(
                  model: _model.basicFormFieldModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: BasicFormFieldWidget(
                    titleText: 'Title',
                    hintText: 'i.e Practice',
                  ),
                ),
                wrapWithModel(
                  model: _model.basicFormFieldModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: BasicFormFieldWidget(
                    titleText: 'Description',
                    hintText: 'i.e practicing',
                  ),
                ),
                wrapWithModel(
                  model: _model.dateTimeFormFieldModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: DateTimeFormFieldWidget(
                    titleText: 'Start Time',
                  ),
                ),
                wrapWithModel(
                  model: _model.dateTimeFormFieldModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: DateTimeFormFieldWidget(
                    titleText: 'End Time',
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'TEMP_LINKING_ADD_EVENT_TO_CALENDAR_BTN_O');
                      logFirebaseEvent('Button_custom_action');
                      _model.createdEvent = await actions.eventToJson(
                        _model.basicFormFieldModel1.textController.text,
                        _model.basicFormFieldModel2.textController.text,
                        _model.dateTimeFormFieldModel1.datePicked!,
                        _model.dateTimeFormFieldModel2.datePicked!,
                      );
                      logFirebaseEvent('Button_custom_action');
                      _model.accessToken = await actions.signInWithGoogle();
                      logFirebaseEvent('Button_custom_action');
                      await actions.addEventsToCalendar(
                        valueOrDefault(currentUserDocument?.googleToken, ''),
                        _model.createdEvent!,
                      );

                      safeSetState(() {});
                    },
                    text: 'Add Event to Calendar',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('TEMP_LINKING_SEE_CALENDAR_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        TempCalendarWidget.routeName,
                        queryParameters: {
                          'eventsList': serializeParam(
                            FFAppState().eventList,
                            ParamType.JSON,
                            isList: true,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: 'See Calendar',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
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

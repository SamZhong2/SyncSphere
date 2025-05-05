import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/temp_test_pages/basic_form_field/basic_form_field_widget.dart';
import '/temp_test_pages/date_time_form_field/date_time_form_field_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_event_model.dart';
export 'add_event_model.dart';

class AddEventWidget extends StatefulWidget {
  const AddEventWidget({
    super.key,
    String? calendarId,
  }) : this.calendarId = calendarId ?? 'primary';

  final String calendarId;

  @override
  State<AddEventWidget> createState() => _AddEventWidgetState();
}

class _AddEventWidgetState extends State<AddEventWidget> {
  late AddEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddEventModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(24.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('ADD_EVENT_COMP_close_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Text(
              'Add Event',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            wrapWithModel(
              model: _model.basicFormFieldModel1,
              updateCallback: () => safeSetState(() {}),
              child: BasicFormFieldWidget(
                titleText: 'Title',
                hintText: 'i.e Practice',
                maxLines: 1,
              ),
            ),
            wrapWithModel(
              model: _model.basicFormFieldModel2,
              updateCallback: () => safeSetState(() {}),
              child: BasicFormFieldWidget(
                titleText: 'Description',
                hintText: 'i.e practicing',
                maxLines: null,
              ),
            ),
            wrapWithModel(
              model: _model.basicFormFieldModel3,
              updateCallback: () => safeSetState(() {}),
              child: BasicFormFieldWidget(
                titleText: 'Location',
                hintText: 'i.e 1600 Pennsylvania Avenue NW',
                maxLines: 1,
              ),
            ),
            wrapWithModel(
              model: _model.dateTimeFormFieldModel1,
              updateCallback: () => safeSetState(() {}),
              child: DateTimeFormFieldWidget(
                titleText: 'Start Time',
                endTime: _model.dateTimeFormFieldModel2.currentDateTime,
              ),
            ),
            wrapWithModel(
              model: _model.dateTimeFormFieldModel2,
              updateCallback: () => safeSetState(() {}),
              child: DateTimeFormFieldWidget(
                titleText: 'End Time',
                startTime: _model.dateTimeFormFieldModel1.currentDateTime,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('ADD_EVENT_ADD_EVENT_TO_CALENDAR_BTN_ON_T');
                  logFirebaseEvent('Button_custom_action');
                  _model.createdEvent = await actions.eventToJson(
                    _model.basicFormFieldModel1.textController.text,
                    _model.basicFormFieldModel2.textController.text,
                    _model.basicFormFieldModel3.textController.text,
                    _model.dateTimeFormFieldModel1.datePicked!,
                    _model.dateTimeFormFieldModel2.datePicked!,
                  );
                  logFirebaseEvent('Button_custom_action');
                  _model.eventLog = await actions.addEventsToCalendar(
                    valueOrDefault(currentUserDocument?.googleToken, ''),
                    _model.createdEvent!,
                    widget.calendarId,
                  );

                  safeSetState(() {});
                },
                text: 'Add Event to Calendar',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

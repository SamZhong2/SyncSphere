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
import 'edit_event_model.dart';
export 'edit_event_model.dart';

class EditEventWidget extends StatefulWidget {
  const EditEventWidget({
    super.key,
    required this.title,
    required this.description,
    this.startTime,
    this.endTime,
    required this.event,
    required this.calendarId,
    this.location,
  });

  final String? title;
  final String? description;
  final DateTime? startTime;
  final DateTime? endTime;
  final dynamic event;
  final String? calendarId;
  final String? location;

  @override
  State<EditEventWidget> createState() => _EditEventWidgetState();
}

class _EditEventWidgetState extends State<EditEventWidget> {
  late EditEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditEventModel());

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
                    logFirebaseEvent('EDIT_EVENT_COMP_close_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Text(
              'Edit Event',
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
              model: _model.titleFormFieldModel,
              updateCallback: () => safeSetState(() {}),
              child: BasicFormFieldWidget(
                titleText: 'Title',
                hintText: 'i.e Practice',
                preText: widget.title,
                maxLines: 1,
              ),
            ),
            wrapWithModel(
              model: _model.descriptionFormFieldModel,
              updateCallback: () => safeSetState(() {}),
              child: BasicFormFieldWidget(
                titleText: 'Description',
                hintText: 'i.e practicing',
                preText: widget.description,
                maxLines: null,
              ),
            ),
            wrapWithModel(
              model: _model.locationFormFieldModel,
              updateCallback: () => safeSetState(() {}),
              child: BasicFormFieldWidget(
                titleText: 'Location',
                hintText: 'i.e 1600 Pennsylvania Avenue NW',
                preText: widget.location,
                maxLines: 1,
              ),
            ),
            wrapWithModel(
              model: _model.startTimeFormFieldModel,
              updateCallback: () => safeSetState(() {}),
              child: DateTimeFormFieldWidget(
                titleText: 'Start Time',
                preDateTime: widget.startTime,
                endTime: _model.endTimeFormFieldModel.datePicked,
              ),
            ),
            wrapWithModel(
              model: _model.endTimeFormFieldModel,
              updateCallback: () => safeSetState(() {}),
              child: DateTimeFormFieldWidget(
                titleText: 'End Time',
                preDateTime: widget.endTime,
                startTime: _model.startTimeFormFieldModel.datePicked,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('EDIT_EVENT_COMP_UPDATE_EVENT_BTN_ON_TAP');
                  logFirebaseEvent('Button_custom_action');
                  _model.newData = await actions.eventToJson(
                    _model.titleFormFieldModel.textController.text,
                    _model.descriptionFormFieldModel.textController.text,
                    _model.locationFormFieldModel.textController.text,
                    _model.startTimeFormFieldModel.currentDateTime!,
                    _model.endTimeFormFieldModel.currentDateTime!,
                  );
                  logFirebaseEvent('Button_custom_action');
                  _model.codeLog = await actions.updateEvent(
                    valueOrDefault(currentUserDocument?.googleToken, ''),
                    widget.calendarId,
                    widget.event!,
                    _model.newData!,
                  );

                  safeSetState(() {});
                },
                text: 'Update Event',
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

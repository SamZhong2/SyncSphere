import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/temp_test_pages/basic_form_field/basic_form_field_widget.dart';
import '/temp_test_pages/date_time_form_field/date_time_form_field_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'add_event_model.dart';
export 'add_event_model.dart';

class AddEventWidget extends StatefulWidget {
  const AddEventWidget({super.key});

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
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Add Event',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                  ),
            ),
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
                  logFirebaseEvent('ADD_EVENT_ADD_EVENT_TO_CALENDAR_BTN_ON_T');
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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}

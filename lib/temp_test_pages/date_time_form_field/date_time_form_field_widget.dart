import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'date_time_form_field_model.dart';
export 'date_time_form_field_model.dart';

class DateTimeFormFieldWidget extends StatefulWidget {
  const DateTimeFormFieldWidget({
    super.key,
    required this.titleText,
  });

  final String? titleText;

  @override
  State<DateTimeFormFieldWidget> createState() =>
      _DateTimeFormFieldWidgetState();
}

class _DateTimeFormFieldWidgetState extends State<DateTimeFormFieldWidget> {
  late DateTimeFormFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DateTimeFormFieldModel());

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
      width: 250.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Text(
              widget.titleText!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('DATE_TIME_FORM_FIELD_Container_kr121fwy_');
              logFirebaseEvent('Container_date_time_picker');
              final _datePickedDate = await showDatePicker(
                context: context,
                initialDate: getCurrentTimestamp,
                firstDate: getCurrentTimestamp,
                lastDate: DateTime(2050),
                builder: (context, child) {
                  return wrapInMaterialDatePickerTheme(
                    context,
                    child!,
                    headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                    headerForegroundColor: FlutterFlowTheme.of(context).info,
                    headerTextStyle:
                        FlutterFlowTheme.of(context).headlineLarge.override(
                              fontFamily: 'Inter Tight',
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                    pickerBackgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    pickerForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    selectedDateTimeBackgroundColor:
                        FlutterFlowTheme.of(context).primary,
                    selectedDateTimeForegroundColor:
                        FlutterFlowTheme.of(context).info,
                    actionButtonForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    iconSize: 24.0,
                  );
                },
              );

              TimeOfDay? _datePickedTime;
              if (_datePickedDate != null) {
                _datePickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                  builder: (context, child) {
                    return wrapInMaterialTimePickerTheme(
                      context,
                      child!,
                      headerBackgroundColor:
                          FlutterFlowTheme.of(context).primary,
                      headerForegroundColor: FlutterFlowTheme.of(context).info,
                      headerTextStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Inter Tight',
                                fontSize: 32.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                      pickerBackgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      pickerForegroundColor:
                          FlutterFlowTheme.of(context).primaryText,
                      selectedDateTimeBackgroundColor:
                          FlutterFlowTheme.of(context).primary,
                      selectedDateTimeForegroundColor:
                          FlutterFlowTheme.of(context).info,
                      actionButtonForegroundColor:
                          FlutterFlowTheme.of(context).primaryText,
                      iconSize: 24.0,
                    );
                  },
                );
              }

              if (_datePickedDate != null && _datePickedTime != null) {
                safeSetState(() {
                  _model.datePicked = DateTime(
                    _datePickedDate.year,
                    _datePickedDate.month,
                    _datePickedDate.day,
                    _datePickedTime!.hour,
                    _datePickedTime.minute,
                  );
                });
              } else if (_model.datePicked != null) {
                safeSetState(() {
                  _model.datePicked = getCurrentTimestamp;
                });
              }
            },
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    dateTimeFormat("EEEE, MMMM d @ h:mm a", _model.datePicked),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ].divide(SizedBox(height: 10.0)).addToStart(SizedBox(height: 10.0)),
      ),
    );
  }
}

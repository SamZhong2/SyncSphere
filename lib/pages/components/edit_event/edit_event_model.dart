import '/flutter_flow/flutter_flow_util.dart';
import '/temp_test_pages/basic_form_field/basic_form_field_widget.dart';
import '/temp_test_pages/date_time_form_field/date_time_form_field_widget.dart';
import 'edit_event_widget.dart' show EditEventWidget;
import 'package:flutter/material.dart';

class EditEventModel extends FlutterFlowModel<EditEventWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for titleFormField.
  late BasicFormFieldModel titleFormFieldModel;
  // Model for descriptionFormField.
  late BasicFormFieldModel descriptionFormFieldModel;
  // Model for LocationFormField.
  late BasicFormFieldModel locationFormFieldModel;
  // Model for startTimeFormField.
  late DateTimeFormFieldModel startTimeFormFieldModel;
  // Model for endTimeFormField.
  late DateTimeFormFieldModel endTimeFormFieldModel;
  // Stores action output result for [Custom Action - eventToJson] action in Button widget.
  dynamic newData;
  // Stores action output result for [Custom Action - updateEvent] action in Button widget.
  String? codeLog;

  @override
  void initState(BuildContext context) {
    titleFormFieldModel = createModel(context, () => BasicFormFieldModel());
    descriptionFormFieldModel =
        createModel(context, () => BasicFormFieldModel());
    locationFormFieldModel = createModel(context, () => BasicFormFieldModel());
    startTimeFormFieldModel =
        createModel(context, () => DateTimeFormFieldModel());
    endTimeFormFieldModel =
        createModel(context, () => DateTimeFormFieldModel());
  }

  @override
  void dispose() {
    titleFormFieldModel.dispose();
    descriptionFormFieldModel.dispose();
    locationFormFieldModel.dispose();
    startTimeFormFieldModel.dispose();
    endTimeFormFieldModel.dispose();
  }
}

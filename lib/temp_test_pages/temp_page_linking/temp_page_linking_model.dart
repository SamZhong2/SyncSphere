import '/flutter_flow/flutter_flow_util.dart';
import '/temp_test_pages/basic_form_field/basic_form_field_widget.dart';
import '/temp_test_pages/date_time_form_field/date_time_form_field_widget.dart';
import '/index.dart';
import 'temp_page_linking_widget.dart' show TempPageLinkingWidget;
import 'package:flutter/material.dart';

class TempPageLinkingModel extends FlutterFlowModel<TempPageLinkingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for basicFormField component.
  late BasicFormFieldModel basicFormFieldModel1;
  // Model for basicFormField component.
  late BasicFormFieldModel basicFormFieldModel2;
  // Model for dateTimeFormField component.
  late DateTimeFormFieldModel dateTimeFormFieldModel1;
  // Model for dateTimeFormField component.
  late DateTimeFormFieldModel dateTimeFormFieldModel2;
  // Stores action output result for [Custom Action - eventToJson] action in Button widget.
  dynamic createdEvent;
  // Stores action output result for [Custom Action - signInWithGoogle] action in Button widget.
  String? accessToken;

  @override
  void initState(BuildContext context) {
    basicFormFieldModel1 = createModel(context, () => BasicFormFieldModel());
    basicFormFieldModel2 = createModel(context, () => BasicFormFieldModel());
    dateTimeFormFieldModel1 =
        createModel(context, () => DateTimeFormFieldModel());
    dateTimeFormFieldModel2 =
        createModel(context, () => DateTimeFormFieldModel());
  }

  @override
  void dispose() {
    basicFormFieldModel1.dispose();
    basicFormFieldModel2.dispose();
    dateTimeFormFieldModel1.dispose();
    dateTimeFormFieldModel2.dispose();
  }
}

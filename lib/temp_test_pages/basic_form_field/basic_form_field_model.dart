import '/flutter_flow/flutter_flow_util.dart';
import 'basic_form_field_widget.dart' show BasicFormFieldWidget;
import 'package:flutter/material.dart';

class BasicFormFieldModel extends FlutterFlowModel<BasicFormFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

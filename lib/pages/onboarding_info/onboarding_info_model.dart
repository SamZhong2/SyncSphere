import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_info_widget.dart' show OnboardingInfoWidget;
import 'package:flutter/material.dart';

class OnboardingInfoModel extends FlutterFlowModel<OnboardingInfoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  DateTime? datePicked;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();
  }
}

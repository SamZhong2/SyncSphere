import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'setting_side_bar_model.dart';
export 'setting_side_bar_model.dart';

class SettingSideBarWidget extends StatefulWidget {
  const SettingSideBarWidget({super.key});

  @override
  State<SettingSideBarWidget> createState() => _SettingSideBarWidgetState();
}

class _SettingSideBarWidgetState extends State<SettingSideBarWidget> {
  late SettingSideBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingSideBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        child: Container(
          width: 200.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}

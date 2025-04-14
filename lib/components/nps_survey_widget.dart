import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'nps_survey_model.dart';
export 'nps_survey_model.dart';

class NpsSurveyWidget extends StatefulWidget {
  const NpsSurveyWidget({super.key});

  @override
  State<NpsSurveyWidget> createState() => _NpsSurveyWidgetState();
}

class _NpsSurveyWidgetState extends State<NpsSurveyWidget> {
  late NpsSurveyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NpsSurveyModel());

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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 150.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                child: Text(
                  'How likely are you to recommend this app to a friend?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: RatingBar.builder(
                  onRatingUpdate: (newValue) {
                    safeSetState(() => _model.ratingBarValue = newValue);
                    logFirebaseEvent('NPS_SURVEY_RatingBar_k11ag5nv_ON_TAP');
                    logFirebaseEvent('RatingBar_bottom_sheet');
                    Navigator.pop(context);
                    logFirebaseEvent('RatingBar_google_analytics_event');
                    logFirebaseEvent(
                      'nps_survey',
                      parameters: {
                        'Score': _model.ratingBarValue.toString(),
                      },
                    );
                  },
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: FlutterFlowTheme.of(context).warning,
                  ),
                  direction: Axis.horizontal,
                  unratedColor: FlutterFlowTheme.of(context).secondaryText,
                  itemCount: 10,
                  itemSize: 24.0,
                  glowColor: FlutterFlowTheme.of(context).warning,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 42.0, 0.0, 0.0),
                child: Text(
                  'Not likely',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 8.0, 0.0),
                child: Text(
                  'Very likely',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

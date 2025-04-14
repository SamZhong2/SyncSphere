import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'onboarding_emails_model.dart';
export 'onboarding_emails_model.dart';

/// user adds their emails to their accounts
class OnboardingEmailsWidget extends StatefulWidget {
  const OnboardingEmailsWidget({super.key});

  static String routeName = 'Onboarding_Emails';
  static String routePath = '/onboardingEmails';

  @override
  State<OnboardingEmailsWidget> createState() => _OnboardingEmailsWidgetState();
}

class _OnboardingEmailsWidgetState extends State<OnboardingEmailsWidget> {
  late OnboardingEmailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingEmailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding_Emails'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF4ECE4),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 65.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/logoPro.png',
                              width: 96.56,
                              height: 101.4,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'SyncSphere',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 65.0),
                    child: Text(
                      'What services would you like to sync?',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 30.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ToggleIcon(
                          onPressed: () async {
                            safeSetState(() => FFAppState().isGoogleSelected =
                                !FFAppState().isGoogleSelected);
                          },
                          value: FFAppState().isGoogleSelected,
                          onIcon: Icon(
                            Icons.check_box,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                          offIcon: Icon(
                            Icons.check_box_outline_blank,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Google',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'ONBOARDING_EMAILS_CONFIRM_BTN_ON_TAP');
                        logFirebaseEvent('Button_google_analytics_event');
                        logFirebaseEvent('adoption_button');
                        if (FFAppState().isGoogleSelected) {
                          logFirebaseEvent('Button_custom_action');
                          _model.updatedGoogleToken =
                              await actions.signInWithGoogle();
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            googleToken: _model.updatedGoogleToken,
                          ));
                        }
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(HomePageWidget.routeName);

                        safeSetState(() {});
                      },
                      text: 'Confirm',
                      options: FFButtonOptions(
                        width: 230.0,
                        height: 52.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFDBA6A6),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF101213),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        hoverColor: Color(0xFFF1F4F8),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.circle_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      Icon(
                        Icons.circle_rounded,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

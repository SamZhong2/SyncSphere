import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/edit_chat_log/edit_chat_log_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ai_page_model.dart';
export 'ai_page_model.dart';

class AiPageWidget extends StatefulWidget {
  const AiPageWidget({super.key});

  static String routeName = 'AiPage';
  static String routePath = '/aiPage';

  @override
  State<AiPageWidget> createState() => _AiPageWidgetState();
}

class _AiPageWidgetState extends State<AiPageWidget>
    with TickerProviderStateMixin {
  late AiPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AiPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AiPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AI_PAGE_PAGE_AiPage_ON_INIT_STATE');
      logFirebaseEvent('AiPage_update_page_state');
      _model.promptModifier = functions.promptModifier('none');
      _model.promptList = [];
      _model.eventJsonsList =
          FFAppState().MostRecentDailyBriefing.toList().cast<dynamic>();
      logFirebaseEvent('AiPage_update_page_state');
      _model.convoModeColor = Color(4292585126);
      _model.srchModeColor = Color(4292585126);
      _model.planModeColor = Color(4292585126);
      _model.noModeColor = Color(4291657342);
      _model.addToPromptList(_model.promptModifier!);
      _model.chatOutputText = 'New mode selected, chat cleared.';
      _model.chatCounter = 0;
      safeSetState(() {});
      logFirebaseEvent('AiPage_update_page_state');
      _model.addToPromptList(
          '${functions.stringListToString(_model.eventJsonsList.map((e) => e.toString()).toList().toList())}${_model.chatLogBelow}');
      safeSetState(() {});
      logFirebaseEvent('AiPage_reset_form_fields');
      safeSetState(() {
        _model.dropDownValueController?.reset();
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.promptFieldTextController ??= TextEditingController();
    _model.promptFieldFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: '0');
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      logFirebaseEvent('AI_PAGE_PAGE_AiPage_ON_DISPOSE');
      logFirebaseEvent('AiPage_update_page_state');
      _model.promptModifier = functions.promptModifier('none');
      _model.promptList = [];
      logFirebaseEvent('AiPage_update_page_state');
      _model.convoModeColor = Color(4292585126);
      _model.srchModeColor = Color(4292585126);
      _model.planModeColor = Color(4292585126);
      _model.noModeColor = Color(4291657342);
      _model.addToPromptList(_model.promptModifier!);
      _model.chatCounter = 0;
      safeSetState(() {});
      logFirebaseEvent('AiPage_reset_form_fields');
      safeSetState(() {
        _model.dropDownValueController?.reset();
      });
    }();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      height: 126.6,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(0.0),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.auto_graph,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 28.0,
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1.0, 0.0, 3.0, 0.0),
                                  child: Text(
                                    'Cal',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.auto_graph,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 28.0,
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Your New Calendar AI',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            indent: 12.0,
                            endIndent: 12.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 55.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController ??=
                                FormFieldController<String>(
                              _model.dropDownValue ??= 'new',
                            ),
                            options: List<String>.from(
                                (currentUserDocument?.savedChatLogs.toList() ??
                                        [])
                                    .map((e) => e.conversationLog)
                                    .toList()),
                            optionLabels:
                                (currentUserDocument?.savedChatLogs.toList() ??
                                        [])
                                    .map((e) => e.title)
                                    .toList(),
                            onChanged: (val) async {
                              safeSetState(() => _model.dropDownValue = val);
                              logFirebaseEvent(
                                  'AI_DropDown_atg1ikgx_ON_FORM_WIDGET_SELE');
                              logFirebaseEvent('DropDown_update_page_state');
                              _model.promptModifier = '';
                              _model.promptList = [];
                              logFirebaseEvent('DropDown_update_page_state');
                              _model.convoModeColor = Color(4292585126);
                              _model.srchModeColor = Color(4292585126);
                              _model.planModeColor = Color(4292585126);
                              _model.noModeColor =
                                  FlutterFlowTheme.of(context).primary;
                              _model.addToPromptList(_model.dropDownValue!);
                              _model.chatOutputText =
                                  'Saved chat selected, chat cleared.';
                              _model.chatCounter = 0;
                              _model.logSelected = true;
                              safeSetState(() {});
                              logFirebaseEvent('DropDown_update_page_state');
                              _model.addToPromptList(
                                  '${_model.userResumedSession}${functions.stringListToString(_model.eventJsonsList.map((e) => e.toString()).toList())}${_model.chatLogBelow}');
                              safeSetState(() {});
                            },
                            width: 200.0,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            hintText: 'Saved Chats',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: Color(0xFF37BD8F),
                          icon: Icon(
                            Icons.edit_note_rounded,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent('AI_edit_note_rounded_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: EditChatLogWidget(
                                      fullLogList: (currentUserDocument
                                              ?.savedChatLogs
                                              .toList() ??
                                          []),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              tabs: [
                                Tab(
                                  text: 'Chat with Cal',
                                ),
                                Tab(
                                  text: 'Daily Briefing',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [
                                  () async {},
                                  () async {
                                    logFirebaseEvent(
                                        'AI_PAGE_PAGE_dailyReportTab_ON_TAP');
                                    logFirebaseEvent(
                                        'dailyReportTab_action_block');
                                    await _model.makeDailyReport(
                                      context,
                                      offset: 0,
                                    );
                                    safeSetState(() {});
                                  }
                                ][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 20.0, 28.0, 24.0),
                                        child: TextFormField(
                                          controller:
                                              _model.promptFieldTextController,
                                          focusNode:
                                              _model.promptFieldFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            hintText: 'Ask me something...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor: Color(0x93DBA6A6),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF14181A),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          maxLines: null,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .promptFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 18.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor: _model.noModeColor,
                                                icon: Icon(
                                                  Icons.clear_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'AI_PAGE_PAGE_noMode_ON_TAP');
                                                  logFirebaseEvent(
                                                      'noMode_update_page_state');
                                                  _model.promptModifier =
                                                      functions.promptModifier(
                                                          'none');
                                                  _model.promptList = [];
                                                  logFirebaseEvent(
                                                      'noMode_update_page_state');
                                                  _model.convoModeColor =
                                                      Color(4292585126);
                                                  _model.srchModeColor =
                                                      Color(4292585126);
                                                  _model.planModeColor =
                                                      Color(4292585126);
                                                  _model.noModeColor =
                                                      Color(4291657342);
                                                  _model.addToPromptList(
                                                      _model.promptModifier!);
                                                  _model.chatOutputText =
                                                      'New mode selected, chat cleared.';
                                                  _model.chatCounter = 0;
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'noMode_update_page_state');
                                                  _model.addToPromptList(
                                                      '${functions.stringListToString(_model.eventJsonsList.map((e) => e.toString()).toList())}${_model.chatLogBelow}');
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'noMode_reset_form_fields');
                                                  safeSetState(() {
                                                    _model
                                                        .dropDownValueController
                                                        ?.reset();
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor: _model.planModeColor,
                                                icon: FaIcon(
                                                  FontAwesomeIcons
                                                      .clipboardList,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'AI_PAGE_PAGE_planMode_ON_TAP');
                                                  logFirebaseEvent(
                                                      'planMode_update_page_state');
                                                  _model.promptModifier =
                                                      functions.promptModifier(
                                                          'plan');
                                                  _model.promptList = [];
                                                  logFirebaseEvent(
                                                      'planMode_update_page_state');
                                                  _model.convoModeColor =
                                                      Color(4292585126);
                                                  _model.srchModeColor =
                                                      Color(4292585126);
                                                  _model.planModeColor =
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary;
                                                  _model.addToPromptList(
                                                      _model.promptModifier!);
                                                  _model.noModeColor =
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary;
                                                  _model.chatOutputText =
                                                      'Plan mode selected, chat cleared.';
                                                  _model.chatCounter = 0;
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'planMode_update_page_state');
                                                  _model.addToPromptList(
                                                      '${functions.stringListToString(_model.eventJsonsList.map((e) => e.toString()).toList())}${_model.chatLogBelow}');
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'planMode_reset_form_fields');
                                                  safeSetState(() {
                                                    _model
                                                        .dropDownValueController
                                                        ?.reset();
                                                  });
                                                },
                                              ),
                                            ),
                                            if (false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      _model.srchModeColor,
                                                  icon: Icon(
                                                    Icons
                                                        .question_mark_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'AI_PAGE_PAGE_searchMode_ON_TAP');
                                                    logFirebaseEvent(
                                                        'searchMode_update_page_state');
                                                    _model.promptModifier =
                                                        functions
                                                            .promptModifier(
                                                                'search');
                                                    _model.promptList = [];
                                                    logFirebaseEvent(
                                                        'searchMode_update_page_state');
                                                    _model.convoModeColor =
                                                        Color(4292585126);
                                                    _model.srchModeColor =
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary;
                                                    _model.planModeColor =
                                                        Color(4292585126);
                                                    _model.addToPromptList(
                                                        _model.promptModifier!);
                                                    _model.noModeColor =
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary;
                                                    _model.chatOutputText =
                                                        'Search mode selected, chat cleared.';
                                                    _model.chatCounter = 0;
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'searchMode_custom_action');
                                                    _model.events = await actions
                                                        .rangedGetEventsFromCalendars(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.googleToken,
                                                          ''),
                                                      null,
                                                    );
                                                    logFirebaseEvent(
                                                        'searchMode_update_page_state');
                                                    _model.addToPromptList(functions
                                                        .stringListToString(
                                                            _model.events!
                                                                .map((e) => e
                                                                    .toString())
                                                                .toList()));
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'searchMode_reset_form_fields');
                                                    safeSetState(() {
                                                      _model
                                                          .dropDownValueController
                                                          ?.reset();
                                                    });

                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    _model.convoModeColor,
                                                icon: Icon(
                                                  Icons.emoji_people,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'AI_PAGE_PAGE_convoMode_ON_TAP');
                                                  logFirebaseEvent(
                                                      'convoMode_update_page_state');
                                                  _model.promptModifier =
                                                      functions.promptModifier(
                                                          'convo');
                                                  _model.promptList = [];
                                                  logFirebaseEvent(
                                                      'convoMode_update_page_state');
                                                  _model.convoModeColor =
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary;
                                                  _model.srchModeColor =
                                                      Color(4292585126);
                                                  _model.planModeColor =
                                                      Color(4292585126);
                                                  _model.addToPromptList(
                                                      _model.promptModifier!);
                                                  _model.noModeColor =
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary;
                                                  _model.chatOutputText =
                                                      'Conversation mode selected, chat cleared.';
                                                  _model.chatCounter = 0;
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'convoMode_update_page_state');
                                                  _model.addToPromptList(
                                                      '${functions.stringListToString(_model.eventJsonsList.map((e) => e.toString()).toList())}${_model.chatLogBelow}');
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'convoMode_reset_form_fields');
                                                  safeSetState(() {
                                                    _model
                                                        .dropDownValueController
                                                        ?.reset();
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 32.0),
                                        child: FFButtonWidget(
                                          key: ValueKey('Button_nqdt'),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'AI_PAGE_PAGE_SEND_TO_CAL_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.addToPromptList(
                                                'user prompt:     ${_model.promptFieldTextController.text}');
                                            _model.currPrompt =
                                                functions.stringListToString(
                                                    _model.promptList.toList());
                                            _model.chatCounter =
                                                _model.chatCounter + 1;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            _model.aiApiResult =
                                                await AICallCall.call(
                                              message: _model.currPrompt,
                                            );

                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.promptModifier = '';
                                            if ((_model
                                                    .aiApiResult?.succeeded ??
                                                true)) {
                                              logFirebaseEvent(
                                                  'Button_clear_text_fields_pin_codes');
                                              safeSetState(() {
                                                _model.promptFieldTextController
                                                    ?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.chatOutputText =
                                                  AICallCall.aiResponse(
                                                (_model.aiApiResult?.jsonBody ??
                                                    ''),
                                              )!;
                                              _model.addToPromptList(
                                                  'your response:     ${AICallCall.aiResponse(
                                                (_model.aiApiResult?.jsonBody ??
                                                    ''),
                                              )}');
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    AICallCall.aiResponse(
                                                      (_model.aiApiResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Send to Cal',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.interTight(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 35.0),
                                        child: MarkdownBody(
                                          data: _model.chatOutputText,
                                          selectable: false,
                                          onTapLink: (_, url, __) =>
                                              launchURL(url!),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 65.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'AI_PAGE_PAGE_SAVE_CHAT_LOG_BTN_ON_TAP');
                                            if (_model.chatCounter > 0) {
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              _model.aiTitle =
                                                  await AICallCall.call(
                                                message:
                                                    'offer me a succint and comprehensive title for the below chat log:     ${_model.currPrompt}, your response:     ${_model.chatOutputText}',
                                              );

                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'savedChatLogs':
                                                        FieldValue.arrayUnion([
                                                      getChatLogsFirestoreData(
                                                        createChatLogsStruct(
                                                          title: AICallCall
                                                              .aiResponse(
                                                            (_model.aiTitle
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          conversationLog:
                                                              '${_model.currPrompt}, your response:     ${_model.chatOutputText}${_model.userEndedSession}',
                                                          clearUnsetFields:
                                                              true,
                                                        ),
                                                        true,
                                                      )
                                                    ]),
                                                  },
                                                ),
                                              });
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Save Chat Log',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: valueOrDefault<Color>(
                                              _model.chatCounter > 0
                                                  ? Color(0xFF37BD8F)
                                                  : Color(0x6884BDA5),
                                              Color(0xFF37BD8F),
                                            ),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.interTight(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 20.0, 12.0, 35.0),
                                        child: MarkdownBody(
                                          data: valueOrDefault<String>(
                                            _model.dailyReportResponse,
                                            'Calculating daily report...',
                                          ),
                                          selectable: false,
                                          onTapLink: (_, url, __) =>
                                              launchURL(url!),
                                        ),
                                      ),
                                      if (_model.dailyReportResponse !=
                                          'Calculating your daily report...')
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 45.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController2,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController2',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    logFirebaseEvent(
                                                        'AI_TextField_q2ei1zje_ON_TEXTFIELD_CHANG');
                                                    logFirebaseEvent(
                                                        'TextField_action_block');
                                                    await _model
                                                        .makeDailyReport(
                                                      context,
                                                      offset: int.tryParse(
                                                          _model.textController2
                                                              .text),
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                  hintText: '0',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                textAlign: TextAlign.center,
                                                keyboardType:
                                                    TextInputType.number,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (_model.dailyReportResponse !=
                                          'Calculating your daily report...')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 75.0),
                                          child: Text(
                                            'increase range of briefing',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

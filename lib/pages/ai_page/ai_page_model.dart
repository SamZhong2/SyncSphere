import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'ai_page_widget.dart' show AiPageWidget;
import 'package:flutter/material.dart';

class AiPageModel extends FlutterFlowModel<AiPageWidget> {
  ///  Local state fields for this page.

  String chatOutputText = 'Awaiting response...';

  String? promptModifier = '';

  List<String> promptList = [];
  void addToPromptList(String item) => promptList.add(item);
  void removeFromPromptList(String item) => promptList.remove(item);
  void removeAtIndexFromPromptList(int index) => promptList.removeAt(index);
  void insertAtIndexInPromptList(int index, String item) =>
      promptList.insert(index, item);
  void updatePromptListAtIndex(int index, Function(String) updateFn) =>
      promptList[index] = updateFn(promptList[index]);

  String? currPrompt = '';

  String dailyReportResponse = 'Calculating your daily report...';

  List<dynamic> eventJsonsList = [];
  void addToEventJsonsList(dynamic item) => eventJsonsList.add(item);
  void removeFromEventJsonsList(dynamic item) => eventJsonsList.remove(item);
  void removeAtIndexFromEventJsonsList(int index) =>
      eventJsonsList.removeAt(index);
  void insertAtIndexInEventJsonsList(int index, dynamic item) =>
      eventJsonsList.insert(index, item);
  void updateEventJsonsListAtIndex(int index, Function(dynamic) updateFn) =>
      eventJsonsList[index] = updateFn(eventJsonsList[index]);

  String dailyReportMod =
      'given the following list of events, offer a comprehensive briefing with suggestions of how i should spend my day.\n\nIf the list of events spans more than one day, offer a comprehensive briefing with suggestions of how i should spend each day.\n\nif the list is empty or if you cant find a list that means there are no upcoming events. In that case offer an uplifting message because there is no work to be done today.';

  Color planModeColor = Color(4292585126);

  Color srchModeColor = Color(4292585126);

  Color convoModeColor = Color(4292585126);

  Color? noModeColor = Color(4291657342);

  int chatCounter = 0;

  bool logSelected = false;

  String chatLogBelow =
      '\n  \n  BELOW IS THE THINGS CONVERSATION LOG YOU HAVE HAD WITH THE USER, interpret and follow previous instructions but when speaking to the user, only reference information found in the log.\n  understand that when interpreting the log, user prompts are marked \'user prompt\' and the AI responses are marked \'your response\'. You should take the entire log into consideration nwhen formulating a response but only respond to the \'user prompt\' at the end of the list, this prompt has not yet been answered.\n\n  When responding to the user, respond directly, do not begin your responses with \'your response\' that is simply a backend tool.\n\n  Ensure when speaking interacting with the user your goal is to fulfiil their request, if the user asks you to produce something, produce it, do not get cuaght up in specifics and double checking you understand the request. If the user informs you that you have misinterprated a prompt, only then should you take more careful considetration that you are interpreting the prompts correctly.\n\n  CONVESTATION LOG:\n  \n  ';

  String userEndedSession = '\n\nUSER ENDED SESSION.';

  String userResumedSession =
      '\n\nUSER RESUMED SESSION:\n\n\nBELOW is an updated UPCOMING EVENTS section, reference the section if it has any new relevant information.\n\nRELOADED UPCOMING EVENTS:\n';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for promptField widget.
  FocusNode? promptFieldFocusNode;
  TextEditingController? promptFieldTextController;
  String? Function(BuildContext, String?)? promptFieldTextControllerValidator;
  // Stores action output result for [Custom Action - rangedGetEventsFromCalendars] action in searchMode widget.
  List<dynamic>? events;
  // Stores action output result for [Backend Call - API (AI Call)] action in Button widget.
  ApiCallResponse? aiApiResult;
  // Stores action output result for [Backend Call - API (AI Call)] action in Button widget.
  ApiCallResponse? aiTitle;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    promptFieldFocusNode?.dispose();
    promptFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }

  /// Action blocks.
  Future makeDailyReport(
    BuildContext context, {
    required int? offset,
  }) async {
    List<dynamic>? eventsToday;
    ApiCallResponse? dailyReport;

    logFirebaseEvent('makeDailyReport_update_page_state');
    eventJsonsList = [];
    logFirebaseEvent('makeDailyReport_custom_action');
    eventsToday = await actions.rangedGetEventsFromCalendars(
      valueOrDefault(currentUserDocument?.googleToken, ''),
      offset!,
    );
    logFirebaseEvent('makeDailyReport_update_page_state');
    eventJsonsList = eventsToday.toList().cast<dynamic>();
    logFirebaseEvent('makeDailyReport_update_app_state');
    FFAppState().MostRecentDailyBriefing =
        eventJsonsList.toList().cast<dynamic>();
    logFirebaseEvent('makeDailyReport_backend_call');
    dailyReport = await AICallCall.call(
      message:
          '${dailyReportMod}${functions.stringListToString(eventJsonsList.map((e) => e.toString()).toList().toList())}',
    );

    if ((aiApiResult?.succeeded ?? true)) {
      logFirebaseEvent('makeDailyReport_update_page_state');
      dailyReportResponse = AICallCall.aiResponse(
        (dailyReport.jsonBody ?? ''),
      )!;
    } else {
      logFirebaseEvent('makeDailyReport_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            (dailyReport.jsonBody ?? '').toString(),
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    }
  }
}

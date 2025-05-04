import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sync_sphere1/flutter_flow/flutter_flow_drop_down.dart';
import 'package:sync_sphere1/flutter_flow/flutter_flow_icon_button.dart';
import 'package:sync_sphere1/flutter_flow/flutter_flow_widgets.dart';
import 'package:sync_sphere1/flutter_flow/flutter_flow_theme.dart';
import 'package:sync_sphere1/index.dart';
import 'package:sync_sphere1/main.dart';
import 'package:sync_sphere1/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:sync_sphere1/backend/firebase/firebase_config.dart';
import 'package:sync_sphere1/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('final', () {
    testWidgets('Login', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('Tab_yws6')));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.byKey(const ValueKey('Tab_yws6')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 200),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 1000),
      );
      await tester.enterText(
          find.byKey(const ValueKey('emailAddress_Login_dk5y')),
          'testfinal@gmail.com');
      await tester.enterText(
          find.byKey(const ValueKey('password_Login_v282')), 'testfinal');
      await tester.tap(find.byKey(const ValueKey('Button_s149')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 200),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 1000),
      );
      expect(find.byKey(const ValueKey('calendarItem_si15')), findsWidgets);
    });

    testWidgets('Failed login', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('Tab_yws6')));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.byKey(const ValueKey('Tab_yws6')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 200),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 1000),
      );
      await tester.enterText(
          find.byKey(const ValueKey('emailAddress_Login_dk5y')), 'notTest');
      await tester.enterText(
          find.byKey(const ValueKey('password_Login_v282')), 'noPass');
      await tester.tap(find.byKey(const ValueKey('Button_s149')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 200),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 1000),
      );
      expect(find.byKey(const ValueKey('Image_r9xi')), findsOneWidget);
    });

    testWidgets('Navigate to cal AI', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'testfinal@gmail.com', password: 'testfinal');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: HomePageWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.text('Cal AI'));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 200),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 1000),
      );
      expect(find.byKey(const ValueKey('Button_nqdt')), findsOneWidget);
    });

    testWidgets('Signup', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('Login_nlxi')));
      await tester.pump(kDoubleTapMinTime);
      await tester.tap(find.byKey(const ValueKey('Login_nlxi')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 200),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 1000),
      );
      await tester.enterText(
          find.byKey(const ValueKey('Signup-email_in9u')), 'mrow');
      await tester.enterText(
          find.byKey(const ValueKey('password_Create_yy0q')), 'miau');
      await tester.enterText(
          find.byKey(const ValueKey('password_CreateConfirm_rxko')), 'blep');
      await tester.tap(find.byKey(const ValueKey('Button_ybnp')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 200),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 1000),
      );
      expect(find.byKey(const ValueKey('Image_r9xi')), findsOneWidget);
    });
  });

  testWidgets('US4 Golden Path- succesful import', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: HomePageWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('IconButton_yxdf')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2500));
    await tester.tap(find.byType(selectionDrop));
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    await tester.tap(find.text('classes'));
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    await tester.tap(find.text('import'));
  });

  testWidgets('Login Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_Login_dk5y')),
        'samzhong@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_Login_v282')), 'password');
    await tester.tap(find.byKey(const ValueKey('Button_s149')));
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    expect(find.text('Log Out'), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}

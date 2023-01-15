// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator_dummy/main.dart';

void main() {
  testWidgets('Home page is created', (WidgetTester tester) async {
    final testWidget = ProviderScope(child: MaterialApp(home: HomePage()));
    await tester.pumpWidget(testWidget);
  });

  testWidgets('All buttons added', (WidgetTester tester) async {
    final testWidget = ProviderScope(child: MaterialApp(home: HomePage()));
    await tester.pumpWidget(testWidget);

    expect(find.text('AC'), findsOneWidget);
    // Add for the cut icon
    expect(find.byKey(const Key('removeButton')), findsOneWidget);
    expect(find.text('%'), findsOneWidget);
    expect(find.text('÷'), findsOneWidget);
    expect(find.text('×'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('='), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    // 2 zeros are shown: in result and on the keyboard
    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('.'), findsOneWidget);
  });

  // Only numbers 0-9 are tested.
  // Test: On the initial state of the app a numeric key is pressed. This is
  //  tested with multiple numeric keys on the initial state of the app.
  // Whether the test button is AC or C is also tested
  testWidgets('Show numbers in calculation area', (WidgetTester tester) async {
    // RootRestorationScope added because widget needs to be restored to
    //  initial state
    final testWidget = RootRestorationScope(
      restorationId: 'testing',
      child: ProviderScope(
        child: MaterialApp(home: HomePage()),
      ),
    );
    await tester.pumpWidget(testWidget);

    await tester.tap(find.byKey(Key('1_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('1'), findsNWidgets(2));
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    await tester.tap(find.byKey(Key('2_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('2'), findsNWidgets(2));
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('3'), findsNWidgets(2));
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    await tester.tap(find.byKey(Key('4_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('4'), findsNWidgets(2));
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    await tester.tap(find.byKey(Key('5_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('5'), findsNWidgets(2));
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    await tester.tap(find.byKey(Key('6_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('6'), findsNWidgets(2));
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    await tester.tap(find.byKey(Key('7_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('7'), findsNWidgets(2));
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    await tester.tap(find.byKey(Key('8_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('8'), findsNWidgets(2));
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    await tester.tap(find.byKey(Key('9_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('9'), findsNWidgets(2));
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // '0' initially
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    // Check if displayed on keypad and in calculation area
    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('AC'), findsNWidgets(1));
    await tester.restartAndRestore();
  });

  testWidgets('Add multiple numbers in 1 go', (WidgetTester tester) async {
    final testWidget = RootRestorationScope(
      restorationId: 'testing',
      child: ProviderScope(
        child: MaterialApp(home: HomePage()),
      ),
    );
    await tester.pumpWidget(testWidget);

    // '23'
    await tester.tap(find.byKey(Key('2_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    expect(find.text('23'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // '23791'
    await tester.tap(find.byKey(Key('2_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('7_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('9_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('1_button')));
    await tester.pumpAndSettle();
    expect(find.text('23791'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();
  });

  testWidgets('Allow decimal numbers', (WidgetTester tester) async {
    final testWidget = RootRestorationScope(
      restorationId: 'testing',
      child: ProviderScope(
        child: MaterialApp(home: HomePage()),
      ),
    );
    await tester.pumpWidget(testWidget);

    // 0.
    // Find out if AC set to 0 on just decimal
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    expect(find.text('0.'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // '23.1'
    await tester.tap(find.byKey(Key('2_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('1_button')));
    await tester.pumpAndSettle();
    expect(find.text('23.1'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // '237.91'
    await tester.tap(find.byKey(Key('2_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('7_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('9_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('1_button')));
    await tester.pumpAndSettle();
    expect(find.text('237.91'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // '0.9378'
    // With clicking on 0
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('9_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('7_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('8_button')));
    await tester.pumpAndSettle();
    expect(find.text('0.9378'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();
    // Without clicking on 0
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('9_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('7_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('8_button')));
    await tester.pumpAndSettle();
    expect(find.text('0.9378'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // Multiple dots case but only 1 should be shown
    // '23.1'
    await tester.tap(find.byKey(Key('2_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('1_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    expect(find.text('23.10'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // Multiple dots case Without clicking on 0
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('9_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('7_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('8_button')));
    await tester.pumpAndSettle();
    expect(find.text('0.9078'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // '23.0001' - 0s are a special case
    await tester.tap(find.byKey(Key('2_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('1_button')));
    await tester.pumpAndSettle();
    expect(find.text('23.0001'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // '0.0001' - both by tapping 0 first and by not tapping 0 first
    // By NOT tapping 0 first
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('1_button')));
    await tester.pumpAndSettle();
    expect(find.text('0.0001'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();
    // By tapping 0 first
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('0_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('1_button')));
    await tester.pumpAndSettle();
    expect(find.text('0.0001'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();

    // Type a decimal, erase it and type a decimal again
    // Add some additional previous tests in between
    await tester.tap(find.byKey(Key('9_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('3_button')));
    await tester.pumpAndSettle();
    expect(find.text('C'), findsNWidgets(1));
    await tester.tap(find.byKey(Key('acButton')));
    await tester.pumpAndSettle();
    expect(find.text('AC'), findsNWidgets(1));
    await tester.tap(find.byKey(Key('8_button')));
    await tester.pumpAndSettle();
    expect(find.text('C'), findsNWidgets(1));
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('2_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dotButton')));
    await tester.pumpAndSettle();
    expect(find.text('8.2'), findsOneWidget);
    expect(find.text('C'), findsNWidgets(1));
    await tester.restartAndRestore();
  });

  // % symbol will not be tested
  testWidgets(
    'Add numbers & symbols and verfy calculation area',
    (WidgetTester tester) async {
      final testWidget = ProviderScope(child: MaterialApp(home: HomePage()));
      await tester.pumpWidget(testWidget);

      // '1+1'
      // await tester.tap(find.byKey(Key('1_button')));
      // await tester.pumpAndSettle();
      // await tester.tap(find.byKey(Key('plusButton')));
      // await tester.pumpAndSettle();
      // await tester.tap(find.byKey(Key('1_button')));
      // await tester.pumpAndSettle();
      // expect(find.text('1+1'), findsOneWidget);
    },
  );
}

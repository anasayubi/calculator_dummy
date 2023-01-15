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

  testWidgets('Show numbers in calculation area', (WidgetTester tester) async {
    // Click and tap 1 single number and verify if it's displayed in both keypad
    //  and in the calculation area
    tapNumberAndVerifyIfShown(String numberAsStr) async {
      final testWidget = ProviderScope(child: MaterialApp(home: HomePage()));
      await tester.pumpWidget(testWidget);

      await tester.tap(find.byKey(Key('${numberAsStr}_button')));
      await tester.pumpAndSettle();
      // Check if displayed on keypad and in calculation area
      expect(find.text(numberAsStr), findsNWidgets(2));
    }

    await tapNumberAndVerifyIfShown('1');
    await tapNumberAndVerifyIfShown('2');
    await tapNumberAndVerifyIfShown('3');
    await tapNumberAndVerifyIfShown('4');
    await tapNumberAndVerifyIfShown('5');
    await tapNumberAndVerifyIfShown('6');
    await tapNumberAndVerifyIfShown('7');
    await tapNumberAndVerifyIfShown('8');
    await tapNumberAndVerifyIfShown('9');

    // expect(find.text('=1'), findsOneWidget);
  });
}

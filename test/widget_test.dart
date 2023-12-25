// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:introductiontowidgets_immutablewidgetwithdynamicstyling/main.dart';

void main() {
  testWidgets('Immutable widget changes style on button press',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: YourImmutableWidget()));

    final initialStyle =
        find.byType(Container).evaluate().single.widget as Container;
    expect(initialStyle.decoration, isInstanceOf<BoxDecoration>());

    // Simulate button press
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    final changedStyle =
        find.byType(Container).evaluate().single.widget as Container;
    expect(changedStyle.decoration, isNot(equals(initialStyle.decoration)));
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/main.dart';

void main() {

  // Halaman Dashboard
  testWidgets('Contacts Dashboard', (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp());

    expect(find.text('Contacts'), findsOneWidget);
    expect(find.text('No contact available, please create one'), findsOneWidget);
    expect(find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    expect(find.widgetWithText(AppBar, 'Contacts'), findsOneWidget);
    expect(find.widgetWithText(AppBar, 'Create Contact'), findsNothing);

  });

  // Halaman Create Contact
  testWidgets('Contacts Dashboard', (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp()); 

    // Navigate
    await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Create Contact'), findsOneWidget);

  });

}

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
  testWidgets('Contacts App', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(const Dashboard());

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);

    await tester.pumpWidget(const MyApp());

    expect(find.text('Contacts'), findsOneWidget);
    expect(find.text('No contact available, please create one'), findsOneWidget);
    expect(find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    expect(find.widgetWithText(AppBar, 'Contacts'), findsOneWidget);
    expect(find.widgetWithText(AppBar, 'Create Contact'), findsNothing);    

    // New Page
    await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Create Contact'), findsOneWidget);

  });
  
}

// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new TodoApp());

    // Expect no Todo list items  
    expect(find.byType(ListTile), findsNothing);

    // Enter a Todo 
    expect(find.byType(TextField), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Todo item #1');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    // And now we should have one Todo list item
    expect(find.byType(ListTile), findsOneWidget);
  });
}

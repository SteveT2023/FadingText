import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fadingtext/main.dart';

void main() {
  testWidgets('Fading text visibility toggle test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the text is initially visible.
    expect(find.text('Hello, Flutter!'), findsOneWidget);

    // Tap the play icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pumpAndSettle();

    // Verify that the text is now invisible.
    expect(find.text('Hello, Flutter!'), findsNothing);

    // Tap the play icon again and trigger a frame.
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pumpAndSettle();

    // Verify that the text is visible again.
    expect(find.text('Hello, Flutter!'), findsOneWidget);
  });
}
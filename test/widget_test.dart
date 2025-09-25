import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ci_cd_influtter/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  // YANGI TESTLARNI QO'SHAMIZ
  testWidgets('Counter app full test', (WidgetTester tester) async {
    // Appni ishga tushiramiz
    await tester.pumpWidget(const MyApp());

    // Dastlabki holatni tekshiramiz
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // + tugmasini bosamiz
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Counter 1 ga o'zgartirildimi?
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);

    // Yana bir marta + bosamiz
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    // - tugmasini bosamiz
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter does not go below zero', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Dastlab 0 da
    expect(find.text('0'), findsOneWidget);

    // - tugmasini bosamiz (0 dan pastga tushmasligi kerak)
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Hanuz 0 da turishi kerak
    expect(find.text('0'), findsOneWidget);
    expect(find.text('-1'), findsNothing);
  });

  testWidgets('App title is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // AppBar da title borligini tekshiramiz
    expect(find.text('Counter App'), findsOneWidget);
  });

  testWidgets('Multiple increments work correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Bir necha marta + bosamiz
    for (int i = 0; i < 5; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }

    expect(find.text('5'), findsOneWidget);

    // Bir necha marta - bosamiz
    for (int i = 0; i < 3; i++) {
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
    }

    expect(find.text('2'), findsOneWidget);
  });
}

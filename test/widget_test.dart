// This is a basic Flutter widget test.
//
// Verifies that the BMR calculator app can be built and rendered
// without throwing an exception.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bmr_calculator/main.dart';

void main() {
  testWidgets('BMR calculator smoke test', (WidgetTester tester) async {
    // Use a phone-sized viewport to avoid layout overflow in tests.
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app bar title is rendered.
    expect(find.text('KALKULATOR BMR'), findsOneWidget);
  });
}
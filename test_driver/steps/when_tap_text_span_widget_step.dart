import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

/// Taps the widget found with the given control key.
///
/// Parameters:
///   1 - {string} the control key
///
/// Examples:
///
///   `When I tap  button"`
///   `When I tap "controlKey" element"`
///   `When I tap "controlKey" label"`
///   `When I tap "controlKey" icon"`
///   `When I tap "controlKey" field"`
///   `When I tap "controlKey" text"`
///   `When I tap "controlKey" widget"`
// ignore: non_constant_identifier_names
StepDefinitionGeneric WhenTapTextSpanWidget() {
  return then1<String, FlutterWorld>(
    RegExp(
        r'I tap the text span that contains the text {string}$'),
    (input1, context) async {
      final finder = find.descendant(of: find.byType('RichText'), matching: find.byType('TextSpan'));

      await context.world.driver.scrollIntoView(finder);
      await FlutterDriverUtils.tap(
        context.world.driver,
        finder,
      );
    },
  );
}

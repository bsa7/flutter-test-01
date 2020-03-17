import 'package:flutter_test/flutter_test.dart';
import 'package:hw_4/src/views/app_view.dart';

void main() {
  testWidgets('Check app view is created', (WidgetTester tester) async {
    await tester.pumpWidget(AppView());
  });
}

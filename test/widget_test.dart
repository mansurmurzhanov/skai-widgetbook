import 'package:flutter_test/flutter_test.dart';
import 'package:skai_widgetbook/widgetbook/widgetbook.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  testWidgets('Widgetbook catalog starts', (tester) async {
    await tester.pumpWidget(const SkaiWidgetbook());
    await tester.pumpAndSettle();

    expect(find.byType(Widgetbook), findsOneWidget);
  });
}

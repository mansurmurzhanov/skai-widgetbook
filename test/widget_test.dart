import 'package:flutter_test/flutter_test.dart';
import 'package:skai_widgetbook/widgetbook/widgetbook.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  testWidgets('Widgetbook catalog starts', (tester) async {
    await tester.pumpWidget(const SkaiWidgetbook());
    await tester.pumpAndSettle();

    expect(find.byType(Widgetbook), findsOneWidget);
  });

  testWidgets('Widgetbook opens selected use case', (tester) async {
    await tester.pumpWidget(
      const SkaiWidgetbook(
        initialRoute: '/?path=skai-ui-kit/appcard/default',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Default AppCard'), findsOneWidget);
  });

  testWidgets('AppTextField long text works in mobile viewport', (
    tester,
  ) async {
    await tester.pumpWidget(
      const SkaiWidgetbook(
        initialRoute:
            '/?path=skai-ui-kit/apptextfield/long-text&text-scale={factor:1.50}&viewport={name:iPhone%2012}',
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(Widgetbook), findsOneWidget);
  });

  testWidgets('AppButton knobs fit in mobile viewport', (tester) async {
    await tester.pumpWidget(
      const SkaiWidgetbook(
        initialRoute:
            '/?path=skai-ui-kit/appbutton/default&text-scale={factor:1.50}&viewport={name:iPhone%2012}',
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Continue'), findsWidgets);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skai_widgetbook/core/theme/app_theme.dart';
import 'package:skai_widgetbook/feature/common/widget/app_button.dart';
import 'package:skai_widgetbook/feature/common/widget/app_card.dart';
import 'package:skai_widgetbook/feature/common/widget/app_glass_card.dart';
import 'package:skai_widgetbook/feature/common/widget/app_radial_progress_chart.dart';
import 'package:skai_widgetbook/feature/common/widget/app_switcher.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('AppButton golden', (tester) async {
    await _pumpGolden(
      tester,
      light: AppButton(onPressed: () {}, child: const Text('Continue')),
      dark: AppButton(onPressed: () {}, child: const Text('Continue')),
    );

    await expectLater(
      find.byType(_GoldenHost),
      matchesGoldenFile('goldens/app_button.png'),
    );
  });

  testWidgets('AppCard golden', (tester) async {
    const content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Analytics'),
        SizedBox(height: 8),
        Text('Revenue forecast and plan completion.'),
      ],
    );

    await _pumpGolden(
      tester,
      light: const AppCard(showBorder: true, child: content),
      dark: const AppCard(showBorder: true, child: content),
    );

    await expectLater(
      find.byType(_GoldenHost),
      matchesGoldenFile('goldens/app_card.png'),
    );
  });

  testWidgets('AppGlassCard golden', (tester) async {
    const child = Text('Glass card');

    await _pumpGolden(
      tester,
      light: const SizedBox(width: 220, child: AppGlassCard(child: child)),
      dark: const SizedBox(width: 220, child: AppGlassCard(child: child)),
    );

    await expectLater(
      find.byType(_GoldenHost),
      matchesGoldenFile('goldens/app_glass_card.png'),
    );
  });

  testWidgets('AppSwitcher golden', (tester) async {
    await _pumpGolden(
      tester,
      light: AppSwitcherWidget(
        label: 'Enable notifications',
        valueNotifier: ValueNotifier(true),
      ),
      dark: AppSwitcherWidget(
        label: 'Enable notifications',
        valueNotifier: ValueNotifier(true),
      ),
    );

    await expectLater(
      find.byType(_GoldenHost),
      matchesGoldenFile('goldens/app_switcher.png'),
    );
  });

  testWidgets('AppRadialProgressChart golden', (tester) async {
    await _pumpGolden(
      tester,
      light: const AppRadialProgressChart(
        progress: 0.72,
        label: 'Plan completion',
        size: 160,
        animationDuration: Duration.zero,
      ),
      dark: const AppRadialProgressChart(
        progress: 0.72,
        label: 'Plan completion',
        size: 160,
        animationDuration: Duration.zero,
      ),
    );

    await expectLater(
      find.byType(_GoldenHost),
      matchesGoldenFile('goldens/app_radial_progress_chart.png'),
    );
  });
}

Future<void> _pumpGolden(
  WidgetTester tester, {
  required Widget light,
  required Widget dark,
}) async {
  await tester.binding.setSurfaceSize(const Size(760, 720));
  addTearDown(() => tester.binding.setSurfaceSize(null));

  await tester.pumpWidget(_GoldenHost(light: light, dark: dark));
  await GoogleFonts.pendingFonts();
  await tester.pumpAndSettle();
}

class _GoldenHost extends StatelessWidget {
  const _GoldenHost({required this.light, required this.dark});

  final Widget light;
  final Widget dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Row(
        children: [
          Expanded(
            child: _ThemePanel(
              title: 'Light',
              theme: AppTheme.light,
              child: light,
            ),
          ),
          Expanded(
            child: _ThemePanel(
              title: 'Dark',
              theme: AppTheme.dark,
              child: dark,
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemePanel extends StatelessWidget {
  const _ThemePanel({
    required this.title,
    required this.theme,
    required this.child,
  });

  final String title;
  final ThemeData theme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Builder(
        builder: (context) {
          return Material(
            color: theme.scaffoldBackgroundColor,
            child: Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 24),
                    child,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

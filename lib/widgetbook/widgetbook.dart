import 'package:flutter/material.dart';
import 'package:skai_widgetbook/core/theme/app_theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'app_button/app_button_use_case.dart';
import 'app_card/app_card_use_case.dart';
import 'app_glass_card/app_glass_card_use_case.dart';

class SkaiWidgetbook extends StatelessWidget {
  const SkaiWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        appButtonComponent,
        appCardComponent,
        appGlassCardComponent,
      ],
      lightTheme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:skai_widgetbook/core/theme/app_theme.dart';
import 'package:widgetbook/widgetbook.dart';

import 'app_button/app_button_use_case.dart';
import 'app_card/app_card_use_case.dart';
import 'app_confirm_card/app_confirm_card_use_case.dart';
import 'app_date_range_picker/app_date_range_picker_use_case.dart';
import 'app_error_widget/app_error_widget_use_case.dart';
import 'app_glass_card/app_glass_card_use_case.dart';
import 'app_loading/app_loading_use_case.dart';
import 'app_password_field/app_password_field_use_case.dart';
import 'app_radial_progress_chart/app_radial_progress_chart_use_case.dart';
import 'app_switcher/app_switcher_use_case.dart';
import 'app_text_field/app_text_field_use_case.dart';

class SkaiWidgetbook extends StatelessWidget {
  const SkaiWidgetbook({super.key, this.initialRoute = '/'});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      initialRoute: initialRoute,
      directories: [
        WidgetbookCategory(
          name: 'Skai UI Kit',
          children: [
            appButtonComponent,
            appCardComponent,
            appGlassCardComponent,
            appTextFieldComponent,
            appPasswordFieldComponent,
            appDateRangePickerComponent,
            appConfirmCardComponent,
            appErrorWidgetComponent,
            appLoadingComponent,
            appSwitcherComponent,
            appRadialProgressChartComponent,
          ],
        ),
      ],
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: AppTheme.light),
            WidgetbookTheme(name: 'Dark', data: AppTheme.dark),
          ],
        ),
        TextScaleAddon(min: 1, max: 1.5, divisions: 2),
        ViewportAddon(Viewports.all),
      ],
      lightTheme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}

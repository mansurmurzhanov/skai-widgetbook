import 'package:flutter/material.dart';
import 'package:skai_widgetbook/feature/common/widget/app_loading.dart';
import 'package:widgetbook/widgetbook.dart';

final appLoadingComponent = WidgetbookComponent(
  name: 'AppLoading',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => const SizedBox(
        height: 180,
        child: AppLoading(),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom Color',
      builder: (context) {
        final color = context.knobs.color(
          label: 'Color',
          initialValue: Theme.of(context).colorScheme.primary,
        );
        return SizedBox(
          height: 180,
          child: AppLoading(color: color),
        );
      },
    ),
  ],
);

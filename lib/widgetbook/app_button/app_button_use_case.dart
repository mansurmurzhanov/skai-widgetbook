import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:skai_widgetbook/feature/common/widget/app_button.dart';

final appButtonComponent = WidgetbookComponent(
  name: 'AppButton',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => Center(
        child: AppButton(
          child: const Text('Continue'),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => const Center(
        child: AppButton(
          child: Text('Continue'),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Loading',
      builder: (context) => Center(
        child: AppButton(
          isLoading: true,
          child: const Text('Continue'),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Outline',
      builder: (context) => Center(
        child: AppButton(
          type: ButtonType.outline,
          child: const Text('Continue'),
          onPressed: () {},
        ),
      ),
    ),
  ],
);
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:skai_widgetbook/feature/common/widget/app_button.dart';

final appButtonComponent = WidgetbookComponent(
  name: 'AppButton',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final label = context.knobs.string(
          label: 'Text',
          initialValue: 'Continue',
        );
        final type = context.knobs.object.dropdown(
          label: 'Type',
          options: ButtonType.values,
          initialOption: ButtonType.primary,
          labelBuilder: (value) => value.name,
        );
        final size = context.knobs.object.dropdown(
          label: 'Size',
          options: ButtonSize.values,
          initialOption: ButtonSize.m,
          labelBuilder: (value) => value.name,
        );
        final loading = context.knobs.boolean(label: 'Loading');

        return Center(
          child: AppButton(
            type: type,
            size: size,
            isLoading: loading,
            onPressed: () {},
            child: Text(label),
          ),
        );
      },
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
      name: 'Long Text',
      builder: (context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: AppButton(
            type: ButtonType.secondary,
            child: const Text(
              'Continue with the selected analytics report and notify team',
              textAlign: TextAlign.center,
            ),
            onPressed: () {},
          ),
        ),
      ),
    ),
  ],
);

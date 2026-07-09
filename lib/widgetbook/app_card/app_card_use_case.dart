import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:skai_widgetbook/feature/common/widget/app_card.dart';

final appCardComponent = WidgetbookComponent(
  name: 'AppCard',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final title = context.knobs.string(
          label: 'Title',
          initialValue: 'Default AppCard',
        );
        final showBorder = context.knobs.boolean(label: 'Border');
        final showShadow = context.knobs.boolean(label: 'Shadow');
        final radius = context.knobs.double.slider(
          label: 'Radius',
          initialValue: 12,
          min: 0,
          max: 32,
          divisions: 16,
        );

        return Center(
          child: SizedBox(
            width: 320,
            child: AppCard(
              showBorder: showBorder,
              showShadow: showShadow,
              borderRadius: radius,
              child: Text(title),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'With Border',
      builder: (context) => const Center(
        child: SizedBox(
          width: 320,
          child: AppCard(
            showBorder: true,
            child: Text('Border enabled'),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With Shadow',
      builder: (context) => const Center(
        child: SizedBox(
          width: 320,
          child: AppCard(
            showShadow: true,
            child: Text('Shadow enabled'),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Long Text',
      builder: (context) => const Center(
        child: SizedBox(
          width: 320,
          child: AppCard(
            showBorder: true,
            child: Text(
              'A much longer content block demonstrates wrapping, padding and card height when real dashboard copy has more than one line.',
            ),
          ),
        ),
      ),
    ),
  ],
);

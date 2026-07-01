import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:skai_widgetbook/feature/common/widget/app_card.dart';

final appCardComponent = WidgetbookComponent(
  name: 'AppCard',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => const Center(
        child: SizedBox(
          width: 320,
          child: AppCard(
            child: Text('Default AppCard'),
          ),
        ),
      ),
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
      name: 'Custom Content',
      builder: (context) => const Center(
        child: SizedBox(
          width: 320,
          child: AppCard(
            showBorder: true,
            showShadow: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Analytics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'This card demonstrates a more realistic content layout.',
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ],
);
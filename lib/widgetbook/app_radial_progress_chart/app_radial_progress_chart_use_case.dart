import 'package:flutter/material.dart';
import 'package:skai_widgetbook/core/theme/app_colors.dart';
import 'package:skai_widgetbook/feature/common/widget/app_radial_progress_chart.dart';
import 'package:widgetbook/widgetbook.dart';

final appRadialProgressChartComponent = WidgetbookComponent(
  name: 'AppRadialProgressChart',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final label = context.knobs.string(
          label: 'Label',
          initialValue: 'Plan completion',
        );
        final progress = context.knobs.double.slider(
          label: 'Progress',
          initialValue: 0.72,
          min: 0,
          max: 1,
          divisions: 100,
          precision: 2,
        );
        final size = context.knobs.double.slider(
          label: 'Size',
          initialValue: 220,
          min: 120,
          max: 320,
          divisions: 20,
        );
        final glow = context.knobs.boolean(label: 'Glow');

        return Center(
          child: AppRadialProgressChart(
            label: label,
            progress: progress,
            size: size,
            showGlow: glow,
            infoDescription: 'Interactive tooltip text for the selected metric.',
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Low Progress',
      builder: (context) => const Center(
        child: AppRadialProgressChart(
          label: 'Critical metric',
          progress: 0.18,
          progressColor: AppColors.lightDestructive,
          centerText: '18%',
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Long Label',
      builder: (context) => const Center(
        child: AppRadialProgressChart(
          label: 'Very long analytics metric label that should fit in two lines',
          progress: 0.86,
          showGlow: true,
        ),
      ),
    ),
  ],
);

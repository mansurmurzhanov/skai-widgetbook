import 'package:flutter/material.dart';
import 'package:skai_widgetbook/feature/common/widget/app_button.dart';
import 'package:skai_widgetbook/feature/common/widget/app_date_range_picker.dart';
import 'package:widgetbook/widgetbook.dart';

final appDateRangePickerComponent = WidgetbookComponent(
  name: 'AppDateRangePicker',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => const _DatePickerLauncher(),
    ),
    WidgetbookUseCase(
      name: 'Bounded Range',
      builder: (context) => _DatePickerLauncher(
        availableDateRange: DateTimeRange(
          start: DateTime(2026, 1),
          end: DateTime(2026, 7, 9),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom Initial Range',
      builder: (context) {
        final days = context.knobs.double.slider(
          label: 'Range days',
          initialValue: 14,
          min: 1,
          max: 60,
          divisions: 59,
          precision: 0,
        );
        final end = DateTime(2026, 7, 9);
        return _DatePickerLauncher(
          initialDateRange: DateTimeRange(
            start: end.subtract(Duration(days: days.round())),
            end: end,
          ),
        );
      },
    ),
  ],
);

class _DatePickerLauncher extends StatefulWidget {
  const _DatePickerLauncher({
    this.initialDateRange,
    this.availableDateRange,
  });

  final DateTimeRange? initialDateRange;
  final DateTimeRange? availableDateRange;

  @override
  State<_DatePickerLauncher> createState() => _DatePickerLauncherState();
}

class _DatePickerLauncherState extends State<_DatePickerLauncher> {
  DateTimeRange? _selectedRange;

  @override
  Widget build(BuildContext context) {
    final range = _selectedRange ?? widget.initialDateRange;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            onPressed: () async {
              final selected = await AppDateRangePicker.show(
                context: context,
                initialDateRange: range,
                availableDateRange: widget.availableDateRange,
              );
              if (selected != null && mounted) {
                setState(() => _selectedRange = selected);
              }
            },
            child: const Text('Open date range picker'),
          ),
          const SizedBox(height: 16),
          Text(
            range == null
                ? 'No range selected'
                : '${range.start.day}.${range.start.month}.${range.start.year} - ${range.end.day}.${range.end.month}.${range.end.year}',
          ),
        ],
      ),
    );
  }
}

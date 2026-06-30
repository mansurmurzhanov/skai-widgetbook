import 'package:flutter/material.dart';
import 'package:skai_widgetbook/core/extensions/context_extension.dart';
import 'package:skai_widgetbook/core/extensions/datetime_extension.dart';
import 'package:skai_widgetbook/core/theme/app_colors.dart';
import 'package:skai_widgetbook/core/theme/app_spacing.dart';
import 'package:skai_widgetbook/feature/common/widget/app_glass_card.dart';

class AppDateRangePicker {
  static Future<DateTimeRange?> show({
    required BuildContext context,
    DateTimeRange? initialDateRange,
    DateTimeRange? availableDateRange,
  }) async {
    final now = DateTime.now();
    final rawRange =
        initialDateRange ?? DateTimeRange(start: now.startOfMonth, end: now);
    final defaultRange = _clampRange(rawRange, availableDateRange);

    return showDialog<DateTimeRange>(
      context: context,
      barrierColor: AppColors.lightForeground.withValues(alpha: 0.35),
      builder: (context) => _DateRangePickerDialog(
        initialDateRange: defaultRange,
        availableDateRange: availableDateRange,
      ),
    );
  }

  static DateTimeRange _clampRange(
    DateTimeRange source,
    DateTimeRange? bounds,
  ) {
    if (bounds == null) return source;

    var start = source.start;
    var end = source.end;

    if (start.isBefore(bounds.start)) start = bounds.start;
    if (start.isAfter(bounds.end)) start = bounds.end;
    if (end.isBefore(bounds.start)) end = bounds.start;
    if (end.isAfter(bounds.end)) end = bounds.end;
    if (start.isAfter(end)) start = end;

    return DateTimeRange(start: start, end: end);
  }
}

class _DateRangePickerDialog extends StatefulWidget {
  final DateTimeRange initialDateRange;
  final DateTimeRange? availableDateRange;

  const _DateRangePickerDialog({
    required this.initialDateRange,
    this.availableDateRange,
  });

  @override
  State<_DateRangePickerDialog> createState() => _DateRangePickerDialogState();
}

class _DateRangePickerDialogState extends State<_DateRangePickerDialog> {
  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;
  late int _displayYear;
  late int _displayMonth;
  bool _isSelectingStart = true;

  DateTime get _minAllowedDate =>
      widget.availableDateRange?.start ?? DateTime(2000);

  DateTime get _maxAllowedDate {
    final scopedMax = widget.availableDateRange?.end;
    final today = DateTime.now();
    if (scopedMax == null) return today;
    return scopedMax.isBefore(today) ? scopedMax : today;
  }

  @override
  void initState() {
    super.initState();
    _selectedStartDate = widget.initialDateRange.start;
    _selectedEndDate = widget.initialDateRange.end;
    _displayYear = _selectedStartDate.year;
    _displayMonth = _selectedStartDate.month;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    List<String> monthNames = [
      context.l10n.january,
      context.l10n.february,
      context.l10n.march,
      context.l10n.april,
      context.l10n.may,
      context.l10n.june,
      context.l10n.july,
      context.l10n.august,
      context.l10n.september,
      context.l10n.october,
      context.l10n.november,
      context.l10n.december,
    ];

    List<String> weekDays = [
      context.l10n.monday,
      context.l10n.tuesday,
      context.l10n.wednesday,
      context.l10n.thursday,
      context.l10n.friday,
      context.l10n.saturday,
      context.l10n.sunday,
    ];

    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 340),
        child: AppGlassCard(
          borderRadius: AppSpacing.radiusLg,
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.calendar,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              _buildYearMonthSelectors(
                textTheme,
                colorScheme,
                monthNames,
                weekDays,
              ),
              const SizedBox(height: AppSpacing.md),
              _buildWeekDaysHeader(textTheme, colorScheme, weekDays),
              const SizedBox(height: AppSpacing.sm),
              _buildCalendarGrid(textTheme, colorScheme),
              const SizedBox(height: AppSpacing.lg),
              _buildActions(textTheme, colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYearMonthSelectors(
    TextTheme textTheme,
    ColorScheme colorScheme,
    List<String> monthNames,
    List<String> weekDays,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.year,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 4),
              _buildDropdown(
                value: _displayYear.toString(),
                items: _allowedYears.map((y) => y.toString()).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _displayYear = int.parse(value);
                    });
                  }
                },
                colorScheme: colorScheme,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.month,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 4),
              _buildDropdown(
                value: monthNames[_displayMonth - 1],
                items: monthNames,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _displayMonth = monthNames.indexOf(value) + 1;
                    });
                  }
                },
                colorScheme: colorScheme,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          isDense: true,
          icon: Icon(Icons.keyboard_arrow_down, color: colorScheme.onSurface),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildWeekDaysHeader(
    TextTheme textTheme,
    ColorScheme colorScheme,
    List<String> weekDays,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekDays
          .map(
            (day) => SizedBox(
              width: 36,
              child: Center(
                child: Text(
                  day,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalendarGrid(TextTheme textTheme, ColorScheme colorScheme) {
    final firstDayOfMonth = DateTime(_displayYear, _displayMonth, 1);
    final lastDayOfMonth = DateTime(_displayYear, _displayMonth + 1, 0);
    final startWeekday = firstDayOfMonth.weekday;
    final daysInMonth = lastDayOfMonth.day;

    final days = <Widget>[];

    for (int i = 1; i < startWeekday; i++) {
      days.add(const SizedBox(width: 36, height: 36));
    }

    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(_displayYear, _displayMonth, day);
      final isSelected = _isDateSelected(date);
      final isInRange = _isDateInRange(date);
      final isEnabled = _isDateEnabled(date);

      days.add(
        GestureDetector(
          onTap: isEnabled ? () => _onDayTap(date) : null,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primary
                  : isInRange
                  ? colorScheme.primary.withValues(alpha: 0.1)
                  : null,
              borderRadius: BorderRadius.circular(8),
              border: date.isToday && !isSelected
                  ? Border.all(color: colorScheme.primary, width: 1)
                  : null,
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: textTheme.bodyMedium?.copyWith(
                  color: !isEnabled
                      ? colorScheme.onSurface.withValues(alpha: 0.3)
                      : isSelected
                      ? AppColors.lightPrimaryForeground
                      : colorScheme.onSurface,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Wrap(spacing: 4, runSpacing: 4, children: days);
  }

  bool _isDateSelected(DateTime date) {
    return _isSameDay(date, _selectedStartDate) ||
        _isSameDay(date, _selectedEndDate);
  }

  bool _isDateInRange(DateTime date) {
    return date.isAfter(_selectedStartDate) && date.isBefore(_selectedEndDate);
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  List<int> get _allowedYears {
    final minYear = _minAllowedDate.year;
    final maxYear = _maxAllowedDate.year;
    if (maxYear < minYear) return [DateTime.now().year];
    return [for (int y = minYear; y <= maxYear; y++) y];
  }

  bool _isDateEnabled(DateTime date) {
    return !date.isBefore(_minAllowedDate) && !date.isAfter(_maxAllowedDate);
  }

  void _onDayTap(DateTime date) {
    if (!_isDateEnabled(date)) return;
    setState(() {
      if (_isSelectingStart) {
        _selectedStartDate = date;
        if (date.isAfter(_selectedEndDate)) {
          _selectedEndDate = date;
        }
        _isSelectingStart = false;
      } else {
        if (date.isBefore(_selectedStartDate)) {
          _selectedStartDate = date;
        } else {
          _selectedEndDate = date;
        }
        _isSelectingStart = true;
      }
    });
  }

  Widget _buildActions(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              context.l10n.cancel,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              final start = _selectedStartDate.isBefore(_minAllowedDate)
                  ? _minAllowedDate
                  : _selectedStartDate;
              final endCandidate = _selectedEndDate.isAfter(_maxAllowedDate)
                  ? _maxAllowedDate
                  : _selectedEndDate;
              final end = endCandidate.isBefore(start) ? start : endCandidate;
              Navigator.of(context).pop(DateTimeRange(start: start, end: end));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: AppColors.lightPrimaryForeground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
            ),
            child: Text(context.l10n.select),
          ),
        ),
      ],
    );
  }
}

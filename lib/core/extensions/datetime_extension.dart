import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format([String pattern = 'dd.MM.yyyy']) {
    return DateFormat(pattern, 'ru').format(this);
  }

  String formatDateTime([String pattern = 'dd.MM.yyyy HH:mm']) {
    return DateFormat(pattern, 'ru').format(this);
  }

  String formatTime([String pattern = 'HH:mm']) {
    return DateFormat(pattern, 'ru').format(this);
  }

  DateTime get startOfDay => DateTime(year, month, day);

  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  DateTime get startOfWeek {
    final difference = weekday - 1;
    return subtract(Duration(days: difference)).startOfDay;
  }

  DateTime get endOfWeek {
    final difference = 7 - weekday;
    return add(Duration(days: difference)).endOfDay;
  }

  DateTime get startOfMonth => DateTime(year, month, 1);

  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999);

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  bool get isPast => isBefore(DateTime.now());

  bool get isFuture => isAfter(DateTime.now());

  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  bool get isWeekday => !isWeekend;

  int get ageInYears {
    final now = DateTime.now();
    int age = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }
    return age;
  }

  int daysUntil(DateTime other) {
    return DateTime(
      other.year,
      other.month,
      other.day,
    ).difference(DateTime(year, month, day)).inDays;
  }

  DateTime addBusinessDays(int days) {
    var result = this;
    var addedDays = 0;
    while (addedDays < days) {
      result = result.add(const Duration(days: 1));
      if (result.isWeekday) addedDays++;
    }
    return result;
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}

extension NullableDateTimeExtension on DateTime? {
  String formatOrDefault([
    String pattern = 'dd.MM.yyyy',
    String defaultValue = '-',
  ]) {
    return this?.format(pattern) ?? defaultValue;
  }

  bool get isNull => this == null;
}

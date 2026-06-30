import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:skai_data_mobile/core/extensions/context_extension.dart';
import 'package:skai_data_mobile/core/theme/app_colors.dart';
import 'package:skai_data_mobile/core/theme/app_spacing.dart';

class AppFlushBar {
  static Flushbar<dynamic>? _current;

  static void dismiss() {
    _current?.dismiss();
    _current = null;
  }

  static void show(BuildContext context, FlushBarParams params) {
    if (!context.mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      _current?.dismiss();

      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;

      final titleColor = params.status.toTitleColor();
      final bg = params.status.toBackgroundColor();
      final icon = _toIcon(params.status);
      final top = MediaQuery.of(context).padding.top + kToolbarHeight;

      final fb = Flushbar(
        margin: EdgeInsets.only(top: top, left: 10, right: 10),
        borderRadius: BorderRadius.circular(12),
        backgroundColor: bg,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        isDismissible: true,
        duration: Duration(seconds: params.seconds),
        animationDuration: const Duration(milliseconds: 250),
        leftBarIndicatorColor: titleColor,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        shouldIconPulse: false,
        icon: Icon(icon, color: titleColor),
        mainButton: params.mainButton,
        titleText: Text(
          params.title ?? params.status.toTitle(context),
          style: theme.textTheme.titleMedium?.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        messageText: Text(
          params.text,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.surface,
          ),
        ),
      );

      _current = fb;
      fb.show(context).then((_) => _current = null);
    });
  }

  static void showError(
    BuildContext context,
    Object error, {
    int seconds = 4,
    Widget? mainButton,
    String? titleOverride,
  }) {
    final errorMessage = error is String ? error : error.toString();

    show(
      context,
      FlushBarParams(
        text: errorMessage,
        mainButton: mainButton,
        seconds: seconds,
        status: FlushBarStatus.error,
        title: titleOverride,
      ),
    );
  }

  static void showWarning(
    BuildContext context,
    String message, {
    int seconds = 4,
    Widget? mainButton,
    String? titleOverride,
  }) {
    show(
      context,
      FlushBarParams(
        text: message,
        mainButton: mainButton,
        seconds: seconds,
        status: FlushBarStatus.warning,
        title: titleOverride,
      ),
    );
  }

  static void showSuccess(
    BuildContext context,
    String message, {
    int seconds = 4,
    Widget? mainButton,
    String? titleOverride,
  }) {
    show(
      context,
      FlushBarParams(
        text: message,
        mainButton: mainButton,
        seconds: seconds,
        status: FlushBarStatus.success,
        title: titleOverride,
      ),
    );
  }

  static IconData _toIcon(FlushBarStatus status) {
    switch (status) {
      case FlushBarStatus.success:
        return Icons.check_circle_rounded;
      case FlushBarStatus.error:
        return Icons.error_rounded;
      case FlushBarStatus.warning:
        return Icons.warning_rounded;
    }
  }
}

class FlushBarParams {
  final String text;
  final Widget? mainButton;
  final int seconds;
  final FlushBarStatus status;
  final String? title;

  FlushBarParams({
    required this.text,
    this.mainButton,
    this.seconds = 3,
    required this.status,
    this.title,
  });
}

enum FlushBarStatus {
  success,
  error,
  warning;

  String toTitle(BuildContext context) {
    switch (this) {
      case FlushBarStatus.success:
        return context.l10n.success;
      case FlushBarStatus.error:
        return context.l10n.error;
      case FlushBarStatus.warning:
        return context.l10n.warning;
    }
  }

  Color toTitleColor() {
    switch (this) {
      case FlushBarStatus.success:
        return AppColors.lightPrimaryForeground;
      case FlushBarStatus.error:
        return AppColors.lightPrimaryForeground;
      case FlushBarStatus.warning:
        return AppColors.lightPrimaryForeground;
    }
  }

  Color toBackgroundColor() {
    switch (this) {
      case FlushBarStatus.success:
        return AppColors.success;
      case FlushBarStatus.error:
        return AppColors.error;
      case FlushBarStatus.warning:
        return AppColors.warning;
    }
  }
}

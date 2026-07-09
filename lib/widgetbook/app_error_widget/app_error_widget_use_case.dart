import 'package:flutter/material.dart';
import 'package:skai_widgetbook/feature/common/widget/app_error_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final appErrorWidgetComponent = WidgetbookComponent(
  name: 'AppErrorWidget',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final error = context.knobs.string(
          label: 'Error title',
          initialValue: 'Network unavailable',
        );
        final message = context.knobs.string(
          label: 'Message',
          initialValue: 'Check your connection and try again.',
          maxLines: 3,
        );
        final showRetry = context.knobs.boolean(
          label: 'Show retry',
          initialValue: true,
        );

        return AppErrorWidget(
          error: error,
          message: message,
          showRetryButton: showRetry,
          onRetry: showRetry ? () {} : null,
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Server Error',
      builder: (context) => AppErrorWidget(
        error: 'Service unavailable',
        statusCode: 503,
        onRetry: () {},
      ),
    ),
    WidgetbookUseCase(
      name: 'With Logout',
      builder: (context) => AppErrorWidget(
        error: 'Session expired',
        message: 'Please sign in again to continue.',
        icon: Icons.lock_clock_outlined,
        onRetry: () {},
        onLogout: () {},
      ),
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:skai_data_mobile/core/extensions/context_extension.dart';
import 'package:skai_data_mobile/core/theme/app_spacing.dart';
import 'app_button.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;
  final String? message;
  final String? retryButtonText;
  final VoidCallback? onRetry;
  final VoidCallback? onLogout;
  final String? logoutButtonText;
  final IconData? icon;
  final double? iconSize;
  final bool showRetryButton;
  final int? statusCode;

  const AppErrorWidget({
    super.key,
    required this.error,
    this.message,
    this.retryButtonText,
    this.onRetry,
    this.onLogout,
    this.logoutButtonText,
    this.icon,
    this.iconSize,
    this.showRetryButton = true,
    this.statusCode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isServerError = statusCode != null && statusCode! >= 500;
    final displayMessage = isServerError
        ? context.l10n.technicalWorkOngoing
        : message;
    final l10n = context.l10n;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.error_outline_rounded,
              size: iconSize ?? 64,
              color: theme.colorScheme.error,
            ),
            SizedBox(height: AppSpacing.md),

            Text(
              isServerError
                  ? context.l10n.technicalWork
                  : '${l10n.errorOccurred}: $error',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),

            if (displayMessage != null) ...[
              Text(
                displayMessage,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xs),
            ],

            if (showRetryButton && onRetry != null) ...[
              const SizedBox(height: AppSpacing.md),
              AppButton(
                onPressed: onRetry,
                type: ButtonType.destructive,
                size: ButtonSize.m,
                child: Text(retryButtonText ?? l10n.retry),
              ),
            ],
            if (onLogout != null) ...[
              const SizedBox(height: AppSpacing.sm),
              AppButton(
                onPressed: onLogout,
                type: ButtonType.outline,
                size: ButtonSize.m,
                child: Text(logoutButtonText ?? l10n.signOut),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

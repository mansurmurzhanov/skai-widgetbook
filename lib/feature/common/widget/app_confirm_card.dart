import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skai_data_mobile/core/extensions/context_extension.dart';
import 'package:skai_data_mobile/core/theme/app_colors.dart';
import 'package:skai_data_mobile/core/theme/app_spacing.dart';
import 'package:skai_data_mobile/feature/common/presentation/widget/app_button.dart';
import 'package:skai_data_mobile/feature/common/presentation/widget/app_card.dart';

class AppConfirmSheet extends StatelessWidget {
  final String? title;

  final String? description;

  final VoidCallback? onConfirm;

  final VoidCallback? onCancel;

  final IconData? icon;

  final Color? iconColor;

  final double? iconSize;

  final String? confirmText;

  final String? cancelText;

  final bool isDestructive;

  final bool useSaveText;

  const AppConfirmSheet({
    super.key,
    this.title,
    this.description,
    this.onConfirm,
    this.onCancel,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.confirmText,
    this.cancelText,
    this.isDestructive = false,
    this.useSaveText = false,
  });

  static Future<void> show({
    required BuildContext context,
    String? title,
    String? description,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    IconData? icon,
    Color? iconColor,
    double? iconSize,
    String? confirmText,
    String? cancelText,
    bool isDestructive = false,
    bool useSaveText = false,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (innerContext) {
        return AppConfirmSheet(
          title: title,
          description: description,
          onConfirm: onConfirm,
          onCancel: onCancel,
          icon: icon,
          iconColor: iconColor,
          iconSize: iconSize,
          confirmText: confirmText,
          cancelText: cancelText,
          isDestructive: isDestructive,
          useSaveText: useSaveText,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    final effectiveIconColor =
        iconColor ?? (isDestructive ? colorScheme.error : colorScheme.primary);

    final effectiveConfirmText =
        confirmText ?? (useSaveText ? context.l10n.save : context.l10n.confirm);
    final effectiveCancelText =
        cancelText ?? (useSaveText ? context.l10n.close : context.l10n.cancel);

    final effectiveTitle = title ?? context.l10n.areYouSure;

    return AppCard(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      padding: EdgeInsets.only(
        top: AppSpacing.lg,
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          if (icon != null) ...[
            Icon(icon, size: iconSize ?? 48, color: effectiveIconColor),
            const SizedBox(height: AppSpacing.md),
          ],

          Text(
            effectiveTitle,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),

          if (description != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              description!,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],

          const SizedBox(height: AppSpacing.xl),

          Row(
            children: [
              Expanded(
                child: AppButton(
                  onPressed: () {
                    if (onCancel != null) {
                      onCancel!();
                    }
                    context.router.pop();
                  },
                  type: ButtonType.outline,
                  child: Text(effectiveCancelText),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppButton(
                  onPressed: onConfirm != null
                      ? () {
                          context.router.pop();
                          onConfirm!();
                        }
                      : null,
                  type: isDestructive
                      ? ButtonType.destructive
                      : ButtonType.primary,
                  child: Text(effectiveConfirmText),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

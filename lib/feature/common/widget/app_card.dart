import 'package:flutter/material.dart';
import 'package:skai_widgetbook/core/theme/app_spacing.dart';

class AppCard extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Widget child;
  final BoxDecoration? decoration;
  final bool showBorder;
  final bool showShadow;
  final VoidCallback? onTap;
  const AppCard({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.decoration,
    this.showBorder = false,
    this.showShadow = false,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration:
            decoration ??
            BoxDecoration(
              color: backgroundColor ?? theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusMd),
              border: showBorder ? Border.all(width: 1, color: borderColor ?? theme.colorScheme.outline) : null,
              boxShadow: showShadow
                  ? [
                      BoxShadow(
                        color: theme.shadowColor.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.lg),
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:skai_widgetbook/core/theme/app_colors.dart';

enum ButtonSize { sm, m, lg, icon }

enum ButtonType { primary, secondary, outline, ghost, destructive }

enum ButtonColor { primary, secondary, destructive }

class AppButton extends StatelessWidget {
  final Widget? child;
  final ButtonSize size;
  final ButtonType type;
  final ButtonColor color;
  final VoidCallback? onPressed;
  final WidgetStateProperty<Color>? backgroundColor;
  final WidgetStateProperty<Color>? foregroundColor;
  final WidgetStateProperty<Color>? overlayColor;
  final double elevation;
  final bool? isLoading;
  final BorderRadius? borderRadius;

  const AppButton({
    super.key,
    this.size = ButtonSize.m,
    this.type = ButtonType.primary,
    this.color = ButtonColor.primary,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.overlayColor,
    this.elevation = 0,
    this.isLoading = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading == true ? () {} : onPressed,
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll<double>(elevation),
        backgroundColor:
            backgroundColor ??
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return type.backgroundDisable(color, context);
              }
              return type.background(color, context);
            }),
        foregroundColor:
            foregroundColor ??
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return type.foregroundDisable(color, context);
              }
              if (states.contains(WidgetState.pressed)) {
                return type.foregroundPressed(color, context);
              }
              return type.foreground(color, context);
            }),
        overlayColor:
            overlayColor ??
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return type.backgroundPressed(color, context);
              }
              if (states.contains(WidgetState.disabled)) {
                return AppColors.transparent;
              }
              return AppColors.transparent;
            }),
        shape: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          late Color foregroundColor;
          if (states.contains(WidgetState.pressed)) {
            foregroundColor = type.borderColorPressed(color, context);
          } else if (states.contains(WidgetState.disabled)) {
            foregroundColor = type.disableBorderColor(color, context);
          } else {
            foregroundColor = type.borderColor(color, context);
          }
          return RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            side: BorderSide(color: foregroundColor, width: 1),
          );
        }),
        iconColor:
            foregroundColor ??
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return type.foregroundDisable(color, context);
              }
              if (states.contains(WidgetState.pressed)) {
                return type.foregroundPressed(color, context);
              }
              return type.foreground(color, context);
            }),
        iconSize: WidgetStatePropertyAll<double>(size.iconSize()),
        textStyle: WidgetStatePropertyAll<TextStyle>(size.textStyle(context)),
        padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
          size.padding(context),
        ),
      ),
      child: isLoading == true
          ? CupertinoActivityIndicator(color: type.foreground(color, context))
          : child,
    );
  }
}

extension ButtonSizeExtension on ButtonSize {
  double iconSize() {
    switch (this) {
      case ButtonSize.sm:
        return 16;
      case ButtonSize.m:
        return 20;
      case ButtonSize.lg:
        return 24;
      case ButtonSize.icon:
        return 20;
    }
  }

  TextStyle textStyle(BuildContext context) {
    final theme = Theme.of(context);
    switch (this) {
      case ButtonSize.sm:
        return theme.textTheme.bodySmall!;
      case ButtonSize.m:
        return theme.textTheme.labelLarge!;
      case ButtonSize.lg:
        return theme.textTheme.labelLarge!.copyWith(fontSize: 18);
      case ButtonSize.icon:
        return theme.textTheme.labelLarge!;
    }
  }

  EdgeInsetsGeometry padding(BuildContext context) {
    switch (this) {
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ButtonSize.m:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case ButtonSize.icon:
        return const EdgeInsets.all(8);
    }
  }
}

extension ButtonTypeExtension on ButtonType {
  Color background(ButtonColor color, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (this) {
      case ButtonType.primary:
        return isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
      case ButtonType.secondary:
        return isDark ? AppColors.darkSecondary : AppColors.lightSecondary;
      case ButtonType.outline:
        return AppColors.transparent;
      case ButtonType.ghost:
        return AppColors.transparent;
      case ButtonType.destructive:
        return isDark ? AppColors.darkDestructive : AppColors.lightDestructive;
    }
  }

  Color backgroundDisable(ButtonColor color, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.darkMuted : AppColors.lightMuted;
  }

  Color backgroundPressed(ButtonColor color, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (this) {
      case ButtonType.primary:
        return isDark
            ? AppColors.darkPrimary.withValues(alpha: 0.8)
            : AppColors.lightPrimary.withValues(alpha: 0.8);
      case ButtonType.secondary:
        return isDark
            ? AppColors.darkSecondary.withValues(alpha: 0.8)
            : AppColors.lightSecondary.withValues(alpha: 0.8);
      case ButtonType.outline:
        return isDark ? AppColors.darkAccent : AppColors.lightAccent;
      case ButtonType.ghost:
        return isDark ? AppColors.darkAccent : AppColors.lightAccent;
      case ButtonType.destructive:
        return isDark
            ? AppColors.darkDestructive.withValues(alpha: 0.8)
            : AppColors.lightDestructive.withValues(alpha: 0.8);
    }
  }

  Color foreground(ButtonColor color, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (this) {
      case ButtonType.primary:
        return isDark
            ? AppColors.darkPrimaryForeground
            : AppColors.lightPrimaryForeground;
      case ButtonType.secondary:
        return isDark
            ? AppColors.darkSecondaryForeground
            : AppColors.lightSecondaryForeground;
      case ButtonType.outline:
        return isDark ? AppColors.darkForeground : AppColors.lightForeground;
      case ButtonType.ghost:
        return isDark ? AppColors.darkForeground : AppColors.lightForeground;
      case ButtonType.destructive:
        return isDark
            ? AppColors.darkDestructiveForeground
            : AppColors.lightDestructiveForeground;
    }
  }

  Color foregroundDisable(ButtonColor color, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? AppColors.darkMutedForeground
        : AppColors.lightMutedForeground;
  }

  Color foregroundPressed(ButtonColor color, BuildContext context) {
    return foreground(color, context);
  }

  Color borderColor(ButtonColor color, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (this) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.destructive:
        return AppColors.transparent;
      case ButtonType.outline:
        return isDark ? AppColors.darkBorder : AppColors.lightBorder;
      case ButtonType.ghost:
        return AppColors.transparent;
    }
  }

  Color borderColorPressed(ButtonColor color, BuildContext context) {
    return borderColor(color, context);
  }

  Color disableBorderColor(ButtonColor color, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.darkMuted : AppColors.lightMuted;
  }
}

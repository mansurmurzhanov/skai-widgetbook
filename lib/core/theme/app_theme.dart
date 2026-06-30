import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skai_widgetbook/core/theme/progress_bar_colors.dart';

import 'app_colors.dart';
import 'app_typography.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.colorSchemeLight.primary,
    scaffoldBackgroundColor: AppColors.colorSchemeLight.surface,
    colorScheme: AppColors.colorSchemeLight,
    textTheme: AppTypography.textThemeLight,
    extensions: [
      ProgressBarColors(
        blue: AppColors.blue,
        blueTrack: AppColors.blueLightTrack,
        green: AppColors.green,
        greenTrack: AppColors.greenLightTrack,
      ),
    ],
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      foregroundColor: AppColors.colorSchemeLight.onSurface,
      surfaceTintColor: AppColors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: AppTypography.titleMedium.copyWith(
        color: AppColors.colorSchemeLight.onSurface,
      ),
      iconTheme: IconThemeData(
        color: AppColors.colorSchemeLight.onSurface,
        size: 24,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.colorSchemeLight.surfaceContainer,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.colorSchemeLight.outline, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.colorSchemeLight.primary,
        foregroundColor: AppColors.colorSchemeLight.onPrimary,
        disabledBackgroundColor: AppColors.colorSchemeLight.outline,
        disabledForegroundColor: AppColors.textDisabledLight,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTypography.button,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.colorSchemeLight.primary,
        disabledForegroundColor: AppColors.textDisabledLight,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: AppColors.colorSchemeLight.primary, width: 1.5),
        textStyle: AppTypography.button,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.colorSchemeLight.primary,
        disabledForegroundColor: AppColors.textDisabledLight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppTypography.button,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.colorSchemeLight.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textTertiaryLight,
      ),
      labelStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textSecondaryLight,
      ),
      errorStyle: AppTypography.caption.copyWith(
        color: AppColors.colorSchemeLight.error,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.colorSchemeLight.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.colorSchemeLight.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.colorSchemeLight.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.colorSchemeLight.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.colorSchemeLight.error,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.colorSchemeLight.outline),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.colorSchemeLight.surface,
      selectedItemColor: AppColors.colorSchemeLight.primary,
      unselectedItemColor: AppColors.textTertiaryLight,
      showUnselectedLabels: true,
      elevation: 8,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.colorSchemeLight.surface,
      surfaceTintColor: AppColors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.colorSchemeLight.surface,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: AppTypography.titleLarge.copyWith(
        color: AppColors.colorSchemeLight.onSurface,
      ),
      contentTextStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textSecondaryLight,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.colorSchemeLight.onSurface,
      contentTextStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.colorSchemeLight.surface,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.colorSchemeLight.outline,
      thickness: 1,
      space: 1,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.colorSchemeLight.primary;
        }
        return AppColors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.colorSchemeLight.onPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(color: AppColors.colorSchemeLight.outline, width: 2),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.colorSchemeLight.primary;
        }
        return AppColors.textTertiaryLight;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.colorSchemeLight.primary.withValues(alpha: 0.3);
        }
        return AppColors.colorSchemeLight.outline;
      }),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.colorSchemeLight.primary,
      linearTrackColor: AppColors.colorSchemeLight.outline,
      circularTrackColor: AppColors.colorSchemeLight.outline,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.colorSchemeLight.primary,
      foregroundColor: AppColors.colorSchemeLight.onPrimary,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.colorSchemeDark.primary,
    scaffoldBackgroundColor: AppColors.colorSchemeDark.surface,
    colorScheme: AppColors.colorSchemeDark,
    textTheme: AppTypography.textThemeDark,
    extensions: [
      ProgressBarColors(
        blue: AppColors.blue,
        blueTrack: AppColors.blueDarkTrack,
        green: AppColors.green,
        greenTrack: AppColors.greenDarkTrack,
      ),
    ],
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: true,
      backgroundColor: AppColors.colorSchemeDark.surface,
      foregroundColor: AppColors.colorSchemeDark.onSurface,
      surfaceTintColor: AppColors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: AppTypography.titleMedium.copyWith(
        color: AppColors.colorSchemeDark.onSurface,
      ),
      iconTheme: IconThemeData(
        color: AppColors.colorSchemeDark.onSurface,
        size: 24,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.colorSchemeDark.surfaceContainer,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.colorSchemeDark.outline, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.colorSchemeDark.primary,
        foregroundColor: AppColors.colorSchemeDark.onPrimary,
        disabledBackgroundColor: AppColors.colorSchemeDark.outline,
        disabledForegroundColor: AppColors.textDisabledDark,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTypography.button,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.colorSchemeDark.primary,
        disabledForegroundColor: AppColors.textDisabledDark,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: AppColors.colorSchemeDark.primary, width: 1.5),
        textStyle: AppTypography.button,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.colorSchemeDark.primary,
        disabledForegroundColor: AppColors.textDisabledDark,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppTypography.button,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.colorSchemeDark.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textTertiaryDark,
      ),
      labelStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textSecondaryDark,
      ),
      errorStyle: AppTypography.caption.copyWith(
        color: AppColors.colorSchemeDark.error,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.colorSchemeDark.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.colorSchemeDark.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.colorSchemeDark.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.colorSchemeDark.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.colorSchemeDark.error,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.colorSchemeDark.outline),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.colorSchemeDark.surface,
      selectedItemColor: AppColors.colorSchemeDark.primary,
      unselectedItemColor: AppColors.textTertiaryDark,
      showUnselectedLabels: true,
      elevation: 8,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.colorSchemeDark.surface,
      surfaceTintColor: AppColors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.colorSchemeDark.surface,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: AppTypography.titleLarge.copyWith(
        color: AppColors.colorSchemeDark.onSurface,
      ),
      contentTextStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textSecondaryDark,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.colorSchemeDark.surfaceContainer,
      contentTextStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.colorSchemeDark.onSurface,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.colorSchemeDark.outline,
      thickness: 1,
      space: 1,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.colorSchemeDark.primary;
        }
        return AppColors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.colorSchemeDark.onPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(color: AppColors.colorSchemeDark.outline, width: 2),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.colorSchemeDark.onPrimary;
        }
        return AppColors.textTertiaryDark;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.colorSchemeDark.primary;
        }
        return AppColors.colorSchemeDark.outline;
      }),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.colorSchemeDark.primary,
      linearTrackColor: AppColors.colorSchemeDark.outline,
      circularTrackColor: AppColors.colorSchemeDark.outline,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.colorSchemeDark.primary,
      foregroundColor: AppColors.colorSchemeDark.onPrimary,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}

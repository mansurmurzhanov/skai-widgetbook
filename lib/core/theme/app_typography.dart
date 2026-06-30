import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTypography {
  static TextStyle get headlineLarge => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.25,
      letterSpacing: -0.5,
    ),
  );

  static TextStyle get headlineMedium => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.29,
      letterSpacing: -0.25,
    ),
  );

  static TextStyle get headlineSmall => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 1.33,
    ),
  );

  static TextStyle get titleLarge => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1.4,
    ),
  );

  static TextStyle get titleMedium => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.44,
    ),
  );

  static TextStyle get titleSmall => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  );

  static TextStyle get bodyLarge => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  );

  static TextStyle get bodyMedium => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.43,
    ),
  );

  static TextStyle get bodySmall => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.33,
    ),
  );

  static TextStyle get labelLarge => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.43,
      letterSpacing: 0.1,
    ),
  );

  static TextStyle get labelMedium => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.33,
      letterSpacing: 0.5,
    ),
  );

  static TextStyle get labelSmall => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      height: 1.45,
      letterSpacing: 0.5,
    ),
  );

  static TextStyle get button => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.43,
      letterSpacing: 0.25,
    ),
  );

  static TextStyle get caption => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.33,
      letterSpacing: 0.4,
    ),
  );

  static TextStyle get overline => GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.6,
      letterSpacing: 1.5,
    ),
  );

  static TextTheme get textThemeLight => TextTheme(
    displayLarge: headlineLarge.copyWith(color: AppColors.textPrimaryLight),
    displayMedium: headlineMedium.copyWith(color: AppColors.textPrimaryLight),
    displaySmall: headlineSmall.copyWith(color: AppColors.textPrimaryLight),
    headlineLarge: headlineLarge.copyWith(color: AppColors.textPrimaryLight),
    headlineMedium: headlineMedium.copyWith(color: AppColors.textPrimaryLight),
    headlineSmall: headlineSmall.copyWith(color: AppColors.textPrimaryLight),
    titleLarge: titleLarge.copyWith(color: AppColors.textPrimaryLight),
    titleMedium: titleMedium.copyWith(color: AppColors.textPrimaryLight),
    titleSmall: titleSmall.copyWith(color: AppColors.textPrimaryLight),
    bodyLarge: bodyLarge.copyWith(color: AppColors.textPrimaryLight),
    bodyMedium: bodyMedium.copyWith(color: AppColors.textSecondaryLight),
    bodySmall: bodySmall.copyWith(color: AppColors.textTertiaryLight),
    labelLarge: labelLarge.copyWith(color: AppColors.textPrimaryLight),
    labelMedium: labelMedium.copyWith(color: AppColors.textSecondaryLight),
    labelSmall: labelSmall.copyWith(color: AppColors.textTertiaryLight),
  );

  static TextTheme get textThemeDark => TextTheme(
    displayLarge: headlineLarge.copyWith(color: AppColors.textPrimaryDark),
    displayMedium: headlineMedium.copyWith(color: AppColors.textPrimaryDark),
    displaySmall: headlineSmall.copyWith(color: AppColors.textPrimaryDark),
    headlineLarge: headlineLarge.copyWith(color: AppColors.textPrimaryDark),
    headlineMedium: headlineMedium.copyWith(color: AppColors.textPrimaryDark),
    headlineSmall: headlineSmall.copyWith(color: AppColors.textPrimaryDark),
    titleLarge: titleLarge.copyWith(color: AppColors.textPrimaryDark),
    titleMedium: titleMedium.copyWith(color: AppColors.textPrimaryDark),
    titleSmall: titleSmall.copyWith(color: AppColors.textPrimaryDark),
    bodyLarge: bodyLarge.copyWith(color: AppColors.textPrimaryDark),
    bodyMedium: bodyMedium.copyWith(color: AppColors.textSecondaryDark),
    bodySmall: bodySmall.copyWith(color: AppColors.textTertiaryDark),
    labelLarge: labelLarge.copyWith(color: AppColors.textPrimaryDark),
    labelMedium: labelMedium.copyWith(color: AppColors.textSecondaryDark),
    labelSmall: labelSmall.copyWith(color: AppColors.textTertiaryDark),
  );
}

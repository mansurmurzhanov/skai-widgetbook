import 'package:flutter/material.dart';

abstract class AppColors {
  static const colorSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFA88C6D),
    onPrimary: Color(0xFF17335D),
    secondary: Color(0xFF000000),
    onSecondary: Color(0xffFBFBFD),
    secondaryContainer: Color(0xffffffff),
    error: Color.fromARGB(255, 16, 9, 9),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFF8FAFB),
    inverseSurface: Color(0xffE8EBEF),
    onSurface: Color(0xFF000000),
    onSurfaceVariant: Color(0xff17335D),
    outline: Color(0xffEDEFF6),
    outlineVariant: Color(0xff434343),
    surfaceContainer: Color(0xffFFFFFF),
    surfaceContainerHigh: Color(0xffEDEFF6),
    scrim: Color(0xff17335D),
    onSecondaryContainer: Color(0xffffffff),
    surfaceContainerLowest: Color(0xffffffff),
    onPrimaryContainer: Color(0xffFBFBFD),
  );

  static const colorSchemeDark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff4B90F6),
    onPrimary: Color(0xFF4B90F6),
    secondary: Color(0xFFFFFFFF),
    onSecondary: Color(0xff1B2435),
    secondaryContainer: Color(0xff16202C),
    error: Color(0xFFFF4D4F),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFF141A22),
    inverseSurface: Color(0xff2E3745),
    onSurface: Color(0xFFFFFFFF),
    onSurfaceVariant: Color(0xffffffff),
    outline: Color(0xff363f4a),
    outlineVariant: Color(0xffffffff),
    surfaceContainer: Color(0xff161D2A),
    surfaceContainerHigh: Color(0xff222B3A),
    scrim: Color(0xff233C5F),
    onSecondaryContainer: Color(0xff131B26),
    surfaceContainerLowest: Color(0xff2c3139),
    onPrimaryContainer: Color(0xff2D3641),
  );

  static const Color transparent = Colors.transparent;

  static const Color primary = Color(0xFFA88C6D);
  static const Color primaryLight = Color(0xFFB89D7D);
  static const Color primaryDark = Color(0xFF8F7555);

  static const Color secondary = Color(0xFF17335D);
  static const Color secondaryAlternative = Color(0xFF234C83);
  static const Color secondarySubtle = Color(0xFF244C82);
  static const Color secondaryLight = Color(0xFF2E476E);
  static const Color secondaryDark = Color(0xFF0F1F3D);

  static const Color accent = Color(0xFF4B90F6);
  static const Color accentLight = Color(0xFF6BA4F8);
  static const Color accentDark = Color(0xFF3A7CD4);

  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color dividerLight = Color(0xFFE2E8F0);

  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color cardDark = Color(0xFF334155);
  static const Color dividerDark = Color(0xFF475569);

  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF475569);
  static const Color textTertiaryLight = Color(0xFF94A3B8);
  static const Color textDisabledLight = Color(0xFFCBD5E1);

  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFFCBD5E1);
  static const Color textTertiaryDark = Color(0xFF94A3B8);
  static const Color textDisabledDark = Color(0xFF64748B);

  static const Color success = Color(0xFF10B981);
  static const Color successMedium = Color(0xFF00D67A);
  static const Color successStrong = Color(0xFF00FF65);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color successLightAlternative = Color(0xFFC8F5DE);
  static const Color successDark = Color(0xFF059669);
  static const Color successDarkDeep = Color(0xFF0E7C57);

  static const Color successDarkStrong = Color(0xFF04573E);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color warningOrange = Color(0xFFFB892C);
  static const Color warningDark = Color(0xFFD4A017);
  static const Color warningOrangeYellow = Color(0xffFFEA2F);
  static const Color warningDarkDeep = Color(0xFFD97706);

  static const Color error = Color(0xFFEF4444);
  static const Color errorSubtle = Colors.redAccent;
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color errorDark = Color(0xFFDC2626);
  static const Color danger = error;

  static const Color lightBlack = Colors.black26;
  static const Color mediumBlack = Colors.black54;
  static const Color strongBlack = Colors.black87;

  static const Color info = Color(0xFF3B82F6);
  static const Color infoSubtle = Color(0xff80B1ED);
  static const Color infoAccent = Color(0xFF3E8BFF);
  static const Color infoLight = Color(0xFFDBEAFE);
  static const Color infoDark = Color(0xFF2563EB);

  static const Color factPositiveBackground = successLight;
  static const Color factWarningBackground = warningLight;
  static const Color factNegativeBackground = errorLight;

  static const Color blue = Color(0xFF3E8BFF);
  static const Color blueLightTrack = Color(0xFFD0E2F8);
  static const Color blueDarkTrack = Color(0xFF244C82);
  static const Color green = Color(0xFF00D67A);
  static const Color greenLightTrack = Color(0xFFC8F5DE);
  static const Color greenDarkTrack = Color(0xFF0E7C57);

  static const Color lightPrimary = secondary;
  static const Color lightPrimaryForeground = Colors.white;
  static const Color lightSecondary = Color(0xFFF8FAFB);
  static const Color lightSecondaryForeground = secondary;
  static const Color lightDestructive = error;
  static const Color lightDestructiveForeground = Colors.white;
  static const Color lightMuted = Color(0xFFEDEFF6);
  static const Color lightMutedForeground = Color(0xFF94A3B8);
  static const Color lightForeground = Color(0xFF000000);
  static const Color lightBorder = Color(0xFFEDEFF6);
  static const Color lightAccent = primary;
  static const Color lightRing = primary;
  static const Color lightSkyBlue = Color(0xFFD0E2F8);
  static const Color lightCloudGrey = Color(0xFFE8E8E8);

  static const Color darkPrimary = accent;
  static const Color darkPrimaryForeground = Colors.white;
  static const Color darkSecondary = Color(0xFF16202C);
  static const Color darkSecondaryForeground = textPrimaryDark;
  static const Color darkDestructive = Color(0xFFFF4D4F);
  static const Color darkDestructiveForeground = Colors.white;
  static const Color darkMuted = Color(0xFF363f4a);
  static const Color darkMutedForeground = Color(0xFF94A3B8);
  static const Color darkForeground = Color(0xFFE6E6E6);
  static const Color darkBorder = Color(0xFF363f4a);
  static const Color darkAccent = accent;
  static const Color darkRing = accent;

  static const LinearGradient pageGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0D1E35), Color(0xFF080F1A), Color(0xFF0A1628)],
    stops: [0.0, 0.45, 1.0],
  );

  static const LinearGradient pageGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF0F4F8), Color(0xFFF8FAFB), Color(0xFFEEF2F6)],
    stops: [0.0, 0.45, 1.0],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color fileExcelGreen = Color(0xFF217346);
  static const Color filePdfRed = Color(0xFFE53935);
  static const Color fileImageBlue = Color(0xFF1E88E5);
  static const Color fileDocBlueDark = Color(0xFF1565C0);

  static const List<Color> chartSegmentColors = [
    Color(0xFF2196F3),
    Color(0xFF4CAF50),
    Color(0xFFFF9800),
    Color(0xFF9C27B0),
    Color(0xFFF44336),
    Color(0xFF00BCD4),
    Color(0xFFFFEB3B),
    Color(0xFF795548),
    Color(0xFF607D8B),
    Color(0xFFE91E63),
    Color(0xFF3F51B5),
    Color(0xFF009688),
    Color(0xFFFF5722),
    Color(0xFF673AB7),
    Color(0xFF8BC34A),
    Color(0xFFCDDC39),
    Color(0xFF03A9F4),
    Color(0xFFFF4081),
    Color(0xFF7C4DFF),
    Color(0xFF00E676),
  ];

  static List<BoxShadow> get shadowSmall => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> get shadowAccent => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> get shadowMedium => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get shadowLarge => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> get shadowStrong => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.16),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];
}

class AppColor {
  static const AppColor instance = AppColor._();
  const AppColor._();

  Color get factPositiveBackground => AppColors.factPositiveBackground;
  Color get factWarningBackground => AppColors.factWarningBackground;
  Color get factNegativeBackground => AppColors.factNegativeBackground;
  Color get success => AppColors.success;
  Color get danger => AppColors.danger;
}

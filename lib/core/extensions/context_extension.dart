import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skai_widgetbook/core/theme/progress_bar_colors.dart';
import 'package:skai_widgetbook/l10n/generated/l10n.dart';

class AppIcons {
  final BuildContext context;

  AppIcons(this.context);

  SvgIcon get up => SvgIcon('assets/icons/up.svg', context: context);
  SvgIcon get down => SvgIcon('assets/icons/down.svg', context: context);
}

class SvgIcon {
  final String path;
  final BuildContext context;

  SvgIcon(this.path, {required this.context});

  SvgPicture svg({double? width, double? height, Color? color}) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ProgressBarColors get progressBarColors =>
      theme.extension<ProgressBarColors>()!;
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  Localization get l10n => Localization.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  Brightness get platformBrightness => mediaQuery.platformBrightness;

  double get topPadding => padding.top;
  double get bottomPadding => padding.bottom;
  double get keyboardHeight => viewInsets.bottom;
  bool get isKeyboardVisible => keyboardHeight > 0;

  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;
  bool get isDesktop => screenWidth >= 1200;

  Orientation get orientation => mediaQuery.orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  void unFocus() => FocusScope.of(this).unfocus();
  bool get hasFocus => FocusScope.of(this).hasFocus;

  AppIcons get icons => AppIcons(this);
}

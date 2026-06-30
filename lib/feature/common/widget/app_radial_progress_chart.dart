import 'package:flutter/material.dart';
import 'package:skai_data_mobile/core/extensions/context_extension.dart';
import 'package:skai_data_mobile/core/theme/app_colors.dart';
import 'dart:math' as math;
import 'dart:ui';

import 'package:skai_data_mobile/feature/common/presentation/widget/radial_progress_painter.dart';

class AppRadialProgressChart extends StatelessWidget {
  final double progress;

  final double size;
  final double strokeWidth;

  final Color progressColor;
  final Color trackColor;

  final String? centerText;
  final int fractionDigits;

  final TextStyle? centerTextStyle;
  final String label;
  final TextStyle? labelStyle;

  final Duration animationDuration;
  final Curve animationCurve;

  final double startAngle;

  final StrokeCap strokeCap;

  final bool showGlow;
  final double glowSigma;

  final VoidCallback? onTap;
  final String? infoTitle;
  final String? infoDescription;

  const AppRadialProgressChart({
    super.key,
    required this.progress,
    required this.label,
    this.size = 220,
    this.strokeWidth = 10,
    this.progressColor = AppColors.infoAccent,
    this.trackColor = AppColors.secondaryAlternative,
    this.centerText,
    this.fractionDigits = 0,
    this.centerTextStyle,
    this.labelStyle,
    this.animationDuration = const Duration(milliseconds: 900),
    this.animationCurve = Curves.easeOutCubic,
    this.startAngle = -math.pi / 2,
    this.strokeCap = StrokeCap.round,
    this.showGlow = false,
    this.glowSigma = 8,
    this.onTap,
    this.infoTitle,
    this.infoDescription,
  });

  void _showInfoDropdown(BuildContext context, TapDownDetails details) {
    final title = infoTitle ?? label;
    final description = infoDescription ?? context.l10n.descriptionAbsent;
    final tap = details.globalPosition;
    final screenSize = MediaQuery.sizeOf(context);
    final popupWidth = screenSize.width * 0.78;
    final isDark = context.theme.brightness == Brightness.dark;
    final colorScheme = context.theme.colorScheme;

    showMenu<void>(
      context: context,
      color: AppColors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      position: RelativeRect.fromLTRB(
        tap.dx.clamp(12, screenSize.width - 12),
        tap.dy + 8,
        12,
        0,
      ),
      items: [
        PopupMenuItem<void>(
          enabled: false,
          padding: EdgeInsets.zero,
          child: Container(
            width: popupWidth,
            constraints: const BoxConstraints(maxWidth: 320),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isDark
                          ? [
                              AppColors.darkPrimary.withValues(alpha: 0.28),
                              AppColors.lightPrimary.withValues(alpha: 0.34),
                            ]
                          : [
                              colorScheme.surfaceContainer.withValues(
                                alpha: 0.85,
                              ),
                              colorScheme.surface.withValues(alpha: 0.92),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isDark
                          ? AppColors.darkPrimaryForeground.withValues(
                              alpha: 0.26,
                            )
                          : colorScheme.primary.withValues(alpha: 0.4),
                    ),
                    boxShadow: AppColors.shadowStrong,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: colorScheme.onSurface.withValues(alpha: 0.92),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: colorScheme.onSurface.withValues(alpha: 0.88),
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final safeProgress = progress.clamp(0.0, 1.0).toDouble();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: safeProgress),
          duration: animationDuration,
          curve: animationCurve,
          builder: (context, animatedProgress, _) {
            final text =
                centerText ??
                '${(animatedProgress * 100).toStringAsFixed(fractionDigits)}%';

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: size,
                  height: size,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: Size.square(size),
                        painter: RadialProgressPainter(
                          progress: animatedProgress,
                          strokeWidth: strokeWidth,
                          progressColor: progressColor,
                          trackColor: trackColor,
                          startAngle: startAngle,
                          strokeCap: strokeCap,
                          showGlow: showGlow,
                          glowSigma: glowSigma,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.all(strokeWidth + 12),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            style:
                                centerTextStyle ??
                                context.theme.textTheme.labelMedium?.copyWith(
                                  color: progressColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTapDown: (details) {
                    if (onTap != null) {
                      onTap!();
                      return;
                    }
                    _showInfoDropdown(context, details);
                  },
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              labelStyle ??
                              context.theme.textTheme.labelSmall?.copyWith(
                                color: context.theme.colorScheme.onSurface
                                    .withValues(alpha: 0.6),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        Icons.info_outline,
                        size: 16,
                        color: progressColor.withValues(alpha: 0.6),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

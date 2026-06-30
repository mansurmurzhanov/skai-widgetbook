import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:skai_widgetbook/core/theme/app_colors.dart';

class AppGlassCard extends StatelessWidget {
  final double borderRadius;
  final double sigmaXBlur;
  final double sigmaYBlur;
  final EdgeInsets padding;
  final Widget child;
  final double? width;
  final double? height;
  final LinearGradient? linearGradient;
  final LinearGradient? borderGradient;
  final VoidCallback? onTap;
  final double borderWidth;
  final bool showTopHighlight;
  final bool isCircular;

  const AppGlassCard({
    super.key,
    this.borderRadius = 16,
    this.sigmaXBlur = 24,
    this.sigmaYBlur = 24,
    this.padding = const EdgeInsets.all(16),
    this.width,
    this.height,
    this.linearGradient,
    this.borderGradient,
    this.borderWidth = 1.5,
    this.showTopHighlight = true,
    this.isCircular = false,
    required this.child,
    this.onTap,
  });

  LinearGradient _fillGradient(bool isDark) =>
      linearGradient ??
      (isDark
          ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 0.35, 1.0],
              colors: [
                AppColors.surfaceLight.withValues(alpha: 0.14),
                AppColors.surfaceLight.withValues(alpha: 0.07),
                AppColors.surfaceLight.withValues(alpha: 0.03),
              ],
            )
          : LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 0.45, 1.0],
              colors: [
                AppColors.surfaceLight.withValues(alpha: 0.82),
                AppColors.surfaceLight.withValues(alpha: 0.62),
                AppColors.surfaceLight.withValues(alpha: 0.42),
              ],
            ));

  LinearGradient _edgeGradient(bool isDark) =>
      borderGradient ??
      (isDark
          ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 0.25, 0.65, 1.0],
              colors: [
                AppColors.surfaceLight.withValues(alpha: 0.3),
                AppColors.surfaceLight.withValues(alpha: 0.65),
                AppColors.surfaceLight.withValues(alpha: 0.3),
                AppColors.surfaceLight.withValues(alpha: 0.65),
              ],
            )
          : LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 0.25, 0.65, 1.0],
              colors: [
                AppColors.primary.withValues(alpha: 0.3),
                AppColors.primary.withValues(alpha: 0.65),
                AppColors.primary.withValues(alpha: 0.3),
                AppColors.primary.withValues(alpha: 0.65),
              ],
            ));

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final blur = (sigmaXBlur + sigmaYBlur) / 2;

    if (width != null && height != null) {
      final effectiveRadius = isCircular
          ? (width! < height! ? width! : height!) / 2
          : borderRadius;
      final glassChild = GlassmorphicContainer(
        width: width!,
        height: height!,
        borderRadius: effectiveRadius,
        blur: blur,
        border: borderWidth,
        linearGradient: _fillGradient(isDark),
        borderGradient: _edgeGradient(isDark),
        padding: padding,
        child: child,
      );

      final wrappedChild = isCircular
          ? ClipOval(child: glassChild)
          : glassChild;
      if (onTap == null) {
        return Material(color: AppColors.transparent, child: wrappedChild);
      }
      return Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: isCircular ? const CircleBorder() : null,
          borderRadius: isCircular ? null : BorderRadius.circular(borderRadius),
          child: wrappedChild,
        ),
      );
    }

    final cardContent = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaXBlur, sigmaY: sigmaYBlur),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircular ? null : BorderRadius.circular(borderRadius),
          gradient: _fillGradient(isDark),
        ),
        child: Stack(
          children: [
            Padding(padding: padding, child: child),
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: isCircular
                      ? _GlassCircleBorderPainter(
                          gradient: _edgeGradient(isDark),
                          borderWidth: borderWidth,
                          isDark: isDark,
                        )
                      : _GlassBorderPainter(
                          borderRadius: borderRadius,
                          gradient: _edgeGradient(isDark),
                          borderWidth: borderWidth,
                          isDark: isDark,
                        ),
                ),
              ),
            ),
            if (showTopHighlight && !isCircular)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  child: _TopEdgeHighlight(
                    borderRadius: borderRadius,
                    isDark: isDark,
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    final shapedChild = ClipRRect(
      borderRadius: isCircular
          ? BorderRadius.zero
          : BorderRadius.circular(borderRadius),
      child: cardContent,
    );
    if (onTap == null) {
      return SizedBox(child: shapedChild);
    }
    return InkWell(
      onTap: onTap,
      customBorder: isCircular ? const CircleBorder() : null,
      borderRadius: isCircular ? null : BorderRadius.circular(borderRadius),
      child: shapedChild,
    );
  }
}

class _TopEdgeHighlight extends StatelessWidget {
  const _TopEdgeHighlight({required this.borderRadius, required this.isDark});

  final double borderRadius;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
      child: Container(
        height: 1.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.0, 0.3, 0.7, 1.0],
            colors: [
              AppColors.surfaceLight.withValues(alpha: 0.0),
              (isDark ? AppColors.surfaceLight : AppColors.primary).withValues(
                alpha: 0.4,
              ),
              (isDark ? AppColors.surfaceLight : AppColors.primary).withValues(
                alpha: 0.4,
              ),
              AppColors.surfaceLight.withValues(alpha: 0.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlassBorderPainter extends CustomPainter {
  const _GlassBorderPainter({
    required this.borderRadius,
    required this.gradient,
    required this.borderWidth,
    required this.isDark,
  });

  final double borderRadius;
  final LinearGradient gradient;
  final double borderWidth;
  final bool isDark;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final outerRRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );
    canvas.drawRRect(
      outerRRect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.lightForeground.withValues(alpha: isDark ? 0.10 : 0.06),
            AppColors.lightForeground.withValues(alpha: isDark ? 0.28 : 0.14),
          ],
        ).createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5,
    );

    final inset = borderWidth * 0.5;
    final innerRect = rect.deflate(inset);
    final innerRRect = RRect.fromRectAndRadius(
      innerRect,
      Radius.circular((borderRadius - inset).clamp(0, borderRadius)),
    );
    canvas.drawRRect(
      innerRRect,
      Paint()
        ..shader = gradient.createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth,
    );
  }

  @override
  bool shouldRepaint(covariant _GlassBorderPainter old) =>
      old.borderRadius != borderRadius ||
      old.gradient != gradient ||
      old.borderWidth != borderWidth ||
      old.isDark != isDark;
}

class _GlassCircleBorderPainter extends CustomPainter {
  const _GlassCircleBorderPainter({
    required this.gradient,
    required this.borderWidth,
    required this.isDark,
  });

  final LinearGradient gradient;
  final double borderWidth;
  final bool isDark;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final center = rect.center;
    final radius = rect.shortestSide / 2;

    canvas.drawCircle(
      center,
      radius - 0.25,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.lightForeground.withValues(alpha: isDark ? 0.10 : 0.06),
            AppColors.lightForeground.withValues(alpha: isDark ? 0.28 : 0.14),
          ],
        ).createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5,
    );

    final inset = borderWidth * 0.5;
    canvas.drawCircle(
      center,
      (radius - inset).clamp(0, radius),
      Paint()
        ..shader = gradient.createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth,
    );
  }

  @override
  bool shouldRepaint(covariant _GlassCircleBorderPainter old) =>
      old.gradient != gradient ||
      old.borderWidth != borderWidth ||
      old.isDark != isDark;
}

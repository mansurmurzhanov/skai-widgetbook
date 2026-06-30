import 'package:flutter/material.dart';
import 'dart:math' as math;

class RadialProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color progressColor;
  final Color trackColor;
  final double startAngle;
  final StrokeCap strokeCap;
  final bool showGlow;
  final double glowSigma;

  const RadialProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.progressColor,
    required this.trackColor,
    required this.startAngle,
    required this.strokeCap,
    required this.showGlow,
    required this.glowSigma,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final shortestSize = math.min(size.width, size.height);
    final radius = (shortestSize - strokeWidth) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: center, radius: radius);

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawArc(rect, startAngle, math.pi * 2, false, trackPaint);

    if (progress<=0) return;
    if (showGlow) {
      final glowPaint = Paint()
        ..color = progressColor.withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowSigma);

      canvas.drawArc(
        rect,
        startAngle,
        math.pi * 2 * progress,
        false,
        glowPaint,
      );

    }

    canvas.drawArc(
      rect,
      startAngle,
      math.pi * 2 * progress,
      false,
      progressPaint,
    );

  }

  @override
  bool shouldRepaint(covariant RadialProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.startAngle != startAngle ||
        oldDelegate.strokeCap != strokeCap ||
        oldDelegate.showGlow != showGlow ||
        oldDelegate.glowSigma != glowSigma;
  }
}

import 'package:flutter/material.dart';

class ProgressBarColors extends ThemeExtension<ProgressBarColors> {
  final Color blue;
  final Color blueTrack;
  final Color green;
  final Color greenTrack;

  const ProgressBarColors({
    required this.blue,
    required this.blueTrack,
    required this.green,
    required this.greenTrack,
  });

  @override
  ProgressBarColors copyWith({
    Color? blue,
    Color? blueTrack,
    Color? green,
    Color? greenTrack,
  }) {
    return ProgressBarColors(
      blue: blue ?? this.blue,
      blueTrack: blueTrack ?? this.blueTrack,
      green: green ?? this.green,
      greenTrack: greenTrack ?? this.greenTrack,
    );
  }

  @override
  ProgressBarColors lerp(covariant ProgressBarColors? other, double t) {
    if (other == null) return this;
    return ProgressBarColors(
      blue: Color.lerp(blue, other.blue, t) ?? blue,
      blueTrack: Color.lerp(blueTrack, other.blueTrack, t) ?? blueTrack,
      green: Color.lerp(green, other.green, t) ?? green,
      greenTrack: Color.lerp(greenTrack, other.greenTrack, t) ?? greenTrack,
    );
  }
}

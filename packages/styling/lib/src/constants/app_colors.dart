import 'package:flutter/material.dart';

/// Central color definitions for the Theme
class AppColors {
  static const Color primary = Color(0xFF00FFFF); // Cyan
  static const Color accent = Color(0xFFFF00FF); // Magenta
  static const Color backgroundLight = Color(0xFFE0E7FF);
  static const Color backgroundDark = Color(0xFF0A0A1A);
  static const Color danger = Color(0xFFFF3B30); // Rot
  static const Color warning = Color(0xFFFF9500); // Orange
  static const Color text = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);

  // Glow colors as getter with opacity
  static Color get inputFieldGlow =>
      primary.withValues(alpha: 0.6); // 60% Opacity Cyan
  static Color get accentGlow =>
      accent.withValues(alpha: 0.6); // 60% Opacity Magenta
  static Color get dangerGlow =>
      danger.withValues(alpha: 0.6); // 60% Opacity Rot
  static Color get warningGlow =>
      warning.withValues(alpha: 0.6); // 60% Opacity Orange
}

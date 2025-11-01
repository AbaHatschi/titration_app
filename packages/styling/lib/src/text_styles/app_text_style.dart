import 'package:flutter/material.dart';

import '../font_styles/app_font_family.dart';
import '../font_styles/app_font_size.dart';
import '../font_styles/app_font_weight.dart';

TextStyle getTitleStyle({
  Color? color,
  double? letterSpacing,
  FontWeight? weight,
  double? fontSize,
}) {
  return TextStyle(
    fontFamily: AppFontFamily.roboto,
    fontWeight: weight ?? AppFontWeight.bold,
    fontSize: fontSize ?? AppFontSize.title,
    color: color,
    letterSpacing: letterSpacing,
  );
}

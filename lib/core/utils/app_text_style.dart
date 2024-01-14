import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iegy/core/utils/app_colors.dart';

TextStyle _textStyle(
    {required Color color,
    required double fontSize,
    required FontWeight fontWeight}) {
  return GoogleFonts.cairo(
      color: color, fontSize: fontSize, fontWeight: fontWeight);
}

TextStyle boldStyle(
        {Color color = AppColors.brown,
        double fontSize = 24}) =>
    _textStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.bold);

TextStyle mediumStyle(
    {Color color = AppColors.darkBlue,
      double fontSize = 14}) =>
    _textStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w500);

TextStyle regularStyle(
    {Color color = AppColors.grey,
      double fontSize = 14}) =>
    _textStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.normal);

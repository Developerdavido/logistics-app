import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
    this.data, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.color,
    this.letterSpacing,
  });

  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final String data;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: fontFamily != null
          ? GoogleFonts.getFont(
              fontFamily!,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing,
            )
          : GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              letterSpacing: letterSpacing,
            ),
    );
  }
}

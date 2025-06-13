

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logistics_app/core/res/colours.dart';

class Utils {
  static showSnackBar(BuildContext context, {String? message}) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
      content: caption(text: message, color: Colors.white),
      padding: const EdgeInsets.all(12),
      backgroundColor: Colors.white,
    )
    );
  }

  static formatNumber({num? value}) => NumberFormat("#,##0.00##").format(value);

  static caption(
      {String? text,
        double? fontSize,
        FontWeight? fontWeight,
        Color? color,
        TextAlign? align}) {
    return Text(
      text ?? "",
      style: GoogleFonts.roboto(
          fontSize: fontSize ?? 12,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colours.blackColor),
      textAlign: align,
    );
  }
}

class AppColors {

}
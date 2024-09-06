import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({super.key});

  @override
  Widget build(BuildContext context) {
    final shadow = BoxShadow(
      color: Colors.black.withOpacity(.15),
      blurRadius: 7,
      offset: const Offset(0, 1),
    );
    return PinCodeTextField(
      appContext: context,
      length: 5,
      keyboardType: TextInputType.number,
      autoFocus: true,
      textStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colours.primary,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 48,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: Colors.white,
        selectedColor: Colors.white,
        inactiveColor: Colors.white,
        activeBoxShadow: [shadow],
        disabledColor: Colors.white,
        inActiveBoxShadow: [shadow],
      ),
      enableActiveFill: true,
      onCompleted: (v) {
        debugPrint("OTP input Completed with $v");
      },
      beforeTextPaste: (text) => true,
    );
  }
}

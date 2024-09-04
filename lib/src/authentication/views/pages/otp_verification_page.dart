import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/extensions/context_extensions.dart';
import 'package:logistics_app/src/authentication/views/widgets/otp_fields.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  static const path = '/otp-verification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Gap(context.height * .05),
          const DefaultText(
            'Rider Verification',
            fontFamily: 'Mulish',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          const Gap(20),
          const DefaultText(
            'Input the four digit verification code sent to your mail',
            fontSize: 12,
            color: Color(0xFF909090),
          ),
          const Gap(20),
          const OtpFields(),
        ],
      ),
    );
  }
}

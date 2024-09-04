import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/extensions/context_extensions.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/core/res/media.dart';
import 'package:logistics_app/src/authentication/views/pages/otp_verification_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const path = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(Media.onBoardingBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colours.primary.withOpacity(.4),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Column(
          children: [
            Gap(context.height * .1),
            const DefaultText(
              'Pick & Drop',
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
            const DefaultText(
              'Delivery made easy',
              color: Colors.white,
              fontSize: 15,
            ),
            const Spacer(flex: 6),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(vertical: 25),
              ),
              onPressed: () {
                Navigator.pushNamed(context, OtpVerificationPage.path);
              },
              child: const DefaultText(
                'Get Started',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: 'Terms of Service',
                style: GoogleFonts.poppins(
                  color: Colours.primary,
                  fontSize: 12,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // TODO(Implementation): Push to Terms of Service page
                  },
                children: [
                  const TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO(Implementation): Push to Privacy Policy page
                      },
                  ),
                ],
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

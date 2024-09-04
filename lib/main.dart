import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/src/authentication/views/pages/otp_verification_page.dart';
import 'package:logistics_app/src/onboarding/views/pages/onboarding_page.dart';
import 'package:logistics_app/src/splash/views/pages/splash_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colours.primary,
        scaffoldBackgroundColor: Colors.white,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colours.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData().textTheme),
      ),
      routes: {
        SplashPage.path: (_) => const SplashPage(),
        OnboardingPage.path: (_) => const OnboardingPage(),
        OtpVerificationPage.path: (_) => const OtpVerificationPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/src/authentication/views/pages/otp_verification_page.dart';
import 'package:logistics_app/src/authentication/views/pages/sign_in_page.dart';
import 'package:logistics_app/src/authentication/views/pages/sign_up_page.dart';
import 'package:logistics_app/src/home/views/pages/trip_overview_page.dart';
import 'package:logistics_app/src/onboarding/views/pages/onboarding_page.dart';
import 'package:logistics_app/src/splash/views/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/helpers/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  CacheHelper.instance.init(prefs);
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
            minimumSize: const Size(double.infinity, 50),
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData().textTheme),
      ),
      routes: {
        SplashPage.path: (_) => const SplashPage(),
        OnboardingPage.path: (_) => const OnboardingPage(),
        OtpVerificationPage.path: (_) => const OtpVerificationPage(),
        SignInPage.path: (_) => const SignInPage(),
        SignUpPage.path: (_) => const SignUpPage(),
        TripOverviewPage.path: (_) => const TripOverviewPage(),
      },
    );
  }
}

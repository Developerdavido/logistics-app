import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/src/authentication/views/pages/otp_verification_page.dart';
import 'package:logistics_app/src/home/views/pages/complete_delivery_page.dart';
import 'package:logistics_app/src/home/views/pages/confirm_pickup_page.dart';
import 'package:logistics_app/src/home/views/pages/start_trip_page.dart';
import 'package:logistics_app/src/home/views/pages/trip_details_page.dart';
import 'package:logistics_app/src/home/views/pages/trip_overview_page.dart';
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
        TripOverviewPage.path: (_) => const TripOverviewPage(),
        StartTripPage.path:(_) => const StartTripPage(),
        ConfirmPickupPage.path: (_) => const ConfirmPickupPage(),
        CompleteDeliveryPage.path: (_) => const CompleteDeliveryPage(),
        TripDetailsPage.path: (_) => const TripDetailsPage()
      },
    );
  }
}

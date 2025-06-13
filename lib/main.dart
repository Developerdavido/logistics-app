import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_app/core/common/locator.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/providers/address_provider.dart';
import 'package:logistics_app/providers/auth_provider.dart';
import 'package:logistics_app/src/authentication/views/pages/otp_verification_page.dart';
import 'package:logistics_app/src/authentication/views/pages/sign_in_page.dart';
import 'package:logistics_app/src/authentication/views/pages/sign_up_page.dart';
import 'package:logistics_app/src/home/views/pages/trip_overview_page.dart';
import 'package:logistics_app/src/onboarding/views/pages/onboarding_page.dart';
import 'package:logistics_app/src/profile/views/profile_screen.dart';
import 'package:logistics_app/src/splash/views/pages/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logistics_app/src/order/screens/order_history_screen.dart'; // Import the Order History screen

import 'core/common/app_config.dart';
import 'core/utils/helpers/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.create(
      appName: "Delivry",
      baseUrl: "https://cardano-preprod.blockfrost.io/api/v0/",
      flavor: Flavor.prod
  );
  setUpLocator();
  final prefs = await SharedPreferences.getInstance();
  CacheHelper.instance.init(prefs);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: AuthProvider()),
        ChangeNotifierProvider<AddressProvider>.value(value: AddressProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivry',
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
          OrderHistoryScreen.path: (_) => const OrderHistoryScreen(),
          ProfileScreen.path: (_) => const ProfileScreen(),
        },
      ),
    );
  }
}

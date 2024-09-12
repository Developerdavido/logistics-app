import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import 'package:logistics_app/core/res/colours.dart';
import 'package:logistics_app/core/utils/helpers/cache_helper.dart';
import 'package:logistics_app/src/authentication/views/pages/sign_in_page.dart';
import 'package:logistics_app/src/onboarding/views/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const path = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (CacheHelper.instance.isFirstTimer) {
        Navigator.of(context).pushReplacementNamed(OnboardingPage.path);
      } else {
        Navigator.of(context).pushReplacementNamed(SignInPage.path);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: DefaultText(
          'Dilivry',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colours.primary,
        ),
      ),
    );
  }
}

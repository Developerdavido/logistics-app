import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._internal();

  static final instance = CacheHelper._internal();

  static const _firstTimerKey = 'first-timer-key';

  late SharedPreferences _prefs;

  bool _isFirstTimer = true;

  /// Returns [true] if the user is a first timer, otherwise [false].
  bool get isFirstTimer => _isFirstTimer;

  void init(SharedPreferences prefs) {
    _prefs = prefs;
    _isFirstTimer = _checkIfUserIsFirstTimer();
  }

  /// Cache the first timer.
  ///
  /// This should be called only once after the user taps the Get Started
  /// Button on the Onboarding page. It stores [false], meaning the user is
  /// no longer a first timer.
  Future<void> cacheFirstTimer() async {
    await _prefs.setBool(_firstTimerKey, false);
  }

  /// Check if the user is a first timer.
  bool _checkIfUserIsFirstTimer() {
    final result = _prefs.getBool(_firstTimerKey);

    return result ?? false;
  }
}

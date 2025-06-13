import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._internal();

  static final instance = CacheHelper._internal();

  static const _firstTimerKey = 'first-timer-key';

  static const loginMap = 'login_maps';

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

    return result ?? true;
  }

  Future<bool> clearCache() async {
    return _prefs.clear();
  }

  Future<void> cacheBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool readBool(String key) {
    final result = _prefs.getBool(key);
    return result ?? false;
  }

  //set string values
  Future<void> cacheString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? readString(String key) {
    return _prefs.getString(key);
  }

  removeKey(String key) {
    return _prefs.remove(key);
  }

  Future<void> cacheModel(String key, value) async {
    var encodedValue = json.encode(value);
    cacheString(key, encodedValue);
  }

  Future readModel(String key) async {
    var encodedValue = readString(key);
    return encodedValue == null ? null : json.decode(encodedValue);
  }
}

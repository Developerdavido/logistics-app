

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistics_app/core/services/auth_service.dart';
import 'package:logistics_app/core/utils/helpers/cache_helper.dart';
import 'package:logistics_app/src/authentication/views/pages/sign_in_page.dart';

import '../core/common/widgets/default_text.dart';
import '../core/res/api_strings.dart';
import '../core/res/storage_keys.dart';
import '../models/auth.dart';
import '../src/home/views/pages/trip_overview_page.dart';

class AuthProvider with ChangeNotifier {
  AuthService authService = AuthService();
  Auth? currentUser;
  bool isLocationOn = false;

  bool loggingInUser = false;
  //login the user
  loginUser(BuildContext context, String email, String password) async {
    updateUi(loggingInUser = true);
    Map response = await authService.login(email: email, password: password);
    updateUi(loggingInUser = false);
    if(response.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: DefaultText("User not found")));
    } else {
      currentUser = Auth.fromJson(response);
      await CacheHelper.instance.cacheModel(StorageKeys.authKey, response);
      Navigator.of(context).pushNamedAndRemoveUntil(TripOverviewPage.path, (route)=> false);
      notifyListeners();
    }
  }

  bool registeringUser = false;
  //login the user
  registerUser(BuildContext context, String email, String password, String phone, String name, String address) async {
    updateUi(registeringUser = true);
    Map response = await authService.register(context, email: email, password: password, fullName: name, phone: phone, address: address);
    updateUi(registeringUser = false);
    if(response.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: DefaultText("User not found")));
    } else {
      currentUser = Auth.fromJson(response);
      Navigator.of(context).pushReplacementNamed(
        SignInPage.path,
      );
      notifyListeners();
    }
  }


  changeLocationPermission(bool isOn){
    isLocationOn = isOn;
    notifyListeners();
  }


  Future<bool> checkIfUserExists() async {
    Map? authKey = await CacheHelper.instance.readModel(StorageKeys.authKey);
    if(authKey != null) {
      currentUser = Auth.fromJson(authKey);
      return true;
    } else {
      return false;
    }
  }









  updateUi(func) {
    ()=> func();
    notifyListeners();
  }
}
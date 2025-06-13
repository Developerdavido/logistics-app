

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logistics_app/core/common/widgets/default_text.dart';
import '../utils/helpers/cache_helper.dart';

class AuthService {

  //login the user
  Future<Map> login({String? email, String? password}) async {

  //access the cached data
    Map? cacheLoginData = await CacheHelper.instance.readModel(CacheHelper.loginMap);
    Map response = {};
    await Future.delayed(const Duration(seconds: 2), (){
      if(cacheLoginData != null) {
        Map? loginMap = cacheLoginData[email];
        if(loginMap != null) {
          if(email == loginMap['email'] && password == loginMap['password']){
            response = Map.from(loginMap);
          }
        }
      }
    });
    return response;
  }

  //login the user
  Future<Map> register(BuildContext context, {String? email, String? password, String? fullName, String? phone, String? address}) async {
    Map response = {};
    Map loginData = {'name' : fullName, 'email': email, 'password': password, 'phone' : phone, 'address' : address};
    Map? cacheLoginData = await CacheHelper.instance.readModel(CacheHelper.loginMap);
    log("this is the cached loginData $cacheLoginData");
    await Future.delayed(const Duration(seconds: 2), (){
      if(cacheLoginData != null) {
        if(cacheLoginData?[email] != null) {
          //show a snackbar
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: DefaultText("User already exists with this email")));
          response = {'message': 'user not found'};
        }else {
          cacheLoginData = Map.from({email: loginData});
          response = Map.from(loginData);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: DefaultText("user with email: $email has been successfully registered")));
        }
      }else {
        cacheLoginData = Map.from({email: loginData});
        response = Map.from(loginData);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: DefaultText("user with email: $email has been successfully registered")));
      }
      CacheHelper.instance.cacheModel(CacheHelper.loginMap, cacheLoginData);
    });
    return response;
  }
}
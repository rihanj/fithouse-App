import 'dart:convert';

import 'package:fithouse_app/data/services/cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_details_model.dart';

class CacheServiceImp extends ICacheService {
  static String isLoginKey = "isLogin";
  static String setUser = "user";

  @override
  Future<bool> isLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(isLoginKey)) {
      bool? value = preferences.getBool(isLoginKey);
      return value ?? false;
    } else {
      return false;
    }
  }

  @override
  Future<bool> setLogin(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? result = await preferences.setBool(isLoginKey, value);
    return result;
  }

  @override
  Future<bool> logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? result = await preferences.clear();
    return result;
  }

  @override
  Future setUserDetails(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? result = await preferences.setString(setUser, value);
    return result;
  }

  @override
  Future<UserDetailsModel?> getUserDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(setUser)) {
      String? value = preferences.getString(setUser);

      if (value != null) {
        return UserDetailsModel.fromJson(jsonDecode(value!));
      }
      return null;
    } else {
      return null;
    }
  }
}

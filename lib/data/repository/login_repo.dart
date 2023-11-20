import 'dart:convert';

import 'package:fithouse_app/data/model/user_details_model.dart';

import '../../config/js_log.dart';
import '../../config/logger.dart';
import '../../domain/repositories/login_repo.dart';
import '../../domain/services/login_services.dart';
import '../../utils/App_data.dart';
import '../data_provider/cache_service_imp.dart';
import '../services/login_services_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginRepoImp extends ILoginRepo {
  ILoginServices services = LoginServicesImp();

  @override
  Future<UserDetailsModel?> getUser(Map<String, dynamic> data) async {
    CacheServiceImp  cacheServiceImp;

    try {
      final response = await services.userDetails(data);
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      //       await prefs.setString('user', response.toString());

      CacheServiceImp().setUserDetails(json.encode(response));

      UserDetailsModel userDetailsModel =  UserDetailsModel.fromJson(response);
      AppData.userDetails = await CacheServiceImp().getUserDetails();
      return userDetailsModel;
    } catch (err) {
      Logger.errorLog("$err");
      JSLog.error(msg: err.toString());
      return null;
    }
  }
}

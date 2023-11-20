import 'package:fithouse_app/data/model/user_details_model.dart';

abstract class ICacheService {
  Future<bool> isLogin();

  Future<dynamic> setUserDetails(String value);

  Future<UserDetailsModel?> getUserDetails();

  Future<bool> setLogin(bool value);

  Future<bool> logOut();
}

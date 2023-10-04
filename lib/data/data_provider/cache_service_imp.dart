import 'package:fithouse_app/data/services/cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CacheServiceImp extends ICacheService{
  static String isLoginKey = "isLogin";
  @override
  Future<bool> isLogin() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.containsKey(isLoginKey)){
      bool? value = preferences.getBool(isLoginKey);
      return value??false;
    }else{
      return false;
    }
  }

  @override
  Future<bool> setLogin(bool value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? result = await preferences.setBool(isLoginKey, value);
    return result;
  }

}
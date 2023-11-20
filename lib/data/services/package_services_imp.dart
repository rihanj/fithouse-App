import 'package:fithouse_app/data/model/package_model.dart';

import '../../config/js_log.dart';
import '../../config/logger.dart';
import '../../config/network_utils.dart';
import '../../domain/services/package_service.dart';
import '../../utils/remote_keys.dart';
import '../exception_handler/exception_handler.dart';

class PackageServicesImp extends IPackageService{
  @override
  Future<dynamic> getMeals(Map<String, dynamic> data)

  async{
    try{
      Logger.debugLog("getMeals");
      var header = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final url = Uri.http(RemoteKey.baseURL,"${RemoteKey.medium}/BuyPlan.php");
      var json = await NetworkUtils.post(url,headers:header,body: data);
      if(json !=null){
        JSLog.tagInfo(tag: "response data--->>>", msg: json.toString());
        Logger.debugLog("Success getAccessToken");
        return json;
      }


      else{
        Logger.errorLog("$json");
        throw ExceptionHandlers().getExceptionString(FetchDataException("error------->>>>>>  $json"));
      }
    }catch(e){
      Logger.errorLog("$e");
      JSLog.error(msg: e);
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future getBranch()  async{
    try{
      Logger.debugLog("getMeals");
      var header = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final url = Uri.http(RemoteKey.baseURL,"${RemoteKey.medium}/Branches.php");
      var json = await NetworkUtils.get(url,headers:header);
      if(json !=null){
        JSLog.tagInfo(tag: "response data--->>>", msg: json.toString());
        Logger.debugLog("Success getAccessToken");
        return json;
      }


      else{
        Logger.errorLog("$json");
        throw ExceptionHandlers().getExceptionString(FetchDataException("error------->>>>>>  $json"));
      }
    }catch(e){
      Logger.errorLog("$e");
      JSLog.error(msg: e);
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future stripeIntegration(Map<String, dynamic> data) async{
    try{
      Logger.debugLog("getMeals");
      var header = {
        'Authorization': 'Bearer ${RemoteKey.stripe}',
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      final url = Uri.https(RemoteKey.stripeBaseURL,RemoteKey.stripApi);
      var json = await NetworkUtils.get(url,headers:header);
      if(json !=null){
        JSLog.tagInfo(tag: "response data--->>>", msg: json.toString());
        Logger.debugLog("Success getAccessToken");
        return json;
      }


      else{
        Logger.errorLog("$json");
        throw ExceptionHandlers().getExceptionString(FetchDataException("error------->>>>>>  $json"));
      }
    }catch(e){
      Logger.errorLog("$e");
      JSLog.error(msg: e);
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future createSubscription(Map<String, dynamic> data) async{
    try{
      Logger.debugLog("getMeals");
      var header = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final url = Uri.http(RemoteKey.baseURL,"${RemoteKey.medium}/CreateSubscription.php");
      var json = await NetworkUtils.post(url,headers:header,body: data);
      if(json !=null){
        JSLog.tagInfo(tag: "response data--->>>", msg: json.toString());
        Logger.debugLog("Success getAccessToken");
        return json;
      }


      else{
        Logger.errorLog("$json");
        throw ExceptionHandlers().getExceptionString(FetchDataException("error------->>>>>>  $json"));
      }
    }catch(e){
      Logger.errorLog("$e");
      JSLog.error(msg: e);
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
}
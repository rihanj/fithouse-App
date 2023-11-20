import 'package:fithouse_app/data/model/user_details_model.dart';

import '../../config/js_log.dart';
import '../../config/logger.dart';
import '../../config/network_utils.dart';
import '../../domain/services/login_services.dart';
import '../../utils/remote_keys.dart';
import '../exception_handler/exception_handler.dart';

class LoginServicesImp extends ILoginServices{
  @override
  Future<dynamic> userDetails(Map<String, dynamic> data) async{
    try{
      Logger.debugLog("getUser");
      var header = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final url = Uri.http(RemoteKey.baseURL,"${RemoteKey.medium}/login.php");
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
import 'package:flutter/foundation.dart';

class JSLog{
  static debug({required dynamic msg}){
    debugPrint("[JS DEBUG] --> \x1B[33m$msg\x1B[0m");
  }

  static info({required dynamic msg}){
    debugPrint("[JS INFO] --> \x1B[36m$msg\x1B[0m");
  }

  static error({required dynamic msg}){
    debugPrint("[JS ERROR] --> \x1B[31m$msg\x1B[0m");
  }
  static success({required dynamic msg}){
    debugPrint("[JS SUCCESS] <-- \x1B[32m$msg\x1B[0m");
  }
  static tagInfo({required String tag, required dynamic msg}){
    debugPrint("[JS INFO] --> \x1B[36m$tag\x1B[0m :- $msg");
  }
}


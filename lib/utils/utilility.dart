import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class Utility {
  static Future<dynamic> getName()async{
    final LocalStorage storage =  LocalStorage('user-info');
    var data = await jsonDecode(storage.getItem('info'))!;
    print(data);
    return data["full_name"];
  }
}
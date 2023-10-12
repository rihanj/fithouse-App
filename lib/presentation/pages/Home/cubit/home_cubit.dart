import 'dart:convert';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

import '../../../../data/model/home_model.dart';
import '../../../../utils/App_data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCreateState> {
  HomeCubit() : super(HomeCreateInitial());

  List<String> data = ['Page 0', 'Page 1', 'Page 2'];
  int initPosition = 1;
  Future<dynamic> getName() async {
    final LocalStorage storage = LocalStorage('user-info');
    var data = await jsonDecode(storage.getItem('info'))!;
    print(data);
    emit(GetUserState());
    return data["full_name"];
  }

  Future<dynamic> getPackage() async {
    print("function called");
    var fsub_id = "";
    // final LocalStorage storage = LocalStorage('user-info');
    // var subscription = await storage.getItem('info');
    // final data = json.decode(subscription);
    // AppData.subscriptionData = data;
    // print("home data" + data.toString());
    // var sub_id = AppData.subscriptionData['subscripton'];
    // print(sub_id);
    for (var i = 0; i < AppData.sub_id.length; i++) {
      print("===" + AppData.sub_id[i].toString());
      var sub_data = AppData.sub_id[i]['Status'].toString();
      if (sub_data == "Active") {
        fsub_id = AppData.sub_id[i]['id'].toString();
      }
    }
    print("fsub_id-->" + fsub_id);
    final mapData = {"id": fsub_id};
    print("fsub_id map data-->" + mapData.toString());

    final response = await http.post(
      Uri.parse(
          'http://172.105.60.113/fithouse/fithouse/api/PackageDetails.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(mapData),
    );
    final d = response.body;
    final decoded = json.decode(d);
    HomeModel homeModel = HomeModel.fromJson(decoded);

    print("response-->" + homeModel.breakfast.toString());
    emit(HomeRefreshState());
  }

  // Future<dynamic> getPackage() async {
  // }
}

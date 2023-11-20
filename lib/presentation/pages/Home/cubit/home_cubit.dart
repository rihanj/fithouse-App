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
  int dateIndex = 0;

  changeDateIdx(int val) {
    dateIndex = val;
  }

  int initPosition = 0;


  Future<dynamic> getName() async {
    final LocalStorage storage = LocalStorage('user-info');
    var data = await jsonDecode(storage.getItem('info'))!;
    print(data);
    emit(GetUserState());
    return data["full_name"];
  }

  Future<dynamic> getPackage() async {
    String? fsub_id = "";

    for (var i = 0; i < AppData.userDetails!.subscripton!.length; i++) {
      bool? sub_data = AppData.userDetails!.status;

      if (sub_data == true) {
        fsub_id = AppData.userDetails!.subscripton![i]!.id;
      }
    }
    // print("fsub_id-->" + fsub_id);
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
    log("data is here---->>>> " + decoded["meals"].toString());

    HomeModel home = HomeModel.fromJson(decoded);
    AppData.homeData = home;
    print("response-->${AppData.homeData!}");
    emit(HomeSuccessState(home));
  }

  checkData() async {
    if (AppData.homeData == null) {
      await getPackage();
      emit(HomeSuccessState(AppData.homeData!));
      // emit(HomeRefreshState());
    } else {
      emit(HomeSuccessState(AppData.homeData!));
    }
  }

// Future<dynamic> getPackage() async {
// }
}

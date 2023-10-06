import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';




part 'home_state.dart';

class HomeCubit extends Cubit<HomeCreateState> {
  HomeCubit() : super(HomeCreateInitial());
  Future<dynamic> getName()async{
    final LocalStorage storage =  LocalStorage('user-info');
    var data = await jsonDecode(storage.getItem('info'))!;
    print(data);
    emit(GetUserState());
    return data["full_name"];
  }

}
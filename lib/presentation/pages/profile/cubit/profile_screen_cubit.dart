import 'package:fithouse_app/config/js_log.dart';
import 'package:fithouse_app/utils/App_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
part 'profile_screen_state.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState>{
  ProfileScreenCubit() :super(ProfileScreenInitialState());
bool cutlery = true;

Locale language = Locale('ar');
  cutleryChange(val){
    cutlery = val;
    emit(RefreshScreenState());
  }

  changeLanguage(value){
    AppData.language = value;
    if(value=="Arabic"){
      language = Locale('ar');

    }else{
      language = Locale('en');
    }
    JSLog.tagInfo(tag: "change language--->>", msg: language.toLanguageTag());
    emit(LanguageChange(language));
  }

}
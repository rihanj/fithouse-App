import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custom_package_state.dart';

class CustomPackageCubit extends Cubit<CustomPackageState> {
List tab = [ "Monthly","Weekly"];

List data = [
      {
        "name": "Broccoli Beef & Mash",
        "img":
        "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg",
        'cart':1
      },
      {
        "name": "Chicken Beetroot",
        "img":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIBxG-XPwv465_sG0kEslgsBA_TjfPi0TjPg&usqp=CAU",
        'cart':2
      },
      {
        "name": "Butter Chicken ",
        "img":
        "https://www.cubesnjuliennes.com/wp-content/uploads/2020/06/Best-Instant-Pot-Butter-Chicken.jpg",
        'cart':0
      },
    ];
  int initPosition = 0;
  int dateIndex = 0;

  changeDateIdx(int val) {
    dateIndex = val;
  }
addToCart(index){
    data[index]['cart'] ++;
    emit(CustomPackageRefreshState());
  }

  removeToCart(index){
    if( data[index]['cart'] > 0)
    data[index]['cart'] --;
    emit(CustomPackageRefreshState());
  }

  CustomPackageCubit() : super(CustomPackageInitialState()) ;
}
import 'package:fithouse_app/utils/App_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/js_log.dart';
import '../../../../data/model/package_model.dart';
import '../../../../data/repository/package_repo_imp.dart';

part 'renew_subscription_state.dart';

class RenewSubscriptionCubit extends Cubit<RenewSubscriptionState> {
  PackageRepoImp repo = PackageRepoImp();
  List<PackageModel> list = [];
  List data = [
    {
      "date": "May 18",
      "food": [
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Chicken Beetroot",
          "img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIBxG-XPwv465_sG0kEslgsBA_TjfPi0TjPg&usqp=CAU"
        },
        {
          "name": "Butter Chicken ",
          "img":
              "https://www.cubesnjuliennes.com/wp-content/uploads/2020/06/Best-Instant-Pot-Butter-Chicken.jpg"
        },
      ]
    },
    {
      "date": "May 19",
      "food": [
        {
          "name": " Paneer Tikka",
          "img":
              "https://carveyourcraving.com/wp-content/uploads/2021/10/paneer-tikka-skewers.jpg"
        },
        {
          "name": "Chicken Beetroot",
          "img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIBxG-XPwv465_sG0kEslgsBA_TjfPi0TjPg&usqp=CAU"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
      ]
    },
    {
      "date": "May 20",
      "food": [
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
      ]
    },
    {
      "date": "May 21",
      "food": [
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
      ]
    },
    {
      "date": "May 22",
      "food": [
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
      ]
    },
    {
      "date": "May 23",
      "food": [
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
      ]
    },
    {
      "date": "May 24",
      "food": [
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
        {
          "name": "Broccoli Beef & Mash",
          "img":
              "https://img.freepik.com/premium-photo/vertical-shot-delicious-beef-with-broccoli-3d-illustrated_768106-816.jpg"
        },
      ]
    },
  ];

  List sliderData = [
    {
      "start_date": "Starts from Ramdan , March 23",
      "meal": "5 Meals Chicken + Meat",
      "img":
          "https://www.mediainfoline.com/wp-content/uploads/2023/07/KFC-Bucket-price.jpg",
      "list": [
        'Futoor, Suhoor & 3 sides',
        'Serves up to 1400 out of 1720 calories recommended for you.',
        '5 days a week x 4 weeks',
        'Skip anytime'
      ],
      "price": "2070SAR",
      "offer_price": "1840SAR",
      'tax': '15% VAT inclusive"'
    },
    {
      "start_date": "Starts from Ramdan , March 23",
      "meal": "5 Meals Chicken + Meat",
      "img":
          "https://www.mediainfoline.com/wp-content/uploads/2023/07/KFC-Bucket-price.jpg",
      "list": [
        'Futoor, Suhoor & 3 sides',
        'Serves up to 1400 out of 1720 calories recommended for you.',
        '5 days a week x 4 weeks',
        'Skip anytime'
      ],
      "price": "2070SAR",
      "offer_price": "1840SAR",
      'tax': '15% VAT inclusive"'
    },
    {
      "start_date": "Starts from Ramdan , March 23",
      "meal": "5 Meals Chicken + Meat",
      "img":
          "https://www.mediainfoline.com/wp-content/uploads/2023/07/KFC-Bucket-price.jpg",
      "list": [
        'Futoor, Suhoor & 3 sides',
        'Serves up to 1400 out of 1720 calories recommended for you.',
        '5 days a week x 4 weeks',
        'Skip anytime'
      ],
      "price": "2070SAR",
      "offer_price": "1840SAR",
      'tax': '15% VAT inclusive"'
    },
    {
      "start_date": "Starts from Ramdan , March 23",
      "meal": "5 Meals Chicken + Meat",
      "img":
          "https://www.mediainfoline.com/wp-content/uploads/2023/07/KFC-Bucket-price.jpg",
      "list": [
        'Futoor, Suhoor & 3 sides',
        'Serves up to 1400 out of 1720 calories recommended for you.',
        '5 days a week x 4 weeks',
        'Skip anytime'
      ],
      "price": "2070SAR",
      "offer_price": "1840SAR",
      'tax': '15% VAT inclusive"'
    },
    {
      "start_date": "Starts from Ramdan , March 23",
      "meal": "5 Meals Chicken + Meat",
      "img":
          "https://www.mediainfoline.com/wp-content/uploads/2023/07/KFC-Bucket-price.jpg",
      "list": [
        'Futoor, Suhoor & 3 sides',
        'Serves up to 1400 out of 1720 calories recommended for you.',
        '5 days a week x 4 weeks',
        'Skip anytime'
      ],
      "price": "2070SAR",
      "offer_price": "1840SAR",
      'tax': '15% VAT inclusive"'
    },
  ];
  int initPosition = 0;
  int dateIndex = 0;

  List packageDay = ['24 Days', '20 Days', '12 Days', '10 Days', '5 Days'];
  List meals = ['1 Meals', '2 Meals', '3 Meals', '4 Meals', '5 Meals'];
  String selectedMeal = "1 Meals";
  String selectedDays = "24 Days";

  changeDateIdx(int val) {
    dateIndex = val;
  }

  selectDay(val) {
    selectedDays = val;
    AppData.packageDays = val;
    emit(RenewSuccessState());
  }

  selectMeal(val) {
    selectedMeal = val;
    AppData.packageMeals = val;
    emit(RenewSubscriptionRefreshState());
  }

  getMeals() async {
    print("hello");
    emit(RenewSubscriptionLoadingState());
    try {
      Map<String, dynamic> data = {
        "Meal": selectedMeal,
        "Days": selectedDays.replaceAll(' Days', '')
      };
      list = await repo.getMeals(data);

      emit(RenewSuccessState());
    } catch (e) {
      emit(RenewErrorState());
      JSLog.error(msg: e.toString());
    }
  }

  RenewSubscriptionCubit() : super(RenewSubscriptionInitialState());
}

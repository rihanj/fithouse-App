import 'dart:convert';

import 'package:fithouse_app/data/model/branch_model.dart';
import 'package:fithouse_app/utils/App_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/js_log.dart';
import '../../../../data/repository/package_repo_imp.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../payment_screen.dart';
part 'subscription_form_state.dart';

class SubscriptionFormCubit extends Cubit<SubscriptionFormState> {
  //Assign publishable key to flutter_stripe
final notes  = TextEditingController();
final date = TextEditingController();
  List days = ['Sun', "Mon", "Tue", 'Wed', "Thus", 'Fri', 'Sat'];

  List packageDay = ['24 Days', '20 Days', '12 Days', '10 Days', '5 Days'];
  List packageDelivery = ["Pickup From Branch", "Delivery"];
  List packageAddBreakfast = ["Yes", "No"];
  List packageSubscriptions = ['1','2','3','4','5','6','7'];
  List packageCarbsQuantity = [
    "50 Gm",
    "100 Gm",
    "200 Gm",
    "250 Gm",
    "300 Gm",
    "350 Gm",
  ];
  List packageProteinQuantity = [
    "50 Gm",
    "100 Gm",
    "200 Gm",
    "250 Gm",
    "300 Gm",
    "350 Gm",
  ]; List packageDrinks = ['1','2','3'];

  String selectedCarbsQuantity = "50 Gm";
  String selectedProteinQuantity = "50 Gm";
  String selectedSubscription = "1";
  String branchID = "";
  String addBreakfast = "Yes";
  String selectedDays = "24 Days";
  String selectedBranch = "select";
  String selectedDeliveryMethod = "Pickup From Branch";
  String selectedSnacks = "0";
  String selectedDrinks = "1";
  PackageRepoImp repo = PackageRepoImp();
  Map<String, dynamic>? paymentIntent;
  List<BranchModel> list = [];
  Map <String,dynamic> paymentData = {
    "amount": 10,
    "currency": "SAR",
    // "threeDSecure": true,
    // "save_card": false,
    "description": "Test Description",
    // "statement_descriptor": "Sample",
    // "metadata": '{"udf1": "test 1", "udf2": "test 2"}',
    // "reference": {
    //   "transaction": "txn_0001",
    //   "order": "ord_0001"
    // },
    // "receipt": {"email": false, "sms": true},
    "customer": {
      "first_name": "test",
      "middle_name": "test",
      "last_name": "test",
      "email": "test@test.com",
      "phone": {
        "country_code": "965",
        "number": "50000000"
      }
    },
    // "merchant": {"id": ""},
    "source": {"id": "src_card"}
    // "destinations": {
    //   "destination": [
    //     {"id": "480593777", "amount": 2, "currency": "KWD"},
    //     {"id": "486374777", "amount": 3, "currency": "KWD"}
    //   ]
    // }
  };

Future<void> makeTapPayment(context) async {
  createSubscription();
  var apiKey = 'sk_test_7mor5v9xtGuPdaVb21g3L0Oj'; // Replace this with your Tap Payments API key
  var url = 'https://api.tap.company/v2/charges';

  var headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  var body = {
    "amount": AppData.totalAmount.toString(),
    "currency": "SAR",
    "description": "test Package",
    "customer": {
      "first_name": AppData.userDetails?.fullName!.toString(),
      "email": AppData.userDetails?.email.toString(),
      "phone": {
        "country_code": "966",
        "number": 5555555555
      }
    },
    "source": {
      "id": "src_all"
    },
    "redirect": {
      "url": "https://fithouse.sa/fithouserest-sa.com/response1.php"
    }
  };

  JSLog.tagInfo(tag: "url", msg: url);
  JSLog.tagInfo(tag: "body", msg: body);
  JSLog.tagInfo(tag: "header", msg: headers);

  try {
    var response = await http.post(Uri.parse(url), headers: headers, body: json.encode(body));
    if (response.statusCode == 200) {
      // Payment successful, handle the response accordingly
      print('Payment successful');
      print(json.decode(response.body));
      var data = json.decode(response.body);
      var url = data["transaction"]["url"];
      JSLog.tagInfo(tag: "Open url ", msg: url);
      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(url: url)));
    } else {
      // Payment failed, handle the error response
      print('Payment failed');
      print(json.decode(response.body));
    }
  } catch (error) {
    // Handle network errors
    print('Error: $error');
  }
}
Future<void> _launchUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

selectBranch(val) {
    selectedBranch = val;

    for (var i in list) {
      if (i.accountName == selectedBranch) {
        branchID = i.accountId!;
      }
    }

    emit(SubscriptionRefreshState());
  }

  selectDay(val) {
    selectedDays = val;
    emit(SubscriptionRefreshState());
  }  selectSubscription(val) {
  selectedSubscription = val;
    emit(SubscriptionRefreshState());
  }
  selectDrink(val) {
    selectedDrinks = val;
    emit(SubscriptionRefreshState());
  }

  selectCarbs(val) {
    selectedCarbsQuantity = val;
    emit(SubscriptionRefreshState());
  }

  selectProtein(val) {
    selectedProteinQuantity = val;
    emit(SubscriptionRefreshState());
  }

  selectSnack(val) {
    selectedSnacks = val;
    emit(SubscriptionRefreshState());
  }

  selectBreakfast(val) {
    addBreakfast = val;
    emit(SubscriptionRefreshState());
  }

  selectDelivery(val) {
    selectedDeliveryMethod = val;
    emit(SubscriptionRefreshState());
  }

  getMeals() async {
    emit(SubscriptionLoadingState());
    AppData.listBranch = ["select"];
    try {
      list = await repo.getBranch();
      if (AppData.listBranch.length == 1) {
        for (var i in list) {
          AppData.listBranch.add(i.accountName);
        }
      }
      emit(SubscriptionSuccessState());
    } catch (e) {
      emit(SubscriptionErrorState("Something went wrong"));
      JSLog.error(msg: e.toString());
    }
  }

  createSubscription() async {
    emit(SubscriptionButtonLoadingState());
    Map<String, dynamic> mapData = {
      "id": AppData.userDetails!.id ??  AppData.id,
      "select_plan_days": AppData.packageDays,
      "package_name": AppData.packageMeals,
      "package_day_plan ": AppData.packageDays,
      "delivery_method": selectedDeliveryMethod,
      "branch": branchID,
      "add_breakfast": addBreakfast,
      "add_snacks": selectedSnacks,
      "add_drink": selectedDrinks,
      "number_of_subscription": selectedSubscription,
      "carbs_quantity": selectedCarbsQuantity,
      "protein_quantity": selectedProteinQuantity,
      "snack_quantity": selectedSnacks,
      "package_start_from": date.text,
      "notes": notes.text
    };

    JSLog.tagInfo(tag: "map data ---->> ", msg: mapData.toString());
    try {
      var res = await repo.createSubscription(mapData);
      if (res["response"]) {
        emit(SubscriptionSuccessFormState(res['Message']));
      } else {
        emit(SubscriptionErrorState(res['Message']));
      }

      print(res.toString());
    } catch (e) {
      JSLog.error(msg: e);
    }
  }

  void makePayment() async {

    try {
      paymentIntent = await createPaymentIntent();
      print(
          "secert key------>>>>>>>  ${paymentIntent!['data'][0]['client_secret']}");

      var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: "SA",
        currencyCode: "sar",
        testEnv: true,
      );
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              customerId: paymentIntent!['data'][0]['customer'],
              allowsDelayedPaymentMethods: true,
              // set this to true
              customerEphemeralKeySecret: paymentIntent!['data'][0]
                  ['ephemeralKey'],
              paymentIntentClientSecret: paymentIntent!['data'][0]
                  ['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: 'vinit',
              googlePay: gpay));

      displayPaymentSheet();
    } catch (e) {
      JSLog.error(msg: e);
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance
          .confirmPayment(paymentIntentClientSecret: paymentIntent!['data'][0]);
      JSLog.success(msg: "Done");
    } catch (err) {
      print("errr is ----->>> " + err.toString());
      JSLog.success(msg: "Failed");
    }
  }

  createPaymentIntent() {
    Map<String, dynamic> data = {'amount': "10000", 'currency': 'sar'};
    try {
      var res = repo.stripIntegration(data);
      return res;
    } catch (err) {
      JSLog.error(msg: err);
    }
  }

  SubscriptionFormCubit() : super(SubscriptionFormInitialState());
}

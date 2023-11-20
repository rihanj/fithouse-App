import 'package:fithouse_app/config/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_tap_payment/flutter_tap_payment.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/App_data.dart';
import '../../themes/dimens.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/CTextFormField.dart';
import '../../widgets/c-snack_bar.dart';
import '../../widgets/f_h_back_app_bar.dart';
import '../../widgets/s_text_form_field.dart';
import '../../widgets/shapes.dart';
import 'cubit/subscription_form_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart'
class SubscriptionFormScreen extends StatelessWidget {
  const SubscriptionFormScreen({super.key});
  launchURl(url)async{
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }else{
      throw("Could not launch $url");
    }
  }
  @override
  Widget build(BuildContext context) {
    SubscriptionFormCubit cubit = context.watch<SubscriptionFormCubit>();
    return Scaffold(
        appBar: FHAppWidget.appBar(context, "fithouse", FHColor.appColor, true),
        body: BlocConsumer<SubscriptionFormCubit, SubscriptionFormState>(
            listener: (context, state) {
          if (state is SubscriptionSuccessFormState) {
            CSnackBar.successSnackBar(context, state.data);
          }
        }, builder: (context, state) {
          if (state is SubscriptionFormInitialState) {
            cubit.getMeals();
          } else if (state is SubscriptionLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: FHColor.appColor),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "DAYS & TIME",
                    style: TextStyle(
                        color: FHColor.blackColor,
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  Dimens.height(10),
                  const Text(
                    "Subscription days",
                    style: TextStyle(
                        color: FHColor.blackColor,
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.days.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundColor: index == 5 || index == 6
                                  ? Colors.grey.shade200
                                  : FHColor.appColor,
                              radius: 22,
                              child: Text(
                                cubit.days[index],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: index == 5 || index == 6
                                        ? FHColor.appColor
                                        : FHColor.whiteColor),
                              ), //Text
                            ),
                          );
                        }),
                  ),
                  const IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: Colors.orange,
                          thickness: 3,
                        ),
                        Expanded(
                            child: Text(
                          'Our Morning timing will be shifted during Ramadan to Afternoon (12pm - 4pm) for the same day.',
                          style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'Roboto',
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        )),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                  Dimens.height(15),
                  Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text(
                      //   "Package Day Plan",
                      //   style: TextStyle(
                      //       color: FHColor.blackColor,
                      //       fontFamily: 'Roboto',
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w400),
                      // ),
                      // Dimens.height(5),
                      // DropdownButtonCustom(
                      //   dropdownValue: cubit.selectedDays,
                      //   hintText: "select",
                      //   textStyle: TextStyle(
                      //       color: Colors.grey.shade400,
                      //       fontFamily: 'Roboto',
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w400),
                      //   list: cubit.packageDay,
                      //   onChanged: (value) {
                      //     cubit.selectDay(value!);
                      //   },
                      // ),
                      // Dimens.height(10),
                      const Text(
                        "Starting Date",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      InkWell(
                        onTap: () {
                          _showDatePicker(context, cubit);
                        },
                        child: STextFormField(
                            enable: false,
                            controller: cubit.date,
                            hintText: "2023-12-03",
                            colorBoder: Colors.grey,
                            // hintText: ,
                            padding: EdgeInsets.all(5),
                            textStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontFamily: 'Roboto',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                decorationThickness: 0.0)),
                      ),
                      // Shapes.container(
                      //     padding:
                      //         EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      //     width: SizeConfig.width,
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(width: 0.5),
                      //     child: Text(
                      //       "Thursday, May 07, 2023",
                      //       style: TextStyle(
                      //           color: Colors.grey.shade400,
                      //           fontFamily: 'Roboto',
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.w400),
                      //     )),
                      Dimens.height(10),
                      // const Text(
                      //   "Delivery Time",
                      //   style: TextStyle(
                      //       color: FHColor.blackColor,
                      //       fontFamily: 'Roboto',
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w400),
                      // ),
                      // Dimens.height(5),
                      // STextFormField(
                      //     hintText: "8PM to 11PM ( night )",
                      //     colorBoder: Colors.grey,
                      //     // hintText: ,
                      //     padding: EdgeInsets.all(5),
                      //     textStyle: TextStyle(
                      //         color: Colors.grey.shade400,
                      //         fontFamily: 'Roboto',
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.w400,
                      //         decorationThickness: 0.0)),
                      // Dimens.height(10),
                      const Text(
                        "Delivery Method",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      DropdownButtonCustom(
                        border: Border.all(width: 0.5),
                        dropdownValue: cubit.selectedDeliveryMethod,
                        hintText: "select",
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        list: cubit.packageDelivery,
                        onChanged: (value) {
                          cubit.selectDelivery(value!);
                        },
                      ),
                      Dimens.height(10),
                      const Text(
                        "Select the Branch",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      DropdownButtonCustom(
                        border: Border.all(width: 0.5),
                        dropdownValue: cubit.selectedBranch,
                        hintText: "select",
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        list: AppData.listBranch,
                        onChanged: (value) {
                          cubit.selectBranch(value!);
                        },
                      ),
                      Dimens.height(10),
                      // Dimens.height(5),
                      // STextFormField(
                      //     hintText: "Dubai",
                      //     colorBoder: Colors.grey,
                      //     // hintText: ,
                      //     padding: EdgeInsets.all(5),
                      //     textStyle: TextStyle(
                      //         color: Colors.grey.shade400,
                      //         fontFamily: 'Roboto',
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.w400,
                      //         decorationThickness: 0.0)),
                      // Dimens.height(10),
                      Dimens.height(5),
                      const Text(
                        "Select the number of breakfast meals",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      DropdownButtonCustom(
                        border: Border.all(width: 0.5),
                        dropdownValue: cubit.addBreakfast,
                        hintText: "select",
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        list: cubit.packageAddBreakfast,
                        onChanged: (value) {
                          cubit.selectBreakfast(value!);
                        },
                      ),
                      Dimens.height(10),

                      const Text(
                        "Select the number of snacks",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      DropdownButtonCustom(
                        border: Border.all(width: 0.5),
                        dropdownValue: cubit.selectedSnacks,
                        hintText: "select",
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        list: const ['0', '1', '2', '3'],
                        onChanged: (value) {
                          cubit.selectSnack(value!);
                        },
                      ),
                      Dimens.height(10),
                      const Text(
                        "Select the number of Drinks",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      DropdownButtonCustom(
                        border: Border.all(width: 0.5),
                        dropdownValue: cubit.selectedDrinks,
                        hintText: "select",
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        list: cubit.packageDrinks,
                        onChanged: (value) {
                          cubit.selectDrink(value!);
                        },
                      ),
                      Dimens.height(10),
                      const Text(
                        "Select the number of Drinks",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      DropdownButtonCustom(
                        border: Border.all(width: 0.5),
                        dropdownValue: cubit.selectedDrinks,
                        hintText: "select",
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        list: cubit.packageDrinks,
                        onChanged: (value) {
                          cubit.selectDrink(value!);
                        },
                      ),
                      Dimens.height(10),
                      const Text(
                        "Select Number of Subscription",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      DropdownButtonCustom(
                        border: Border.all(width: 0.5),
                        dropdownValue: cubit.selectedSubscription,
                        hintText: "select",
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        list: cubit.packageSubscriptions,
                        onChanged: (value) {
                          cubit.selectSubscription(value!);
                        },
                      ),
                      Dimens.height(10),
                      const Text(
                        "Select Protein Quantity",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      DropdownButtonCustom(
                        border: Border.all(width: 0.5),
                        dropdownValue: cubit.selectedProteinQuantity,
                        hintText: "select",
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        list: cubit.packageProteinQuantity,
                        onChanged: (value) {
                          cubit.selectProtein(value!);
                        },
                      ),
                      Dimens.height(10),
                      const Text(
                        "Select Carbs Quantity",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      DropdownButtonCustom(
                        border: Border.all(width: 0.5),
                        dropdownValue: cubit.selectedCarbsQuantity,
                        hintText: "select",
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        list: cubit.packageCarbsQuantity,
                        onChanged: (value) {
                          cubit.selectCarbs(value!);
                        },
                      ),
                      Dimens.height(10),
                      const Text(
                        "Notes",
                        style: TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Dimens.height(5),
                      STextFormField(
                          maxLines: 8,
                          hintText: "Write from here......",
                          colorBoder: Colors.grey,
                          // hintText: ,
                          padding: EdgeInsets.all(5),
                          textStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              decorationThickness: 0.0)),
                    ],
                  ))
                ],
              ),
            ),
          );
        }),
        bottomNavigationBar: Shapes.container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount :",
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                   Text(
                    "${AppData.totalAmount} SAR",
                    style: const TextStyle(
                        color: FHColor.appColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                ],
              ),
              Dimens.height(10),
              SizedBox(
                width: SizeConfig.width,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(

                      // foregroundColor: isMobileNumberEntered?FHColor.appColor:Colors.white54,
                      backgroundColor: FHColor.appColor,

                      // Text Color (Foreground color)
                      side: const BorderSide(width: 0, color: FHColor.appColor),
                      //border width and color
                      elevation: 3,
                      //elevation of button
                      shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(15)),
                  onPressed: () {

              cubit.makeTapPayment(context);

                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) =>
                    //         TapPayment(
                    //           apiKey: "sk_test_7mor5v9xtGuPdaVb21g3L0Oj",
                    //           redirectUrl: "https://www.youtube.com/",
                    //           postUrl: "https://api.tap.company/v2/charge",
                    //           paymentData: {
                    //             "amount": 10,
                    //             "currency": "OMR",
                    //             "threeDSecure": true,
                    //             "save_card": false,
                    //             "description": "Test Description",
                    //             "statement_descriptor": "Sample",
                    //             "metadata": {"udf1": "test 1", "udf2": "test 2"},
                    //             "reference": {
                    //               "transaction": "txn_0001",
                    //               "order": "ord_0001"
                    //             },
                    //             "receipt": {"email": false, "sms": true},
                    //             "customer": {
                    //               "first_name": "test",
                    //               "middle_name": "test",
                    //               "last_name": "test",
                    //               "email": "test@test.com",
                    //               "phone": {
                    //                 "country_code": "965",
                    //                 "number": "50000000"
                    //               }
                    //             },
                    //             "source": {"id": "src_card"},
                    //           },
                    //           onSuccess: (Map<dynamic, dynamic> params) {
                    //             print("onSuccess: $params");
                    //           },
                    //           onError: ( error) {
                    //             print("onError: $error");
                    //           },
                    //         )
                    //         // TapPayment(
                    //         // apiKey: "sk_test_7mor5v9xtGuPdaVb21g3L0Oj",
                    //         // redirectUrl:
                    //         //     "https://fithouse.sa/fithouserest-sa.com/response1.php",
                    //         // postUrl: "https://api.tap.company/v2/charge",
                    //         // paymentData: {
                    //         //   "amount": 10,
                    //         //   "currency": "SAR",
                    //         //   // "threeDSecure": true,
                    //         //   // "save_card": false,
                    //         //   "description": "Test Description",
                    //         //   // "statement_descriptor": "Sample",
                    //         //   // "metadata": '{"udf1": "test 1", "udf2": "test 2"}',
                    //         //   // "reference": {
                    //         //   //   "transaction": "txn_0001",
                    //         //   //   "order": "ord_0001"
                    //         //   // },
                    //         //   // "receipt": {"email": false, "sms": true},
                    //         //   "customer": {
                    //         //     "first_name": "test",
                    //         //     "middle_name": "test",
                    //         //     "last_name": "test",
                    //         //     "email": "test@test.com",
                    //         //     "phone": {
                    //         //       "country_code": "965",
                    //         //       "number": "50000000"
                    //         //     }
                    //         //   },
                    //         //   // "merchant": {"id": ""},
                    //         //   "source": {"id": "src_card"}
                    //         //   // "destinations": {
                    //         //   //   "destination": [
                    //         //   //     {"id": "480593777", "amount": 2, "currency": "KWD"},
                    //         //   //     {"id": "486374777", "amount": 3, "currency": "KWD"}
                    //         //   //   ]
                    //         //   // }
                    //         // },
                    //         // onSuccess: (Map params) async {
                    //         //   print("onSuccess: $params");
                    //         // },
                    //         // onError: (error) {
                    //         //   print("onError: $error");
                    //         //   print("Message: ${error['message']}");
                    //         //   print("onError: ${error['error']}");
                    //         // }),
                    //   ),
                    // );
                  },
                  child: cubit.state is SubscriptionButtonLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: FHColor.whiteColor,
                          ),
                        )
                      : const Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                ),
              ),
              Dimens.height(10),
            ],
          ),
        ));
  }

  Future<void> _showDatePicker(
      BuildContext context, SubscriptionFormCubit cubit) async {
    final today = DateTime.now();

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: today.subtract(Duration(days: 0)),
      firstDate: DateTime(today.year - 2),
      lastDate: DateTime(today.year + 8),
    );

    if (selectedDate != null) {
      final formattedDate = DateFormat('y-MM-dd').format(selectedDate);
      // print('Selected Date: $formattedDate');
      cubit.date.text = formattedDate.toString();
      // cubit. changeDate(selectedDate, -1);
    }
  }
}

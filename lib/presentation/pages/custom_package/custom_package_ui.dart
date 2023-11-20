import 'package:fithouse_app/presentation/themes/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_const.dart';
import '../../../utils/App_data.dart';
import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/custum_tab_view.dart';
import '../../widgets/f_h_back_app_bar.dart';
import '../../widgets/remote_image.dart';
import '../../widgets/shapes.dart';
import 'cubit/custom_package_cubit.dart';

class CustomPackageScreen extends StatelessWidget {
  const CustomPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomPackageCubit cubit = context.watch<CustomPackageCubit>();
    return Scaffold(
        appBar: FHAppWidget.appBar(
            context, "CUSTOM PACKAGE", FHColor.appColor, true),
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTabView(
                labelPadding: EdgeInsets.symmetric(horizontal: 50),
                decoration: const BoxDecoration(
                    color: FHColor.appColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),

                // bgColor: Colors.green,
                itemCount: 2,
                height: MediaQuery.sizeOf(context).height / 1.2,
                initPosition: 0,
                pageBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.height(5),
                      const Text(
                        "Save 200 SAR",
                        style: TextStyle(
                          color: FHColor.blackColor,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Dimens.height(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Shapes.container(
                                bgColor: FHColor.whiteColor,
                                shadowValue: 0.2,
                                isShadow: true,
                                border:
                                    Border.all(width: 0.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppConst.meal,
                                      height: 15,
                                      width: 15,
                                    ),
                                    Dimens.width(5),
                                    const Text(
                                      "Breakfast",
                                      style: TextStyle(
                                        color: FHColor.appColor,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Dimens.width(10),
                          Expanded(
                            child: Shapes.container(
                                bgColor: FHColor.whiteColor,
                                shadowValue: 0.2,
                                isShadow: true,
                                border:
                                    Border.all(width: 0.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppConst.meal,
                                      height: 15,
                                      width: 15,
                                    ),
                                    Dimens.width(5),
                                    const Text(
                                      "Lunch",
                                      style: TextStyle(
                                        color: FHColor.appColor,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Dimens.width(10),
                          Expanded(
                            child: Shapes.container(
                                bgColor: FHColor.whiteColor,
                                shadowValue: 0.2,
                                isShadow: true,
                                border:
                                    Border.all(width: 0.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppConst.meal,
                                      height: 15,
                                      width: 15,
                                    ),
                                    Dimens.width(5),
                                    const Text(
                                      "Dinner",
                                      style: TextStyle(
                                        color: FHColor.appColor,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                      Dimens.height(20),
                      Center(
                        child: Shapes.container(
                          height: 260,
                          width: 160,
                          bgImage: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(AppConst.bag) as ImageProvider),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Dimens.height(20),
                              const SizedBox(
                                width: 120,
                                child: Text(
                                  "Your Package Serves between",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: FHColor.appColor,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Dimens.height(10),
                              const SizedBox(
                                width: 120,
                                child: Text(
                                  "1000 - 2000 calories/day",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: FHColor.blackColor,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 120,
                                  child: Image.asset(AppConst.logo)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 350,
                                  mainAxisExtent: 100,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing:
                                      20, // Width to height ratio of each item
                                ),
                                // shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: cubit.data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (contex, idx) {
                                  var data = cubit.data;
                                  return Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        // decoration: const BoxDecoration(
                                        //     shape: BoxShape.circle,
                                        //     // BoxShape.circle or BoxShape.retangle
                                        //     //color: const Color(0xFF66BB6A),
                                        //     boxShadow: [
                                        //       BoxShadow(
                                        //           color: Colors.grey,
                                        //           blurRadius: 15.0,
                                        //           offset: Offset(1, 2),
                                        //           spreadRadius: 1),
                                        //     ]),
                                        child: RemoteImage(
                                          // borderRadius:
                                          // BorderRadius.circular(20),
                                          width: 80,
                                          height: 60,
                                          fit: BoxFit.cover,
                                          imageUrl: data[idx]["img"],
                                          // "https://ii1.pepperfry.com/media/catalog/product/j/u/800x880/jute-fabric-seating-stool-in-white-and-natural-colour-jute-fabric-seating-stool-in-white-and-natural-dpsphl.jpg",
                                        ),
                                      ),
                                      Dimens.height(10),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          data[idx]["name"],
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: FHColor.appColor,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Dimens.height(10),
                                      Shapes.container(
                                          padding: EdgeInsets.zero,
                                          bgColor: FHColor.appColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Row(
                                            children: [
                                              Shapes.container(
                                                  onTap: () =>
                                                      cubit.removeToCart(idx),
                                                  padding: EdgeInsets.zero,
                                                  width: 30,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 15,
                                                    color: FHColor.whiteColor,
                                                  )),
                                              Expanded(
                                                child: Shapes.container(
                                                    border: Border.symmetric(
                                                        horizontal: BorderSide(
                                                            width: 0.8,
                                                            color: Colors.grey
                                                                .shade400)),
                                                    bgColor: FHColor.whiteColor,
                                                    padding: EdgeInsets.zero,
                                                    child: Center(
                                                        child: Text(
                                                      cubit.data[idx]['cart']
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color:
                                                            FHColor.blackColor,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                      ),
                                                    ))),
                                              ),
                                              Shapes.container(
                                                  onTap: () =>
                                                      cubit.addToCart(idx),
                                                  padding: EdgeInsets.zero,
                                                  width: 30,
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 15,
                                                    color: FHColor.whiteColor,
                                                  ))
                                            ],
                                          ))
                                    ],
                                  );
                                })),
                      )
                    ],
                  ),
                ),
                tabBuilder: (context, index) => Tab(text: cubit.tab[index]),
              )
            ],
          ),
        ),
        bottomNavigationBar: Shapes.container(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total price",
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                    RichText(
                      text: TextSpan(
                          text: AppData.totalAmount,
                          style: const TextStyle(
                              color: FHColor.appColor,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                          children: <TextSpan>[
                            const TextSpan(
                              text: ' SAR',
                              style: TextStyle(
                                  color: FHColor.appColor,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                            TextSpan(
                              text: ' /MONTH',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                          ]),
                    ),
                    Dimens.height(5),
                    Text(
                      "15% VAT inclusive",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ],
                ),
                Dimens.width(10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // foregroundColor: isMobileNumberEntered?FHColor.appColor:Colors.white54,
                        backgroundColor: FHColor.appColor,

                        // Text Color (Foreground color)
                        side:
                            const BorderSide(width: 0, color: FHColor.appColor),
                        //border width and color
                        elevation: 3,
                        //elevation of button
                        shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(15)),
                    onPressed: () => Navigator.pushNamed(
                        context, RouteGenerator.subscriptionForm),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

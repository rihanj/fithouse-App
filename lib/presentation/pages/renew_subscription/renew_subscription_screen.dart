import 'package:fithouse_app/config/size_config.dart';
import 'package:fithouse_app/presentation/themes/dimens.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:fithouse_app/utils/App_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../../../utils/route_generator.dart';
import '../../model/place_model/chart_data.dart';
import '../../widgets/custum_tab_view.dart';
import '../../widgets/f_h_back_app_bar.dart';
import '../../widgets/remote_image.dart';
import '../../widgets/s_text_form_field.dart';
import '../../widgets/shapes.dart';

import 'cubit/renew_subscription_cubit.dart';

class RenewSubscriptionScreen extends StatelessWidget {
  const RenewSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RenewSubscriptionCubit cubit = context.watch<RenewSubscriptionCubit>();
    final List<ChartData> chartData = [
      ChartData('David', 40, Color.fromRGBO(9, 0, 136, 1)),
      ChartData('Steve', 90, Color.fromRGBO(147, 0, 119, 1)),
    ];
    return Scaffold(
      appBar: FHAppWidget.appBar(context, "fithouse", FHColor.appColor, true),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "YOUR RESULTS",
                style: TextStyle(
                  color: FHColor.blackColor,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
              Dimens.height(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Shapes.container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    bgColor: FHColor.whiteColor,
                    child: Column(
                      children: [
                        Dimens.height(10),
                        const Text(
                          "Our nutritionist-approved algorithm suggest the following calories breakdown for you",
                          style: TextStyle(
                            color: FHColor.theme2Color,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            letterSpacing: 2,
                          ),
                        ),
                        Dimens.height(60),
                        SizedBox(
                          height: SizeConfig.height / 7,
                          child: Stack(
                            children: [
                              SfCircularChart(
                                  margin: EdgeInsets.all(0),
                                  // legend: Legend(
                                  //     isVisible: true,
                                  //     alignment: ChartAlignment.center,
                                  //     position: LegendPosition.bottom,
                                  //     padding: 0,
                                  //     iconWidth: 0,
                                  //     itemPadding: 0
                                  //     // width: '0',
                                  //     // height: '0'
                                  //     ),
                                  // tooltipBehavior: TooltipBehavior(enable: false),

                                  palette: [
                                    Colors.green,
                                    Colors.grey.shade400,
                                  ],
                                  // borderColor: Colors.red,
                                  // borderWidth: 10,
                                  // backgroundColor: Colors.yellow,
                                  // centerX: '0%',
                                  // centerY: '50%',

                                  series: <CircularSeries>[
                                    DoughnutSeries<ChartData, String>(
                                      dataSource: chartData,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                      radius: '200%',
                                      innerRadius: '90%',
                                      // pointColorMapper: (ChartData data, _) =>
                                      // data.color,
                                      startAngle: 270,
                                      endAngle: 90,
                                    )
                                  ]),
                              const Positioned(
                                top: 5,
                                left: 0,
                                right: 0,
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "1992",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: FHColor.appColor,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      "calories/day",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: FHColor.theme2Color,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Positioned(
                                  top: 70,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "1000 cal",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: FHColor.theme2Color,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "1000 cal",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: FHColor.theme2Color,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Target macrountrients range:",
                            style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Dimens.height(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  "130",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: FHColor.appColor,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  "Pro",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: FHColor.blackColor,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "81g - 122g",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: FHColor.theme2Color,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.black45,
                              height: 60,
                              width: 2,
                            ),
                            Column(
                              children: [
                                Text(
                                  "65g",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.orange.shade400,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                  ),
                                ),
                                const Text(
                                  "Pro",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: FHColor.blackColor,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                const Text(
                                  "81g - 122g",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: FHColor.theme2Color,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.black45,
                              height: 60,
                              width: 2,
                            ),
                            Column(
                              children: [
                                Text(
                                  "35g",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blueAccent.shade700,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                  ),
                                ),
                                const Text(
                                  "Pro",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: FHColor.blackColor,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                const Text(
                                  "81g - 122g",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: FHColor.theme2Color,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Dimens.height(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "-29 year old Male, 85kg, 176cm, lose weight ",
                              style: TextStyle(
                                color: FHColor.theme2Color,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                              ),
                            ),
                            // Shapes.container(
                            //     border: const Border(bottom: BorderSide(width: 0.5)),
                            //     padding: EdgeInsets.zero,
                            //     child: const Icon(Icons.edit,size: 13.5,)),
                            Shapes.container(
                              onTap: () {},
                              border: const Border(
                                  bottom: BorderSide(
                                      width: 1.5, color: FHColor.theme2Color)),
                              padding: EdgeInsets.zero,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 13,
                                    color: FHColor.theme2Color,
                                  ),
                                  Text(
                                    'edit',
                                    style: TextStyle(
                                      color: FHColor.theme2Color,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Dimens.height(10),
                      ],
                    )),
              ),
              Dimens.height(10),
              Shapes.container(
                  bgColor: FHColor.whiteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "MENU",
                        style: TextStyle(
                          color: FHColor.blackColor,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                      Dimens.height(5),
                      const Text(
                        "-29 year old Male, 85kg, 176cm, lose weight ",
                        style: TextStyle(
                          color: FHColor.theme2Color,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      CustomTabView(
                        selectedLabelColor: FHColor.appColor,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: FHColor.appColor,
                              width: 2,
                            ),
                          ),
                        ),
                        height: MediaQuery.sizeOf(context).height / 4,
                        initPosition: 0,
                        itemCount: cubit.data.length,
                        tabBuilder: (context, index) =>
                            Tab(text: cubit.data[index]["date"]),
                        pageBuilder: (context, index) => Center(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 300,
                                            mainAxisExtent: 100,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing:
                                                20 // Width to height ratio of each item
                                            ),
                                    // shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: cubit.data[index]["food"].length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (contex, idx) {
                                      var data = cubit.data[index]["food"];
                                      return Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                // BoxShape.circle or BoxShape.retangle
                                                //color: const Color(0xFF66BB6A),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 15.0,
                                                      offset: Offset(1, 2),
                                                      spreadRadius: 1),
                                                ]),
                                            child: RemoteImage(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              width: 80,
                                              height: 80,
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
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: FHColor.theme2Color,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    }))),
                        onPositionChange: (index) {
                          cubit.changeDateIdx(index);
                          print('current position das: $index');
                          cubit.initPosition = index;
                        },
                        onScroll: (position) {
                          // cubit.initPosition = position;
                          print(' $position');
                        },
                      ),
                    ],
                  )),
              Dimens.height(10),
              const Text(
                "Your Package",
                style: TextStyle(
                  color: FHColor.theme2Color,
                  fontFamily: 'Bebas Neue',
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
              Dimens.height(5),
              DropdownButtonCustom(
                dropdownValue: cubit.selectedMeal,
                hintText: "select Meals",
                textStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                list: cubit.meals,
                onChanged: (value) {
                  cubit.selectMeal(value!);
                },
              ),
              Dimens.height(10),
              DropdownButtonCustom(
                dropdownValue: cubit.selectedDays,
                hintText: "select",
                textStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                list: cubit.packageDay,
                onChanged: (value) async {

                  await cubit.selectDay(value!);
                  cubit.getMeals();
                },
              ),
              Dimens.height(10),
              Shapes.container(
                padding: EdgeInsets.zero,
                bgColor: Colors.grey.shade100,
                height: 400.0,
                child: BlocConsumer<RenewSubscriptionCubit,
                        RenewSubscriptionState>(
                    listener: (context, state) {
                      if(state is RenewSubscriptionInitialState){
                        cubit.getMeals();
                      }

                    },
                    builder: (context, snapshot) {
                  if (snapshot is RenewSubscriptionInitialState) {
                    cubit.getMeals();
                  } else if (snapshot is RenewSuccessState) {
                        return ListView.builder(
                            itemCount: cubit.list.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Shapes.container(
                                  onTap: () {
                                    AppData.totalAmount = cubit.list[index].price.toString();
                                    Navigator.pushNamed(

                                      context, RouteGenerator.customPackage);},
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.zero,
                                  width: 300.0,
                                  isShadow: true,
                                  borderRadius: BorderRadius.circular(20),
                                  bgColor: FHColor.whiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cubit.sliderData[index]
                                                ['start_date'],
                                            style: const TextStyle(
                                              color: FHColor.appColor,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Dimens.height(10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                cubit.list[index].productName ??
                                                    "N/A",
                                                style: const TextStyle(
                                                    color: FHColor.blackColor,
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              ),
                                              RemoteImage(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                width: 100,
                                                height: 70,
                                                fit: BoxFit.cover,
                                                imageUrl: cubit
                                                    .sliderData[index]["img"],
                                                // "https://ii1.pepperfry.com/media/catalog/product/j/u/800x880/jute-fabric-seating-stool-in-white-and-natural-colour-jute-fabric-seating-stool-in-white-and-natural-dpsphl.jpg",
                                              ),
                                            ],
                                          ),
                                          Dimens.height(20),
                                          Expanded(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                itemCount: cubit
                                                    .sliderData[index]['list']
                                                    .length,
                                                itemBuilder: (context, idx) {
                                                  return Row(
                                                    children: [
                                                      Icon(Icons.check,
                                                          color:
                                                              FHColor.appColor),
                                                      Dimens.width(20),
                                                      Expanded(
                                                        child: Text(
                                                          cubit
                                                              .sliderData[index]
                                                                  ['list'][idx]
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                }),
                                          ),
                                          Dimens.height(20),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                cubit.sliderData[index]
                                                    ['price'],
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.red.shade900,
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 24),
                                              )),
                                          Dimens.height(10),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: RichText(
                                                text: TextSpan(
                                                    text:
                                                        cubit.list[index]
                                                           .price.toString(),
                                                    style: const TextStyle(
                                                        color: FHColor.appColor,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 26),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: ' /MONTH',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey.shade900,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 26),
                                                      )
                                                    ]),
                                              )),
                                          Text(
                                            cubit.sliderData[index]['tax'],
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          )
                                        ]),
                                  ));
                            });
                      } else if (snapshot is RenewSubscriptionLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: FHColor.appColor),
                        );
                      }
                      else{  return const Center(
                        child: Text("Meals Not found"),
                      );}
                    return Container();
                    }),
              ),
              Dimens.height(10),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:fithouse_app/presentation/pages/Home/cubit/home_cubit.dart';
import 'package:fithouse_app/presentation/pages/signup/calculating_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:lottie/lottie.dart';

import '../../../config/size_config.dart';
import '../../../utils/App_data.dart';
import '../../../utils/route_generator.dart';
import '../../themes/dimens.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/custum_tab_view.dart';
import '../../widgets/f_h_back_app_bar.dart';
import '../../widgets/remote_image.dart';
import '../../widgets/shapes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.watch<HomeCubit>();
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<HomeCubit, HomeCreateState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeCreateInitial) {
              cubit.checkData();
              return SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lottie/fithouse_loader.json'),
                      const Text(
                        "Plase Wait......",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            else if (state is HomeSuccessState) {
              return AppData.subscriptionStatus == "Active"
                  ?

                   Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Dimens.height(10),
                        Text(
                          "Welcome Back ${AppData.userDetails!.fullName}",
                          style: const TextStyle(
                            color: FHColor.appColor,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          // DateFormat('EEEE').format(DateTime.now()),
                          AppData.homeData!.packageName.toString(),
                          style: const TextStyle(
                            color: FHColor.blackColor,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            letterSpacing: 2,
                          ),
                        ),
                        CustomTabView(
                          decoration:
                          const BoxDecoration( border: Border(
                              bottom: BorderSide(
                                color: FHColor.appColor,
                                width: 2,
                              ),
                            ),
                              // color: widget.bgColor
                          ),
                          selectedLabelColor: FHColor.appColor,
                          height: MediaQuery.sizeOf(context).height/1.6,
                          labelPadding: EdgeInsets.symmetric(horizontal: 10),
                          initPosition: cubit.initPosition,
                          itemCount: state.homeData.meals!.length,
                          tabBuilder: (context, index) =>
                              Tab(text: state.homeData.meals![index].date),
                          pageBuilder: (context, index) => Center(
                              child: RefreshIndicator(
                            onRefresh: () async {
                              // await controller.initFunction();
                            },
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: state.homeData.meals![cubit.dateIndex]
                                  .daysMeal!.length,
                              itemBuilder: (ctx, index) {
                                var data =
                                    state.homeData.meals![cubit.dateIndex];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Dimens.height(10),
                                    Text(
                                      data.daysMeal![index].a.toString(),
                                      style: const TextStyle(
                                        color: FHColor.blackColor,
                                        fontFamily: 'BebasNeue',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      // physics: ClampingScrollPhysics(),
                                      itemCount:
                                          data.daysMeal![index].name!.length,
                                      // state.homeData.meals!.length,
                                      // separatorBuilder: (ctx, index) {
                                      //   return const Divider(
                                      //     height: 0.0,
                                      //   );
                                      // },
                                      itemBuilder: (ctx, idx) {
                                        var data1 =
                                            data.daysMeal![index].name![idx];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Shapes.container(
                                            border: Border.all(width: 0.2),
                                            padding: EdgeInsets.zero,
                                            bgColor: Colors.white,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const RemoteImage(
                                                  width: 100,
                                                  height: 120,
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      "https://images.immediate.co.uk/production/volatile/sites/30/2022/07/Fajita-style-pasta-f792c52.jpg?quality=90&resize=440,400",
                                                  // "https://ii1.pepperfry.com/media/catalog/product/j/u/800x880/jute-fabric-seating-stool-in-white-and-natural-colour-jute-fabric-seating-stool-in-white-and-natural-dpsphl.jpg",
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                data1.carb ??
                                                                    "N/A",
                                                                style:
                                                                    const TextStyle(
                                                                  color: FHColor
                                                                      .blackColor,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      1,
                                                                ),
                                                              ),
                                                            ),
                                                            const Icon(
                                                              Icons.edit,
                                                              size: 15,
                                                              color:
                                                                  Colors.grey,
                                                            )
                                                          ],
                                                        ),
                                                        Dimens.height(5),
                                                        Text(
                                                          data1.carb ?? "N/A",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 10,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        const Text(
                                                          "601Kcal",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 12,
                                                            letterSpacing: 2,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RichText(
                                                              text: TextSpan(
                                                                  text: '-',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                  children: <TextSpan>[
                                                                    TextSpan(
                                                                      text: data
                                                                          .carb,
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            2,
                                                                      ),
                                                                    )
                                                                  ]),
                                                            ),
                                                            RichText(
                                                              text: TextSpan(
                                                                  text: '-',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                  children: <TextSpan>[
                                                                    TextSpan(
                                                                      text: data
                                                                          .protein,
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            2,
                                                                      ),
                                                                    )
                                                                  ]),
                                                            ),
                                                            RichText(
                                                              text: TextSpan(
                                                                  text: '-',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  children: <TextSpan>[
                                                                    TextSpan(
                                                                      text: data
                                                                          .carb,
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            2,
                                                                      ),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ],
                                                        )
                                                        // ListTile(
                                                        //   title: Text(state
                                                        //       .homeData
                                                        //       .meals![index]
                                                        //       .meal1!
                                                        //       .carb
                                                        //       .toString()),
                                                        //   subtitle: Text(state
                                                        //       .homeData
                                                        //       .meals![index]
                                                        //       .meal1!
                                                        //       .protein
                                                        //       .toString()),
                                                        // ),
                                                        // ListTile(
                                                        //   title: Text("601kcal"),
                                                        //   subtitle: Row(
                                                        //
                                                        //     children: [
                                                        //       Text(state
                                                        //           .homeData
                                                        //           .meals![index]
                                                        //           .carb
                                                        //           .toString()),
                                                        //       SizedBox(width: 10,),
                                                        //       Text(state
                                                        //           .homeData
                                                        //           .meals![index]
                                                        //           .protein
                                                        //           .toString()),
                                                        //     ],
                                                        //   ),
                                                        // )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );

                                //   Shapes.container(
                                //   // borderRadius: BorderRadius.circular(10),
                                //   padding: EdgeInsets.all(5),
                                //   onTap: () {
                                //     // Navigator.push(
                                //     //   context,
                                //     //   MaterialPageRoute(
                                //     //       builder: (context) =>
                                //     //           OrderDetailPage(order: data)),
                                //     // );
                                //     // Navigator.pushNamed(context, GenRouter.orderList);
                                //   },
                                //   // onTap: () {
                                //   //   // _showOrderDetails(context, locationController);
                                //   // },
                                //   bgColor: Colors.white,
                                //   // border: Border(bottom: BorderSide(width: 0.3)),
                                //   // isShadow: true,
                                //   child: Row(
                                //     children: [
                                //       Expanded(
                                //         child: Column(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.start,
                                //           children: [
                                //             Row(
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 Padding(
                                //                   padding: EdgeInsets.all(8.0),
                                //                   child: RemoteImage(
                                //                       width: 100,
                                //                       height: 120,
                                //                       fit: BoxFit.cover,
                                //                       imageUrl:
                                //                           "https://images.immediate.co.uk/production/volatile/sites/30/2022/07/Fajita-style-pasta-f792c52.jpg?quality=90&resize=440,400",
                                //                       // "https://ii1.pepperfry.com/media/catalog/product/j/u/800x880/jute-fabric-seating-stool-in-white-and-natural-colour-jute-fabric-seating-stool-in-white-and-natural-dpsphl.jpg",
                                //                       borderRadius:
                                //                           BorderRadius.circular(
                                //                               10)),
                                //                 ),
                                //                 Expanded(
                                //                   child: Padding(
                                //                     padding:
                                //                         const EdgeInsets.all(8.0),
                                //                     child: Column(
                                //                       mainAxisAlignment:
                                //                           MainAxisAlignment.center,
                                //                       crossAxisAlignment:
                                //                           CrossAxisAlignment.start,
                                //                       children: [
                                //
                                //                         Text(data["a"])
                                //                         // ListTile(
                                //                         //   title: Text(state
                                //                         //       .homeData
                                //                         //       .meals![index]
                                //                         //       .meal1!
                                //                         //       .carb
                                //                         //       .toString()),
                                //                         //   subtitle: Text(state
                                //                         //       .homeData
                                //                         //       .meals![index]
                                //                         //       .meal1!
                                //                         //       .protein
                                //                         //       .toString()),
                                //                         // ),
                                //                         // ListTile(
                                //                         //   title: Text("601kcal"),
                                //                         //   subtitle: Row(
                                //                         //
                                //                         //     children: [
                                //                         //       Text(state
                                //                         //           .homeData
                                //                         //           .meals![index]
                                //                         //           .carb
                                //                         //           .toString()),
                                //                         //       SizedBox(width: 10,),
                                //                         //       Text(state
                                //                         //           .homeData
                                //                         //           .meals![index]
                                //                         //           .protein
                                //                         //           .toString()),
                                //                         //     ],
                                //                         //   ),
                                //                         // )
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 )
                                //               ],
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //       const Icon(
                                //         Icons.arrow_forward_ios_sharp,
                                //         size: 15,
                                //       )
                                //     ],
                                //   ),
                                // );
                              },
                            ),
                          )),
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
                    ):

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Dimens.height(10),
                    Row(
                      children: [
                        Text(
                          "We missed you,${AppData.userDetails?.fullName ?? "N/A"} ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                            // fontSize: 15 ,
                            letterSpacing: 2,
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: FHColor.appColor,
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 3,
                    ),
                    const ListTile(
                      title: Row(
                        children: [
                          Text("Ready to renew? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto Condensed',
                                fontWeight: FontWeight.w800,
                                // fontSize: 15 ,
                                letterSpacing: 2,
                              )),
                          Icon(
                            Icons.local_fire_department_sharp,
                            color: Colors.orange,
                          )
                        ],
                      ),
                      subtitle: Text(
                          "Get your hands on delicious meals made for you!",
                          style: TextStyle(
                            // color: Colors.black,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            letterSpacing: 2,
                          )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Shapes.container(
                        isShadow: true,
                        bgColor: Colors.white,
                        child: const Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 60),
                                  child: Text("See what’s cookin’",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto Condensed',
                                        fontWeight: FontWeight.w800,
                                        // fontSize: 15 ,
                                        letterSpacing: 2,
                                      )),
                                )),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FHColor.appColor,
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child:

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // foregroundColor: isMobileNumberEntered?FHColor.appColor:Colors.white54,
                            backgroundColor: FHColor.appColor,

                            // Text Color (Foreground color)
                            side: const BorderSide(
                                width: 0, color: FHColor.appColor),
                            //border width and color
                            elevation: 3,
                            //elevation of button
                            shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(15)),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteGenerator.renewSubscription);
                        },
                        child: const Text(
                          "RENEW MY SUBSCRIPSTIONS",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return SizedBox(
                height: 500,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          // height: 500,
                          width: 200,
                          child: Lottie.asset(
                              'assets/lottie/fithouse_loader.json')),

                    ],
                  ),
                ),
              );
            }
          }),
    ));
    //   Scaffold(
    //   appBar: FHAppWidget.appBar(context, "FitHouse"),
    //   body:
    //   SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //         Dimens.height(10),
    //
    //         Text(
    //           "Welcome Back ${getName().toString()}",
    //           style: const TextStyle(
    //             color: FHColor.appColor,
    //             fontFamily: 'BebasNeue',
    //             fontWeight: FontWeight.w600,
    //             fontSize: 18,
    //             letterSpacing: 2,
    //           ),
    //         ), Text(
    //           DateFormat('EEEE').format(DateTime.now()),
    //           style: const TextStyle(
    //             color: FHColor.blackColor,
    //             fontFamily: 'BebasNeue',
    //             fontWeight: FontWeight.w700,
    //             fontSize: 20,
    //             letterSpacing: 2,
    //           ),
    //         ),
    //         const DefaultTabController(
    //
    //           length: 7,
    //           initialIndex: 0,
    //           child:
    //           SizedBox(
    //             height: 50,
    //             child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //
    //                   TabBar(indicatorColor: Colors.green,
    //                     labelColor: Colors.green, //<-- selected text color
    //                     unselectedLabelColor: Colors.black,
    //                     isScrollable: true,
    //                     tabs: <Widget>[
    //                       Tab(
    //                         child: Text(
    //                           "OCT 05",
    //                           style: TextStyle(
    //                             color: FHColor.blackColor,
    //                             fontFamily: 'BebasNeue',
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 20,
    //                             letterSpacing: 1,
    //                           ),
    //                         ),
    //                       ),
    //                       Tab(
    //                         child: Text(
    //                           "OCT 06",
    //                           style: TextStyle(
    //                             color: FHColor.blackColor,
    //                             fontFamily: 'BebasNeue',
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 20,
    //                             letterSpacing: 1,
    //                           ),
    //                         ),
    //                       ),
    //                       Tab(
    //                         child: Text(
    //                           "OCT 07",
    //                           style: TextStyle(
    //                             color: FHColor.blackColor,
    //                             fontFamily: 'BebasNeue',
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 20,
    //                             letterSpacing: 1,
    //                           ),
    //                         ),
    //                       ),
    //                       Tab(
    //                         child: Text(
    //                           "OCT 08",
    //                           style: TextStyle(
    //                             color: FHColor.blackColor,
    //                             fontFamily: 'BebasNeue',
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 20,
    //                             letterSpacing: 1,
    //                           ),
    //                         ),
    //                       ),   Tab(
    //                         child: Text(
    //                           "OCT 09",
    //                           style: TextStyle(
    //                             color: FHColor.blackColor,
    //                             fontFamily: 'BebasNeue',
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 20,
    //                             letterSpacing: 1,
    //                           ),
    //                         ),
    //                       ),
    //                       Tab(
    //                         child: Text(
    //                           "OCT 10",
    //                           style: TextStyle(
    //                             color: FHColor.blackColor,
    //                             fontFamily: 'BebasNeue',
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 20,
    //                             letterSpacing: 1,
    //                           ),
    //                         ),
    //                       ),  Tab(
    //                         child: Text(
    //                           "OCT 11",
    //                           style: TextStyle(
    //                             color: FHColor.blackColor,
    //                             fontFamily: 'BebasNeue',
    //                             fontWeight: FontWeight.w500,
    //                             fontSize: 20,
    //                             letterSpacing: 1,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Expanded(
    //                     // height: SizeConfig.screenHeight / 1.5,
    //                     child: TabBarView(children: <Widget>[
    //                       Text("hello"),
    //                       Text("hello"),
    //                       Text("hello"), Text("hello"),
    //                       Text("hello"),
    //                       Text("hello"),
    //                       Text("hello"),
    //                     ]),
    //                   )
    //                 ]),
    //           ),
    //         )
    //     ],
    //   ),
    //       )),
    // );
  }

  getName() async {
    final LocalStorage storage = LocalStorage('user-info');
    var data = await jsonDecode(storage.getItem('info'))!;
    print(data);
    return data["full_name"];
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';

import '../../themes/dimens.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_back_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Dimens.height(10),
          FutureBuilder(
            future: getName(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  "Welcome Back ${snapshot.data ?? "N/A".toString()}",
                  style: const TextStyle(
                    color: FHColor.appColor,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                );
              } else if (snapshot.hasError)
                return Text(snapshot.error.toString());
              return Text("Await for data");
            },
          ),
          Text(
            DateFormat('EEEE').format(DateTime.now()),
            style: const TextStyle(
              color: FHColor.blackColor,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              letterSpacing: 2,
            ),
          ),
          const DefaultTabController(
            length: 7,
            initialIndex: 0,
            child: SizedBox(
              height: 50,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TabBar(
                      indicatorColor: Colors.green,
                      labelColor: Colors.green, //<-- selected text color
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            "OCT 05",
                            style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "OCT 06",
                            style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "OCT 07",
                            style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "OCT 08",
                            style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "OCT 09",
                            style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "OCT 10",
                            style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "OCT 11",
                            style: TextStyle(
                              color: FHColor.blackColor,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      // height: SizeConfig.screenHeight / 1.5,
                      child: TabBarView(children: <Widget>[
                        Text("hello"),
                        Text("hello"),
                        Text("hello"),
                        Text("hello"),
                        Text("hello"),
                        Text("hello"),
                        Text("hello"),
                      ]),
                    )
                  ]),
            ),
          )
        ],
      ),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/f_h_colors.dart';

class ModelSheet{

  // static void alertDialog(BuildContext context,String title, String subtitle) {
  //   // set up the button
  //   Widget onWifi = TextButton(
  //     child: Text("Open Wifi"),
  //     onPressed: ()async {
  //       bool setting = await PlatformService.openWifiSettings();
  //       if(!setting){
  //         Navigator.pop(context);
  //
  //       }
  //     },
  //   );
  //
  //   Widget onData = TextButton(
  //     child: Text("Open Data"),
  //     onPressed: ()async {
  //       bool setting = await PlatformService.openDataSettings();
  //       if(!setting){
  //         Navigator.pop(context);
  //
  //       }
  //     },
  //   );
  //
  //   Widget onCancel = TextButton(
  //     child: Text("Cancel"),
  //     onPressed: ()async {
  //       Navigator.pop(context);
  //     },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text(title,style: ThemeConfig.lightText.titleMedium,),
  //     content: Text(subtitle,style: ThemeConfig.lightText.bodySmall,),
  //     actions: [
  //       onData,
  //       onWifi,
  //       onCancel,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  static Future<bool> showAlertDialog(
      {required BuildContext context, required String title, required Widget child,required List<Widget>? actions}) async{
    bool? pop = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: const TextStyle(
            color: FHColor.theme2Color,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),),
          content: child,
          actions: actions,
        );
      },);
    return pop!;
  }


  static void showMBottomSheet({required BuildContext context,required double height,required Widget child, bool willPop = false, bool draggable = false}){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: WillPopScope(
              onWillPop: () async => willPop,
              child: SizedBox(
                height: height+80,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitUp,
                                  DeviceOrientation.portraitDown,
                                ]);
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: child
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        ));


  }


}
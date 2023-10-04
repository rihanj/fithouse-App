import 'package:flutter/material.dart';

import '../themes/f_h_colors.dart';

class FHWidget{

  static PreferredSizeWidget appBar(BuildContext context,String title,{bool? isReturn}){

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text("fithouse".toUpperCase(),style: TextStyle(
        fontFamily: 'BebasNeue',
        fontWeight: FontWeight.w700,
        fontSize: 30,
        letterSpacing: 2,
        color: FHColor.appColor,
      ),),
      toolbarHeight: 80,
      centerTitle: false,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.flag,color: FHColor.appColor,size: 24,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.language,color: FHColor.appColor,size: 24,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.support_agent,color: FHColor.appColor,size: 24,)),
      ],
    );
  }
}
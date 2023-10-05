import 'package:flutter/material.dart';

import '../themes/f_h_colors.dart';

class FHAppWidget{

  static PreferredSizeWidget appBar(BuildContext context,String title,{bool? isReturn}){
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      leading:
      IconButton(
        iconSize: 24,
        color: FHColor.appColor,
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      title: Text(
        "fithouse".toUpperCase(),
        style: const TextStyle(
          fontFamily: 'BebasNeue',
          fontWeight: FontWeight.w700,
          fontSize: 30,
          letterSpacing: 2,
          color: FHColor.appColor,
        ),
      ),
      toolbarHeight: 80,
      centerTitle: true,
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.support_agent,
                color: FHColor.appColor,
                size: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                'Help',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: FHColor.appColor,

                ),
              ),
            ),
          ],
        ),
      ],
    );

  }
}
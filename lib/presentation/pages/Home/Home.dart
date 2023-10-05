import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_back_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FHAppWidget.appBar(context, "FitHouse"),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            DateFormat('EEEE').format(DateTime.now()),
            style: const TextStyle(
              color: FHColor.whiteColor,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.w700,
              fontSize: 120,
              letterSpacing: 2,
            ),
          ),
        ],
      )),
    );
  }
}

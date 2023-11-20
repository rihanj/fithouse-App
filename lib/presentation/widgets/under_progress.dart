import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../config/app_const.dart';

class UnderProgress extends StatelessWidget {
  const UnderProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AppConst.under_progress),);
  }
}

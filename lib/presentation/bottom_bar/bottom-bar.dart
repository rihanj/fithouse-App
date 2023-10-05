import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/Home/Home.dart';
import '../themes/f_h_colors.dart';
import '../widgets/f_h_back_app_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FHAppWidget.appBar(context, "FitHouse"),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          color: FHColor.appColor,
          fontFamily: 'BebasNeue',
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'BebasNeue',
        ),
        selectedItemColor: FHColor.appColor,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() => currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.delivery_dining,
                size: 20,
              ),
              label: 'Delivery'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.stacked_bar_chart,
                size: 20,
              ),
              label: 'Progress'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.headset_mic_outlined,
                size: 20,
              ),
              label: 'Support'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 20,
              ),
              label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const Center(child: Text('Search'));
      case 2:
        return const Center(child: Text('Account'));
      case 3:
        return const Center(child: Text('Account'));
      default:
        return const Center(child: Text('Default'));
    }
  }
}

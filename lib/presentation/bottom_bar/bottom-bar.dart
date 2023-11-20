import 'package:fithouse_app/presentation/pages/Home/cubit/home_cubit.dart';
import 'package:fithouse_app/presentation/pages/profile/cubit/profile_screen_cubit.dart';
import 'package:fithouse_app/presentation/pages/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../pages/Home/Home.dart';
import '../themes/f_h_colors.dart';
import '../widgets/f_h_back_app_bar.dart';
import '../widgets/under_progress.dart';


class BottomBar extends StatefulWidget {
  // final String title;

  const BottomBar({Key? key}) : super(key: key);

  // final BaseAuth auth;
  // final VoidCallback onSignedOut;
  // final String userId;

  @override
  State<StatefulWidget> createState() => new _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  String _title = "";
  Color _color = FHColor.appColor;

  final List<Widget> _children = [
    BlocProvider(create: (context) => HomeCubit(), child: Home()),
    // BlocProvider(create: (context) => HomeCubit(), child: Home()),
    // BlocProvider(create: (context) => HomeCubit(), child: Home()),
    UnderProgress(), UnderProgress(),
    BlocProvider(
        create: (context) => ProfileScreenCubit(), child: ProfileScreen()),
  ];

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  initState() {
    _title = 'fithouse';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: _scaffoldKey,
        appBar: FHAppWidget.appBar(context, _title, _color,false),
        // AppBar(
        //   title: Text(
        //     _title!,
        //     style: TextStyle(color: Colors.black),
        //   ),
        //   backgroundColor: Colors.white,
        // ),
        // endDrawer: AppDrawer(),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(
            color: FHColor.appColor,
            fontFamily: 'Roboto',
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
          selectedItemColor: FHColor.appColor,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
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
                  size: 22,
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
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _color = FHColor.appColor;
            _title = 'fithouse';
          }
          break;
        case 1:
          {
            _title = 'Progress';
          }
          break;
        case 2:
          {
            _title = 'Support';
          }
          break;
        case 3:
          {
            _color = Colors.black;
            _title = 'Profile';
          }
          break;
      }
    });
  }
}

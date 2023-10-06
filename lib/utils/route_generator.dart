import 'package:fithouse_app/presentation/pages/onboarding/on_bording_page.dart';
import 'package:fithouse_app/presentation/pages/signup/birthday_picker.dart';
import 'package:fithouse_app/presentation/pages/signup/current_weight.dart';
import 'package:fithouse_app/presentation/pages/signup/dietary_plan.dart';
import 'package:fithouse_app/presentation/pages/signup/fitness_goal.dart';
import 'package:fithouse_app/presentation/pages/signup/select_gender.dart';
import 'package:fithouse_app/presentation/pages/signup/active_list.dart';
import 'package:fithouse_app/presentation/pages/signup/signup_ui.dart';
import 'package:fithouse_app/presentation/pages/signup/target_weight.dart';
import 'package:flutter/material.dart';
import '../presentation/bottom_bar/bottom-bar.dart';
import '../presentation/pages/Home/Home.dart';
import '../presentation/pages/login/login_ui.dart';
// import '../presentation/pages/login/login_otp.dart';
import '../presentation/pages/onboarding/on_bording_screen.dart';
import '../presentation/pages/signup/delivery_location.dart';
import '../presentation/pages/signup/confirm_location.dart';
import '../presentation/pages/signup/not_eat.dart';
import '../presentation/pages/signup/otp.dart';
import '../presentation/widgets/page_navigation/page_navigation.dart';

class RouteGenerator {
  static const String loginRoute = "/login";
  static const String signupRoute = "/signup";
  static const String aftersignup = "/otp";
  static const String deliveryRoute = "/delivery_location";
  static const String confirmRoute = "/confirm_location";
  static const String fitnessRoute = "/fitness_goal";
  static const String onBoardsRoute = "/onBoardsRoute";
  static const String currentWeightRoute = "/current_weight";
  static const String targetWeightRoute = "/target_weight";
  static const String birthdayRoute = "/birthdayRoute";
  static const String genderRoute = "/genderRoute";
  static const String activeRoute = "/activeRoute";
  static const String notEatRoute = "/notEatRoute";
  static const String dietaryRoute = "/dietaryRoute";
  static const String afterLogin = "/Home";
  static const String bottomBar = "/BottomBar";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardsRoute:
        return PageNavigation.push(OnbordingScreen(), false);
      case loginRoute:
        return PageNavigation.push(LoginUI(), false);
      case signupRoute:
        return PageNavigation.push(SignupUI(), false);
      case aftersignup:
        return PageNavigation.push(Otp(), false);
      case deliveryRoute:
        return PageNavigation.push(DeliveryLocation(), false);
      case confirmRoute:
        return PageNavigation.push(GoogleMapScreen(), false);
      case fitnessRoute:
        return PageNavigation.push(FitnessGoal(), false);
      case currentWeightRoute:
        return PageNavigation.push(CurrentWeight(), false);
      case targetWeightRoute:
        return PageNavigation.push(TargetWeight(), false);
      case birthdayRoute:
        return PageNavigation.push(BirthdayPicker(), false);
      case genderRoute:
        return PageNavigation.push(GenderSelection(), false);
      case activeRoute:
        return PageNavigation.push(ActiveList(), false);
      case notEatRoute:
        return PageNavigation.push(MultiSelectableContainers(), false);
      case dietaryRoute:
        return PageNavigation.push(DietaryPlan(), false);

      case bottomBar:
        return PageNavigation.push(BottomBar(), false);

      case afterLogin:
        return PageNavigation.push(Home(), false);
      default:
        return MaterialPageRoute(
            builder: (ctx) => const Center(
                  child: Text("Under Maintenance"),
                ));
    }
  }
}

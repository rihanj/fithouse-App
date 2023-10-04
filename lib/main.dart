import 'package:fithouse_app/data/data_provider/cache_service_imp.dart';
import 'package:fithouse_app/presentation/pages/onboarding/on_bording_screen.dart';
import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:fithouse_app/utils/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      home:  SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1200)).then((value) {
      Future.delayed(Duration(milliseconds: 1200)).then((value) async{

        bool isLogin = await CacheServiceImp().isLogin();
        if(isLogin){
          Navigator.pushNamed(context, RouteGenerator.deliveryRoute);
        }else{
          Navigator.pushNamed(context, RouteGenerator.onBoardsRoute);
        }

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FHColor.appColor,
      body: Center(
        child:  Text("fithouse".toUpperCase(),style: TextStyle(
          fontFamily: 'BebasNeue',
          fontWeight: FontWeight.w700,
          fontSize: 42,
          letterSpacing: 5,
          color: Colors.white,
          ),
      ),
      ),
    );
  }
}

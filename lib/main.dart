import 'package:fithouse_app/config/js_log.dart';
import 'package:fithouse_app/data/data_provider/cache_service_imp.dart';

import 'package:fithouse_app/presentation/themes/f_h_colors.dart';
import 'package:fithouse_app/utils/App_data.dart';
import 'package:fithouse_app/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'config/size_config.dart';

import 'generated/l10n.dart';
import 'presentation/pages/profile/cubit/profile_screen_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51O8mKZSEqDWMRZMoThDkU0quinpgSOqg1NwHjV0rGKhTEIPQeZUWzhQKcZkaaZGCJotqaFj1TdeVre3wpKoT2lGy0076pZc974";

  Stripe.merchantIdentifier = 'vinit';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (ctx) => ProfileScreenCubit())],
      child: BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
          builder: (context, state) {
        Locale locale = Locale('en');
        if (state is LanguageChange) {
          locale = state.local;
        }
        JSLog.tagInfo(tag: "BlocLanguage", msg: locale);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: locale,
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
          home: SplashPage(),
        );
      }),
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
      Future.delayed(Duration(milliseconds: 1200)).then((value) async {
        bool isLogin = await CacheServiceImp().isLogin();
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        if (isLogin) {
          AppData.userDetails = await CacheServiceImp().getUserDetails();
          Navigator.of(context).pushNamedAndRemoveUntil(
              RouteGenerator.bottomBar, (Route<dynamic> route) => false);
        } else {
          Navigator.pushNamed(context, RouteGenerator.onBoardsRoute);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: FHColor.appColor,
      body: Center(
        child: Text(
          "fithouse".toUpperCase(),
          style: const TextStyle(
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

import 'package:fithouse_app/presentation/widgets/f_h_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../config/size_config.dart';
import '../../../utils/route_generator.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_themes.dart';

class OnbordingScreen extends StatefulWidget {
  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  // const OnboardingScreen({super.key});
  final PageController _pageController = PageController(initialPage: 0);

  final int _numPages = 5;

  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 26.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? FHColor.appColor : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
        backgroundColor: FHColor.whiteColor,
        appBar: FHWidget.appBar(context, "FitHouse"),
        body:
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                const FirstOnboardingScreen(title: '',),
                SecondOnboardingScreen(),
                ThirdOnboardingScreen(),
                FourthOnboardingScreen(),
                FifthOnboardingScreen(),
                SixthOnboardingScreen(),
                // Add more screens here
              ],
            ),
            Visibility(
              visible: _currentPage==5?false:true,
              child: Positioned(
                left: 0,
                right: 0,
                bottom: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
            ),
            //get started button here
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 10, top: 350),
                height:60, //height of button
                width:400, //width of button
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: FHColor.appColor,
                  onPressed: () {
                    Navigator.pushNamed(context, RouteGenerator.signupRoute);
                  },
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            //login button here
            Align(
              alignment:Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(left: 15, right: 10,bottom: 20),
                  height:60, //height of button
                  width:400, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: _currentPage==0?Colors.transparent:Colors.white, // Text Color (Foreground color)
                        side: BorderSide(width:2, color:_currentPage==0?Colors.white:FHColor.appColor), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10)
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, RouteGenerator.loginRoute);
                      },
                      child: Text("LOG IN",
                          style: TextStyle(fontSize: 22,color: _currentPage==0?Colors.white:FHColor.appColor )
                      ),
                  )
              ),
            ),
          ],
        )
    );
  }
}

class FirstOnboardingScreen extends StatefulWidget {

  const FirstOnboardingScreen({super.key, required String title});

  @override
  _FirstOnboardingScreenState createState() => _FirstOnboardingScreenState();

}

class _FirstOnboardingScreenState extends State<FirstOnboardingScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the video player and set the video path
    _controller = VideoPlayerController.asset('assets/video/screen_one.mp4');

    // Initialize the video player future
    _initializeVideoPlayerFuture = _controller.initialize();

    // Start playing the video when it has finished initializing
    _controller.play();
  }

  @override
  void dispose() {
    // Ensure to dispose the video player when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the video player has finished initialization, display the video
          return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.height,
                  width: SizeConfig.width,
                  child: VideoPlayer(_controller)
                ),
                //text in first onbording screen
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      Text(
                        'MEAL PLANS FOR BUSY PEOPLE',
                        style: AppTheme.textH2,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Our meal plans are cooked with love & portioned to suit your body,fitness goal and taste buds.',
                        style: AppTheme.hintTextStyle,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ],
          );
        } else {
            // Otherwise, display a loading spinner until the video is initialized
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class SecondOnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        //text in second onbording screen
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/slider1.png',
                  ),
                  height: 300,
                  width: 1200,
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Choose',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28)), /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: ' your', style: TextStyle(color: FHColor.appColor ,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28))),
                      TextSpan(
                          text: ' meals',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Select your meals from numerous variety of options every day',
                style: TextStyle(
                  color: Colors.black ,
                  fontFamily: "Roboto",
                  fontSize: getFont(14),
                  fontWeight: FontWeight.normal
                  ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ThirdOnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        //text in second onbording screen
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/slider2.png',
                  ),
                  height: 300,
                  width: 1200,
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Track',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28)), /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: ' and', style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28))),
                      TextSpan(
                          text: ' customize',
                          style: TextStyle(color: FHColor.appColor,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Our nutritional-approved algorithm will recommend your calorie-intake and give you the flexibility to be in control to customize',
                style: TextStyle(
                    color: Colors.black ,
                    fontFamily: "Roboto",
                    fontSize: getFont(14),
                    fontWeight: FontWeight.normal
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class FourthOnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        //text in second onbording screen
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/slider3.png',
                  ),
                  height: 300,
                  width: 1200,
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Skip/Pause',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28)), /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: ' anytime', style: TextStyle(color: FHColor.appColor ,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Got other plans? With full flexibility you can skip a day or even pause your subscription until you’re back',
                style: TextStyle(
                    color: Colors.black ,
                    fontFamily: "Roboto",
                    fontSize: getFont(14),
                    fontWeight: FontWeight.normal
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class FifthOnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        //text in second onbording screen
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/slider4.png',
                  ),
                  height: 300,
                  width: 1200,
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'We deliver to',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28)), /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: ' you', style: TextStyle(color: FHColor.appColor ,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'No additional fees. We deliver to your doorstep whether in the afternoon or the night before.',
                style: TextStyle(
                    color: Colors.black ,
                    fontFamily: "Roboto",
                    fontSize: getFont(14),
                    fontWeight: FontWeight.normal
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class SixthOnboardingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        //text in second onbording screen
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/boxing-tom-and-jerry.gif',
                  ),
                  height: 300,
                  width: 1200,
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'You’re still',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28)), /*defining default style is optional */
                    children: [
                      TextSpan(
                          text: ' here?', style: TextStyle(color: FHColor.appColor ,fontWeight: FontWeight.bold,fontFamily: "Roboto Condensed",fontSize: getFont(28))
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(Icons.emoji_emotions),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Let’s get started! We’ll do the cooking, you do you! \n \n Get in touch with us via support,if you have any questions ❤',

                style: TextStyle(
                    color: Colors.black ,
                    fontFamily: "Roboto",
                    fontSize: getFont(14),
                    fontWeight: FontWeight.normal
                ),
                textAlign: TextAlign.center,

              ),
            ],
          ),
        ),
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}



import 'package:fithouse_app/presentation/widgets/f_h_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../config/size_config.dart';
import '../../themes/f_h_colors.dart';
import '../../widgets/f_h_themes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
      backgroundColor: const Color(0xff28B17B),
      appBar: FHWidget.appBar(context, "FitHouse"),
      body:
       Stack(
          alignment: Alignment.center,
          children: <Widget>[
            FullScreenVideo(),
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
            ),
            //get started button here
            Padding(
              padding: const EdgeInsets.all(0),
               child: Container(
                 margin: EdgeInsets.only(left: 10, right: 10, top: 450),
                height:60, //height of button
                width:400, //width of button
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: FHColor.appColor,
                  onPressed: () {
                  // _pageController.nextPage(
                  //   duration: Duration(milliseconds: 500),
                  //   curve: Curves.ease,
                  // );
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
                  margin: EdgeInsets.only(left: 10, right: 10, top: 500,bottom: 20),
                  height:60, //height of button
                  width:400, //width of button
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent, // Text Color (Foreground color)
                            side: BorderSide(width:2, color:Colors.white), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.all(10)

                    ),
                    onPressed: (){},
                    child: Text("LOG IN",
                      style: TextStyle(fontSize: 22)
                    ),
                )
              ),
            ),
          ],
       )
    );
  }
}

class FullScreenVideo extends StatefulWidget {
  const FullScreenVideo({super.key});

  @override
  _FullScreenVideoState createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
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

  final int _numPages = 6;
  final PageController _pageController = PageController(initialPage: 0);
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
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? FHColor.appColor : Color(0xffFFA500),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
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
          return SizedBox(height: SizeConfig.height,width: SizeConfig.width,child: VideoPlayer(_controller));
        } else {
          // Otherwise, display a loading spinner until the video is initialized
          return const Center(child: CircularProgressIndicator());
        }
      },

    );
  }
}


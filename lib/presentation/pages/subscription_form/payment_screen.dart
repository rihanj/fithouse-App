import 'dart:convert';

import 'package:fithouse_app/utils/App_data.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:http/http.dart' as http;

import '../../../utils/route_generator.dart';

class PaymentScreen extends StatefulWidget {
  String?url;
  PaymentScreen({super.key, this.url});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(

        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            savePayment(url);
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
              Page resource error:
                code: ${error.errorCode}
                description: ${error.description}
                errorType: ${error.errorType}
                isForMainFrame: ${error.isForMainFrame}
            ''');
          },
          /* onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },*/
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.url!));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }


  @override
  Widget build(BuildContext context) {
    return WebViewWidget(

        controller: _controller);
  }

  Future<void> savePayment(String url) async {

    var headers = {
      'Content-Type': 'application/json',
    };


    // JSLog.tagInfo(tag: "url", msg: url);
    // JSLog.tagInfo(tag: "header", msg: headers);

    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        // Payment successful, handle the response accordingly
        print('Payment successful');
        print(json.decode(response.body));

        var data = json.decode(response.body);
        print(data["Success"]);
        if(data["Success"]){
          Navigator.pop(context);
          showDialog(context: context, builder: (context){
            return AlertDialog(
              actions: [ElevatedButton(onPressed: (){
                AppData.homeData =null;
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteGenerator.bottomBar,
                      (Route route) => false,
                );
              }, child: Text("Ok"))],
              content: Container(
                height: 100,
                child: Text("payment done "),

              ),
            );
          });
        }else{
          Navigator.pop(context);
          showDialog(context: context, builder: (context){
            return AlertDialog(
              content: Container(
                height: 100,
                child: Text("payment failed}"),
              ),
            );
          });
        }
      } else {
        // Payment failed, handle the error response
        print('Payment failed');
        print(json.decode(response.body));
      }
    } catch (error) {
      // Handle network errors
      print('Error: $error');
    }
  }
}


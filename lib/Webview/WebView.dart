import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:github/Utils/AppPalette.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {


  String webUrl="https://github.com/";
  String title="Github";

  WebViewPage({required this.webUrl, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}
class _WebViewPageState extends State<WebViewPage> {




  _WebViewPageState();


  final Completer<WebViewController> _controller = Completer<WebViewController>();




  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();




  }

  bool loading=true;


  @override
  Widget build(BuildContext context) {
    double Height= MediaQuery.of(context).size.height;
    double Width= MediaQuery.of(context).size.width;




    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.secondaryColor,
        elevation: 0,
        // titleSpacing: Width*.15,
        title: Text(widget.title,),


      ),

      body:Builder(builder: (BuildContext context) {
        return Stack(
          children: [
            WebView(
              initialUrl: widget.webUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },

              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },

              onPageStarted: (String url) {
                print('Page started loading: $url');

                setState(() {
                  loading=true;
                });




              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');

                setState(() {
                  loading=false;
                });

              },
              gestureNavigationEnabled: true,
            ),

            loading?Container(

              width: Width,
              height: Height,

              color: AppPalette.whiteColor,

              child: Center(


                child:  CircularProgressIndicator(),


              ),



            )  :Container()

          ],
        );
      }),

    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {

          ScaffoldMessenger.of(context).showSnackBar(  SnackBar(content: Text(message.message)));

        });
  }
}




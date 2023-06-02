import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WebViewExample()));

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Builder(builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: WebView(
              initialUrl: 'https://stageapp.prodoo.com/#/apps/searcher-philip/automate',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);

              },
              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00000000),
              geolocationEnabled: true,
            ),
          ),
        );
      }),
    );
  }



}


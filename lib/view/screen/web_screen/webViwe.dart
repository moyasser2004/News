import 'package:flutter/material.dart';
import 'package:news/view/widget/home_screen_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatelessWidget {
  final String url;
  WebViewExample(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppbar(
          onPressed: () => Navigator.of(context).pop()),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}

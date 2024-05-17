import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewExample extends StatelessWidget {
  final String url;
  WebViewExample(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        javascriptMode :JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}

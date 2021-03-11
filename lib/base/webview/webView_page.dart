import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/widget/common_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, {this.title});

  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }
}

class WebViewState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(context,
            titleStr: (widget.title == null || widget.title.isEmpty)
                ? "网页"
                : widget.title),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Expanded(
                  child: WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

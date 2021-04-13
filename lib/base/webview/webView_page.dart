import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/widget/common_app_bar.dart';
import 'package:wan_android_flutter/dialog/share_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebViewPage extends StatefulWidget {
  final String? url;
  final String? title;
  WebViewPage(this.url, {this.title});

  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }
}

class WebViewState extends State<WebViewPage> {

  ShareDialog? _shareDialog;
  ShareDialog? get shareDialog {
    if (_shareDialog == null) {
      _shareDialog = ShareDialog();
    }
    return _shareDialog;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
          context,
          titleStr: (widget.title == null || widget.title!.isEmpty)
              ? "网页"
              : widget.title!,
          actions: [
            GestureDetector(
              onTap: () {
                shareDialog!.show(context);
              },
              child: SizedBox(
                width: 45,
                height: 45,
                child: Center(
                  child: Icon(Icons.share, color: Colors.black),
                ),
              ),
            )
          ],
        ),
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

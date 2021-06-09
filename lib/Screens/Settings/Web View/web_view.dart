import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  final String title;
  final String url;
  PrivacyPolicy({@required this.title, @required this.url});
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  num pos = 1;
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: IndexedStack(index: pos, children: <Widget>[
            WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (value) {
                setState(() {
                  pos = 1;
                });
              },
              onPageFinished: (value) {
                setState(() {
                  pos = 0;
                });
              },
            ),
            Container(
              child: Center(child: CircularProgressIndicator()),
            ),
          ]),
        ));
  }
}

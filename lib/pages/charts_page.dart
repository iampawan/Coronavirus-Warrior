import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChartsPage extends StatelessWidget {
  static const String routeName = "charts";
  final Set gestureRecognizers = [
    Factory(() => EagerGestureRecognizer()),
  ].toSet();
  final url1 = Uri.dataFromString(
          '<html><body><iframe style="width:100%"; width="560" height="700" src="https://coronavirus.app/chart/evolution/infected" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
          mimeType: 'text/html')
      .toString();
  final url2 = Uri.dataFromString(
          '<html><body><iframe style="width:100%"; width="560" height="990" src="https://coronavirus.app/chart/global/infected" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
          mimeType: 'text/html')
      .toString();
  final url3 = Uri.dataFromString(
          '<html><body><iframe style="width:100%"; width="560" height="700" src="https://coronavirus.app/chart/evolution/dead" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
          mimeType: 'text/html')
      .toString();
  final url4 = Uri.dataFromString(
          '<html><body><iframe style="width:100%"; width="560" height="700" src="https://coronavirus.app/chart/evolution/recovered" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
          mimeType: 'text/html')
      .toString();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Charts"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.5,
              child: WebView(
                initialUrl: url1,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: height * 0.5,
              child: WebView(
                initialUrl: url2,
                onWebViewCreated: (controller) {
                  controller.evaluateJavascript(
                      ('setCookie("in_app=true; path=/");'));
                },
                gestureRecognizers: gestureRecognizers,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: height * 0.5,
              child: WebView(
                initialUrl: url3,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: height * 0.5,
              child: WebView(
                initialUrl: url4,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

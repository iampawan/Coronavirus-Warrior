import 'package:coronavirus_app/backend.dart';
import 'package:coronavirus_app/pages/faq_page.dart';
import 'package:coronavirus_app/pages/myth_page.dart';
import 'package:coronavirus_app/pages/protech_page.dart';
import 'package:coronavirus_app/utils/coonst.dart';
import 'package:coronavirus_app/widgets/coronavirus_map_widget.dart';
import 'package:coronavirus_app/widgets/number_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'charts_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    Backend().setupBackend();
    _controller?.dispose();
    _controller = YoutubePlayerController(
      initialVideoId: 'mOV1aBVYKGA',
      flags: YoutubePlayerFlags(
          autoPlay: true,
          enableCaption: true,
          hideThumbnail: true,
          forceHideAnnotation: true),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Coronavirus App"),
        actions: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Last updated 7 hours ago"),
          )),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10.0,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => YoutubePlayer(
                                  controller: _controller,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Coonst.appColor,
                                ));
                      },
                      color: Colors.purple,
                      textColor: Colors.white,
                      shape: Coonst.appShape,
                      child: Text("What is coronavirus?"),
                    ),
                    RaisedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, ProtectPage.routeName),
                      color: Colors.green,
                      textColor: Colors.white,
                      shape: Coonst.appShape,
                      child: Text("Protect yourself"),
                    ),
                    RaisedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, FAQPage.routeName),
                      color: Colors.pink,
                      textColor: Colors.white,
                      shape: Coonst.appShape,
                      child: Text("FAQ"),
                    ),
                    RaisedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, MythPage.routeName),
                      color: Colors.orange,
                      textColor: Colors.white,
                      shape: Coonst.appShape,
                      child: Text("Myth-busters"),
                    ),
                    RaisedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, ChartsPage.routeName),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      shape: Coonst.appShape,
                      child: Text("Charts"),
                    )
                  ],
                ),
              ),
              Container(
                height: height * 0.55,
                width: width,
                padding: const EdgeInsets.all(8),
                child: Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: CoronavirusMapWidget(),
                ),
              ),
            ],
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              minChildSize: 0.2,
              maxChildSize: 0.8,
              initialChildSize: 0.4,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Material(
                  elevation: 5,
                  color: Colors.white,
                  child: ListView(
                    controller: scrollController,
                    children: <Widget>[
                      NumberWidget(
                          title: "20627",
                          subtitle: "\nINFECTED",
                          titleColor: Coonst.dangerColor,
                          subtitleColor: Coonst.dangerColor,
                          titleFontSize: 50.0,
                          subtitleFontSize: 20.0),
                      Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: <Widget>[
                          NumberWidget(
                              width: width * 0.5,
                              title: "427",
                              subtitle: "\nDead",
                              titleColor: Colors.black,
                              subtitleColor: Colors.black45,
                              titleFontSize: 50.0,
                              subtitleFontSize: 20.0),
                          NumberWidget(
                              width: width * 0.5,
                              title: "624",
                              subtitle: "\nRecovered",
                              titleColor: Colors.black,
                              subtitleColor: Colors.black45,
                              titleFontSize: 50.0,
                              subtitleFontSize: 20.0),
                          NumberWidget(
                              width: width * 0.5,
                              title: "2.07%",
                              subtitle: "\nFatality Rate",
                              titleColor: Colors.black,
                              subtitleColor: Colors.black45,
                              titleFontSize: 50.0,
                              subtitleFontSize: 20.0),
                          NumberWidget(
                              width: width * 0.5,
                              title: "3.03%",
                              subtitle: "\nRecovery Rate",
                              titleColor: Colors.black,
                              subtitleColor: Colors.black45,
                              titleFontSize: 50.0,
                              subtitleFontSize: 20.0),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:coronavirus_app/pages/faq_page.dart';
import 'package:coronavirus_app/pages/myth_page.dart';
import 'package:coronavirus_app/pages/protech_page.dart';
import 'package:coronavirus_app/utils/coonst.dart';
import 'package:coronavirus_app/widgets/coronavirus_map_widget.dart';
import 'package:coronavirus_app/widgets/number_widget.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'charts_page.dart';
import 'package:timeago/timeago.dart' as timeago;

RemoteConfig remoteConfig;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  YoutubePlayerController _controller;
  PackageInfo pkg;
  @override
  void initState() {
    super.initState();
    // Backend().setupBackend();
    setRemoteConfig();
    _controller = YoutubePlayerController(
      initialVideoId: 'mOV1aBVYKGA',
      flags: YoutubePlayerFlags(
          autoPlay: true,
          enableCaption: true,
          hideThumbnail: true,
          forceHideAnnotation: true),
    );
  }

  setRemoteConfig() async {
    pkg = await PackageInfo.fromPlatform();

    remoteConfig = await RemoteConfig.instance;
    await remoteConfig.fetch(expiration: const Duration(seconds: 0));
    await remoteConfig.activateFetched();
    setState(() {});
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    remoteConfig.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  Widget socialActions(context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.facebookF),
            onPressed: () async {
              await _launchURL("https://facebook.com/imthepk");
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.twitter),
            onPressed: () async {
              await _launchURL("https://twitter.com/imthepk");
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.linkedinIn),
            onPressed: () async {
              _launchURL("https://linkedin.com/in/imthepk");
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.youtube),
            onPressed: () async {
              await _launchURL("https://youtube.com/mtechviral");
            },
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var ago = "Last Updated - ";
    try {
      ago = ago + timeago.format(remoteConfig?.lastFetchTime);
    } catch (e) {
      ago = "";
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: false,
        title: Text("Coronavirus App"),
        actions: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              ago,
              maxLines: 1,
            ),
          )),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
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
              Container(height: height * 0.5, child: CoronavirusMapWidget()),
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
                          title: remoteConfig?.getString("cv_infected"),
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
                              title: remoteConfig?.getString("cv_dead"),
                              subtitle: "\nDead",
                              titleColor: Colors.black,
                              subtitleColor: Colors.black45,
                              titleFontSize: 50.0,
                              subtitleFontSize: 20.0),
                          NumberWidget(
                              width: width * 0.5,
                              title: remoteConfig?.getString("cv_recovered"),
                              subtitle: "\nRecovered",
                              titleColor: Colors.black,
                              subtitleColor: Colors.black45,
                              titleFontSize: 50.0,
                              subtitleFontSize: 20.0),
                          NumberWidget(
                              width: width * 0.5,
                              title: remoteConfig?.getString("cv_fr"),
                              subtitle: "\nFatality Rate",
                              titleColor: Colors.black,
                              subtitleColor: Colors.black45,
                              titleFontSize: 50.0,
                              subtitleFontSize: 20.0),
                          NumberWidget(
                              width: width * 0.5,
                              title: remoteConfig?.getString("cv_rr"),
                              subtitle: "\nRecovery Rate",
                              titleColor: Colors.black,
                              subtitleColor: Colors.black45,
                              titleFontSize: 50.0,
                              subtitleFontSize: 20.0),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text.rich(
                            TextSpan(
                                text: "#coronavirus",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.blue,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL(
                                        "https://twitter.com/hashtag/coronovirus?lang=en");
                                  }),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "#nCoV2019",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      color: Colors.blue,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL(
                                        "https://twitter.com/hashtag/nCoV2019?lang=en");
                                  }),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      socialActions(context),
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                          textColor: Coonst.appColor,
                          onPressed: () {
                            showAboutDialog(
                                context: context,
                                applicationName: Coonst.app_name,
                                applicationVersion: "v${pkg.version}",
                                children: [
                                  Text(
                                    "Credits",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    "World Health Organisation",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    "Coronavirus App @Scriby",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ]);
                          },
                          child: Text("Credits & Sources")),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await remoteConfig.fetch(expiration: const Duration(seconds: 0));
          await remoteConfig.activateFetched();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

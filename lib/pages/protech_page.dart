import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coronavirus_app/utils/coonst.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ProtectPage extends StatelessWidget {
  static const String routeName = "protect";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Protect yourself"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ProtectionCarousal(
              height: height,
              title: "Protect yourself and others from getting sick",
              itemCount: 4,
              suffix: "y"),
          ProtectionCarousal(
              height: height,
              title: "Practice food safety",
              itemCount: 3,
              suffix: "f"),
          ProtectionCarousal(
              height: height,
              title:
                  "Shopping/Working in wet markets in China and Southeast Asia",
              itemCount: 3,
              suffix: "s"),
          ProtectionCarousal(
              height: height,
              title: "Stay healthy while travelling",
              itemCount: 5,
              suffix: "h"),
        ],
      ),
    );
  }
}

class ProtectionCarousal extends StatelessWidget {
  const ProtectionCarousal({
    Key key,
    @required this.height,
    this.title,
    this.suffix,
    this.itemCount = 3,
  }) : super(key: key);

  final double height;
  final String title;
  final int itemCount;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            AutoSizeText(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: CarouselSlider.builder(
                height: height,
                viewportFraction: 0.9,
                realPage: 1,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PhotoView(
                      backgroundDecoration: BoxDecoration(color: Colors.white),
                      tightMode: true,
                      imageProvider: CachedNetworkImageProvider(
                        Coonst.fireStoreImageUrl(
                          "p$suffix${index + 1}",
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

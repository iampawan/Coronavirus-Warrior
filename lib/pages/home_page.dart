import 'package:coronavirus_app/utils/coonst.dart';
import 'package:coronavirus_app/widgets/coronavirus_map_widget.dart';
import 'package:coronavirus_app/widgets/number_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Coronavirus App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NumberWidget(
                title: "20627",
                subtitle: "\nINFECTED",
                titleColor: Coonst.dangerColor,
                subtitleColor: Coonst.dangerColor,
                titleFontSize: 50.0,
                subtitleFontSize: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ],
            ),
            FlatButton(
              child: Text("View Details"),
              shape: Coonst.appShape,
              color: Coonst.appColor,
              textColor: Colors.white,
              onPressed: () {},
            ),
            Container(
              width: width,
              height: height * 0.5,
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: CoronavirusMapWidget(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0.0,
          onPressed: null,
          backgroundColor: Coonst.appColor,
          label: Text("Last updated 7 hours ago.")),
    );
  }
}

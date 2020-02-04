import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberWidget extends StatelessWidget {
  final title;
  final subtitle;
  final titleColor;
  final subtitleColor;
  final titleFontSize;
  final subtitleFontSize;
  final width;

  const NumberWidget(
      {Key key,
      @required this.title,
      this.subtitle = "",
      @required this.titleColor,
      this.subtitleColor = Colors.grey,
      this.titleFontSize = 50,
      this.subtitleFontSize = 30,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: AutoSizeText.rich(
              TextSpan(
                text: title,
                style: GoogleFonts.rosario(
                    textStyle: TextStyle(
                  color: titleColor,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                )),
                children: [
                  TextSpan(
                    text: subtitle,
                    style: TextStyle(
                        color: subtitleColor,
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}

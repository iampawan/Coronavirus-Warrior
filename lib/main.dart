import 'package:coronavirus_app/pages/home_page.dart';
import 'package:coronavirus_app/utils/coonst.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          primaryTextTheme:
              GoogleFonts.latoTextTheme(Theme.of(context).textTheme.apply(
                    bodyColor: Coonst.appColor,
                    displayColor: Coonst.appColor,
                  )),
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            brightness: Brightness.light,
          )),
      home: HomePage(),
    );
  }
}

import 'dart:ui';

import 'package:coronavirus_app/utils/tools.dart';
import 'package:flutter/material.dart';

class Coonst {
  static const String app_name = "Coronavirus App";
  static const String app_version = "Version 1.0.0";
  static const int app_version_code = 1;
  static Color appColor = Tools.hexToColor("#8A2387");
  static Color dangerColor = Tools.hexToColor("#ED213A");
  static Color whitishColor = Tools.hexToColor("#f3f3f3");
  static ShapeBorder appShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));

  static bool isDebugMode = false;

  // * Url related
  static String baseUrl = "https://api.covalenthq.com/v1/1";
  static String appKey = "ckey_3137dd17b50348029a5db413978";

  static const String supportUrl = "https://frontierwallet.com/support.html";

  static checkDebug() {
    assert(() {
      // baseUrl = "http://127.0.0.1:8000/";
      // * Change with your local url if any
      baseUrl = "https://api.covalenthq.com/v1/1";
      isDebugMode = true;
      return true;
    }());
  }

  static bool get checkDebugBool {
    var debug = false;
    assert(debug = true);

    return debug;
  }

  //* Assets Folder
  static const String svgAssetFolder = "assets/images/svg";
  static const String pngAssetFolder = "assets/images/png";
  static const String iconAssetFolder = "assets/icons";
}

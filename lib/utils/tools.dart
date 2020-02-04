import 'dart:ui';

import 'package:flutter/foundation.dart';

class Tools {

  
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
}

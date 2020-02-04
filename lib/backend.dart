import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:queries/collections.dart';

class Backend {
  static final Backend _backendSingleton = Backend._internal();
  factory Backend() {
    return _backendSingleton;
  }
  Backend._internal();

  Future<List<int>> loadAsset(String path) async {
    ByteData data = await rootBundle.load(path);
// This would be your equivalent bytes variable
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return bytes;
  }

  setupFAQ() async {
    // for (int i = 2; i < 10; i++) {
    //   var d = await Firestore.instance.document("faq/q$i").get();
    //   await Firestore.instance.document("faq/q0$i").setData(d.data);
    //   await Firestore.instance.document("faq/q$i").delete();
    // }
  }

  setupBackend() async {
    // setupFAQ();
//    createUser();
  }
}

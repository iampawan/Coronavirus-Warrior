import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  static const String routeName = "faq";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions & Answers"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("faq").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(
              child: CircularProgressIndicator(),
            );
          List<DocumentSnapshot> docs = snapshot.data.documents;

          return ListView.builder(
            itemBuilder: (context, i) {
              return ExpansionTile(
                title: Text(docs[i].data["q"]),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(docs[i].data["a"]),
                  )
                ],
              );
            },
            itemCount: docs.length,
          );
        },
      ),
    );
  }
}

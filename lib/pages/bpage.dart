// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Bpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              // ignore:, avoid_unnecessary_containers
              return Card(
                child: ListTile(
                  title: Text("Notification"),
                  subtitle: Text("Persnal"),
                  leading: Icon(Icons.sms),
                ),
              );
            }),
      ),
    );
  }
}

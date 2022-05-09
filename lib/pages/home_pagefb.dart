// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:demo/pages/bpage.dart';
import 'package:demo/widgets/drawer.dart';

import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageFB extends StatefulWidget {
  const HomePageFB({Key? key}) : super(key: key);
  @override
  State<HomePageFB> createState() => _HomePageFBState();
}

class _HomePageFBState extends State<HomePageFB> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  // ignore: prefer_typing_uninitialized_variables
  var data;
  Future getdata() async {
    // ignore: unused_local_variable, await_only_futures
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                constants.prefs.setBool("logged In", false);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Bpage()));
              },
              icon: Icon(Icons.notification_add))
        ],
        // ignore:
        title: Text(
          "Home Page",
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text("somthiung hear"),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("some error somthing fatch"),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]["title"]),
                      subtitle: Text("id:${data[index]["id"]}"),
                      leading: Image.network(data[index]["url"]),
                    );
                  },
                  itemCount: data.length,
                );
            }
          }),
      drawer: Mydrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePageFB()));
          // myText = _nameController.text;
          //setState(() {});
        },
        // ignore:
        child: Icon(Icons.refresh),
      ),
      // ignore: avoid_unnecessary_containers
      /*  bottomNavigationBar: Container(
        color: Colors.purple,
        //color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageFB()));
              },
              icon: Icon(
                Icons.home,
                semanticLabel: "Home",
                size: 40,
                color: Colors.brown,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(
                Icons.data_usage,
                semanticLabel: "Data",
                size: 40,
                color: Colors.brown,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Drawer()));
              },
              icon: Icon(
                Icons.person,
                semanticLabel: "Person",
                size: 40,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}

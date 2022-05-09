// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/pages/login_page.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageSB extends StatefulWidget {
  const HomePageSB({Key? key}) : super(key: key);
  @override
  State<HomePageSB> createState() => _HomePageSBState();
}

class _HomePageSBState extends State<HomePageSB> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  // ignore: prefer_typing_uninitialized_variables
  var data;
  Future getdata() async {
    // ignore: unused_local_variable, await_only_futures
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    return data;
  }

  Stream<List<String>> getStreamdata() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => "Item $index")]);
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.exit_to_app))
        ],
        // ignore:
        title: Text("Hi how are you"),
      ),
      body: StreamBuilder(
          stream: getStreamdata(),
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
          // myText = _nameController.text;
          //setState(() {});
        },
        // ignore:
        child: Icon(Icons.refresh),
      ),
    );
  }
}

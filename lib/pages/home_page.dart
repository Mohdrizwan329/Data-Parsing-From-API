// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/pages/login_page.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields
  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me";
  var url = "https://jsonplaceholder.typicode.com/photos";
  // ignore: prefer_typing_uninitialized_variables
  var data;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    // ignore: unused_local_variable, await_only_futures
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
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
      body: Center(
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]["title"]),
                    subtitle: Text("id:${data[index]["id"]}"),
                    leading: Image.network(url),
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: Mydrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        // ignore:
        child: Icon(Icons.refresh),
      ),
    );
  }
}

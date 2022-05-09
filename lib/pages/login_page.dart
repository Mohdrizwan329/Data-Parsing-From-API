// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:demo/widgets/bgimage.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final useraccountController = TextEditingController();
  final userpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Login Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Bgimage(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                            child: Column(
                          children: [
                            TextFormField(
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                  hintText: "Enter User Name",
                                  labelText: "username"),
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText: true,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                  hintText: "Enter User Password",
                                  labelText: "password"),
                            ),
                          ],
                        )),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          constants.prefs.setBool("logged In", true);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));

                          // Navigator.pushNamed(context, "/home");
                        },
                        // ignore: prefer_const_constructors
                        child: Text("Signe In"),
                        color: Colors.orange,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

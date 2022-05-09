// ignore: unused_import, avoid_web_libraries_in_flutter

//import 'package:demo/pages/home_page_with_sb.dart';
import 'package:demo/pages/home_pagefb.dart';
import 'package:demo/pages/login_page.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  constants.prefs = await SharedPreferences.getInstance();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "demo",
      // ignore: prefer_const_constructors
      home: constants.prefs.getBool("logged In") == true
          // ignore: prefer_const_constructors
          ? HomePageFB()
          // ignore: prefer_const_constructors
          : LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // routes: {
      // ignore: prefer_const_constructors
      // "/login": (context) => LoginPage(),
      // ignore: prefer_const_constructors
      // "/home": (context) => HomePage(),
      // },
    ),
  );
}

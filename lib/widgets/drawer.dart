// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: UserAccountsDrawerHeader(
              accountName: Text("account"),
              accountEmail: Text("abcd@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2021/12/11/07/59/hotel-6862159_960_720.jpg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
              subtitle: Text("persnal"),
              trailing: Icon(Icons.edit),
              tileColor: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(Icons.email),
              title: Text("email"),
              subtitle: Text("persnal"),
              trailing: Icon(Icons.send),
              tileColor: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text("search"),
              subtitle: Text("persnal"),
              trailing: Icon(Icons.search),
              tileColor: Colors.pink,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              subtitle: Text("persnal"),
              trailing: Icon(Icons.help),
              tileColor: Colors.brown,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: Icon(Icons.account_balance),
              title: Text("Account"),
              subtitle: Text("persnal"),
              trailing: Icon(Icons.account_box),
              tileColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

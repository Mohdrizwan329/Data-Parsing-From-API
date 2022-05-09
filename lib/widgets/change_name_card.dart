import 'package:flutter/material.dart';

import 'bgimage.dart';

class ChangeNameCard extends StatelessWidget {
  const ChangeNameCard({
    Key? key,
    required this.myText,
    required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bgimage(),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        Text(
          myText,
          //ignore: prefer_const_constructors
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            obscureText: true,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              // ignore: prefer_const_constructors
              border: OutlineInputBorder(),
              hintText: "Enter samthing diffrent",
              labelText: "Name",
            ),
          ),
        ),
      ],
    );
  }
}

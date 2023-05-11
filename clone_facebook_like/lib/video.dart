import 'package:flutter/material.dart';

class videoPage extends StatelessWidget {
  const videoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, top: 30),
        child: const Text(
          "WELCOME TO VIDEO PAGE!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

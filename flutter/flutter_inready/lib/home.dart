import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 22),
          child: Column(
            children: [
              Image.asset(
                "assets/cross.png",
                height: 11,
              ),
              Text("Menu")
            ],
          )),
          ));
        }
}
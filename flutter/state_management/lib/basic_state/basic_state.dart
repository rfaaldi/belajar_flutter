import 'package:flutter/material.dart';

class StateBiasa extends StatefulWidget {
  const StateBiasa({super.key});

  @override
  State<StateBiasa> createState() => _StateBiasaState();
}

class _StateBiasaState extends State<StateBiasa> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    debugPrint("Membuild Ulang");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$number"),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: const Text(
                "Increment",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}

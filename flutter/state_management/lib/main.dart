import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/getx/counter_getx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true),
      home: const CounterGetx(),
    );
  }
}

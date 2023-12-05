import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/getx/counter_controller.dart';

class CounterGetx extends StatelessWidget {
  const CounterGetx({super.key});

  @override
  Widget build(BuildContext context) {
    final counterC = Get.put(CounterController());

    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              "${counterC.number}",
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                counterC.Increment();
                debugPrint(counterC.number.toString());
              },
              child: const Text(
                "Increment",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    ));
  }
}

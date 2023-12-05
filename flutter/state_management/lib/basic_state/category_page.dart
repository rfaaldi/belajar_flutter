import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int choice = 0;

  List<String> category = ["Tenda", "Sleeping Bag", "Matras", "Carrier"];

  Map<String, List<String>> data = {
    "Tenda": ["Eiger 1P", "NaturHike 4P", "Big Adventure 1P"],
    "Sleeping Bag": ["Eiger", "Consina", "Rei"],
    "Matras": ["Consina", "Big Adventure", "Large"],
    "Carrier": ["Osprey", "Rei", "Big Adventure", "Consina", "Naturhike"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              itemBuilder: (context, index) {
                var pick = index == choice;
                return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        choice = index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          pick ? const Color.fromARGB(255, 0, 0, 0) : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(category[index],
                        style: TextStyle(
                            fontSize: 16,
                            color: pick ? Colors.white : Colors.black)));
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: category.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text(data[category[choice]]![index])));
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: data[category[choice]]!.length,
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}

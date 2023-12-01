// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("REST API"),
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              var email = user['email'];
              var nameTitle = user['name']['title'];
              var namefirst = user['name']['first'];
              var nameLast = user['name']['last'];
              var fullName = "$nameTitle $namefirst $nameLast";
              var imageLink = user['picture']['thumbnail'];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(imageLink),
                ),
                title: Text(fullName),
                subtitle: Text(email),
                trailing: Icon(Icons.circle_notifications),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: featchData,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void featchData() async {
    print("featchData");
    const url = "https://randomuser.me/api/?results=2";
    final uri = Uri.parse(url); // ubah tipe menjadi uri
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }
}

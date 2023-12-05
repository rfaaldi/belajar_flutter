// ignore_for_file:  prefer_const_literals_to_create_immutables, avoid_print, unused_element, prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo List"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: title,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: description,
            decoration: const InputDecoration(hintText: "Description"),
            minLines: 1,
            maxLines: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: submitData, child: const Text("Submit"))
        ],
      ),
    );
  }

  Future<void> submitData() async {
    // 1. Get data from form
    final dataTitle = title.text;
    final dataDescription = description.text;

    final body = {
      "title": dataTitle,
      "description": dataDescription,
      "is_completed": false
    };

    // 2. Submit data to Server
    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      headers: {
        'content-type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      showSuccesMessage("Creation Success");
    } else {
      showErrorMessage("Creation Failed");
    }
  }

  void showSuccesMessage(String message) {
    final snackbar = SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showErrorMessage(String message) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

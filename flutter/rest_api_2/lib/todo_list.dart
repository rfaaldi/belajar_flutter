// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_2/add_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List items = [];

  @override
  void initState() {
    super.initState();
    featchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: RefreshIndicator(
        onRefresh: featchData,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              final id = item['_id'];
              return ListTile(
                leading: CircleAvatar(child: Text("${index + 1}")),
                title: Text(item['title']),
                subtitle: Text(item['description']),
                trailing: IconButton(
                    onPressed: () {
                      deleteById(id);
                    },
                    icon: const Icon(Icons.delete)),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateTodoPage,
        label: const Text("Todo List"),
      ),
    );
  }

  void navigateTodoPage() {
    final route = MaterialPageRoute(builder: (context) => AddPage());
    Navigator.push(context, route);
  }

  Future<void> featchData() async {
    const url = "https://api.nstack.in/v1/todos?page=1&limit=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    final result = json['items'] as List;

    setState(() {
      items = result;
    });
  }

  Future<void> deleteById(String id) async {
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final response = await http.delete(uri);

    final filter = items.where((element) => element['_id'] != id).toList();

    setState(() {
      items = filter;
    });
  }
}

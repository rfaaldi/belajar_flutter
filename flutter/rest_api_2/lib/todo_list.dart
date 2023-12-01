// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rest_api_2/add_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
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
}

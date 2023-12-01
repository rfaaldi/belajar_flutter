// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputWidget(
              title: "email",
              controller: email,
            ),
            const SizedBox(
              height: 40,
            ),
            InputWidget(
              title: "password",
              controller: password,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text("Buat User"),
              onPressed: () async {
                await _auth.signInWithEmailAndPassword(
                    email: email.text, password: password.text);
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: title,
      ),
      controller: controller,
    );
  }
}

import 'package:flutter/material.dart';

enum TypeSnackbar { succes, error }

void showSnackbar(context, msg, TypeSnackbar type) {
  ScaffoldMessenger.of(context).showSnackBar(snackbar(msg, type));
}

SnackBar snackbar(msg, TypeSnackbar type) {
  return SnackBar(
    backgroundColor: type == TypeSnackbar.succes ? Colors.green : Colors.red,
    content: Text("$msg"),
    duration: Duration(seconds: 3),
    action: SnackBarAction(
      label: "Tutup",
      onPressed: () {},
    ),
  );
}

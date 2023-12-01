// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter/utils/navigate_utils.dart';
import 'package:firebase_flutter/utils/output_utils.dart';
import 'package:flutter/material.dart';

class TambahDataScreen extends StatefulWidget {
  final String? id, nama, nik;
  const TambahDataScreen({super.key, this.nama, this.nik, this.id});

  @override
  State<TambahDataScreen> createState() => _TambahDataScreenState();
}

class _TambahDataScreenState extends State<TambahDataScreen> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController nik = TextEditingController();

  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    if (widget.nama != null && widget.nik != null) {
      nama.text = widget.nama!;
      nik.text = widget.nik!;
    }

    setState(() {
      isEdit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Data" : "Tambah Data"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            TextField(
                decoration: InputDecoration(hintText: "Nama"),
                controller: nama),
            SizedBox(
              height: 8,
            ),
            TextField(
                decoration: InputDecoration(hintText: "NIK"), controller: nik),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    if (isEdit) {
                      await db
                          .collection("Mahasiswa")
                          .doc(widget.id!)
                          .update({"nama": nama.text, "nik": nik.text});
                    } else {
                      await db
                          .collection("Mahasiswa")
                          .add({"nama": nama.text, "nik": nik.text});
                    }
                    showSnackbar(context, "Sukses", TypeSnackbar.succes);
                    navigatePop(context);
                  } catch (e) {
                    showSnackbar(context, e, TypeSnackbar.error);
                  }
                },
                child: Text(isEdit ? "Edit Data" : "Tambah Data"))
          ],
        ),
      ),
    );
  }
}

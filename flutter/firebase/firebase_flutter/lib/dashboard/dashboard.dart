// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, annotate_overrides, await_only_futures

import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter/dashboard/tambah/tambah_data.dart';
import 'package:firebase_flutter/utils/navigate_utils.dart';
import 'package:flutter/material.dart';

class DashboardScreenState extends StatefulWidget {
  const DashboardScreenState({super.key});

  @override
  State<DashboardScreenState> createState() => _DashboardScreeStateState();
}

class _DashboardScreeStateState extends State<DashboardScreenState> {
  final db = FirebaseFirestore.instance;
  List listData = [];

  initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    super.initState();
    await db.collection("Mahasiswa").snapshots().listen((event) {
      List d = [];
      for (var doc in event.docs) {
        d.add({"id": doc.id, "data": doc.data()});
        print("${doc.id} => ${doc.data()}");
      }
      setState(() {
        listData = d;
      });
    });
  }

  void deleteData(String id) {
    db.collection("Mahasiswa").doc(id).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      navigatePush(context, TambahDataScreen());
                    },
                    child: Text("Tambah Data"))
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: ((context, index) {
                      final data = listData[index]["data"];
                      final id = listData[index]["id"];
                      return Card(
                          child: ListTile(
                        title: Text(data["nama"]),
                        trailing: Container(
                          width: 96,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      navigatePush(
                                          context,
                                          TambahDataScreen(
                                              id: id,
                                              nama: data["nama"],
                                              nik: data["nik"]));
                                    },
                                    icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      deleteData(id);
                                    },
                                    icon: Icon(Icons.remove)),
                              ]),
                        ),
                      ));
                    })))
          ],
        ),
      ),
    );
  }
}

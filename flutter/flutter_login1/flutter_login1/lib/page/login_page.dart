// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_login1/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/baground_register.png", width: 279),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43),
            child: ListView(
              children: [
                SizedBox(height: 115),
                Center(
                  child: Text(
                    "Selamat Datang \n Kembali!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Image.asset(
                  "assets/images/studying.png",
                  width: 310,
                ),
                SizedBox(
                  height: 41,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(14),
                      labelText: "Alamat Email",
                      labelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          togglePasswordVisibility();
                        },
                      ),
                      contentPadding: EdgeInsets.all(14),
                      labelText: "Password",
                      labelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  "Lupa Password ?",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff672cbc)),
                ),
                SizedBox(
                  height: 19,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff672cbc)),
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      'Mulai',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum memiliki akun?",
                      style: TextStyle(fontFamily: "Poppins", fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        " Daftar",
                        style: TextStyle(
                            color: Color(0xff672cbc),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: "Poppins"),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



import 'package:climate/Login%20Page%20Procedure/login_page.dart';
import 'package:climate/Login%20Page%20Procedure/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  //untuk menampilkan login page
  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(showRegisterPage: toggleScreens);
    } else {
      return Registerpage(showLoginPage: toggleScreens);
    }
  }
}
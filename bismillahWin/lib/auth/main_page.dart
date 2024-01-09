import 'package:climate/Pages/login_page_home.dart';
import 'package:climate/Login%20Page%20Procedure/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return HomePage();

          }else{
            return loginPageHome();
          }
        }
        ),
    );
  }
}
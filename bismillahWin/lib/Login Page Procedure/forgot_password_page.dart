// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }
  
  

  Future passwordReset(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(
            email: _emailcontroller.text.trim());
      showDialog(
        context: context, 
        builder: (context){
          return const AlertDialog(
            content: Text('Password reset link has been sent to your email!', 
            style: TextStyle(
              fontFamily: 'PlusJakartaSans', 
            ),),
          );
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString(), 
            style: const TextStyle(
              fontFamily: 'PlusJakartaSans', 
            ),),
          );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 105, 45),
        elevation: 0,
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter your registered email address',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'PlusJakartaSans', 
              fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          
                // textfield untuk email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 232, 232, 238)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 42, 105, 45)),
                        borderRadius: BorderRadius.circular(12) 
                      ),
                          hintText: 'Email',
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Tombol reset password
                  MaterialButton(
                    onPressed: () => passwordReset(context),
                    color: const Color.fromARGB(255, 42, 105, 45),
                    child: const Text('Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PlusJakartaSans', 
                    ),),
                  
                  )
        ],
      )
    );
  }
}
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
          return AlertDialog(
            content: Text('Link untuk reset password telah dikirim ke email!'),
          );
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 42, 105, 45),
        elevation: 0,
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Masukkan email anda yang telah terdaftar!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
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
                        borderSide: BorderSide(color: Color.fromARGB(255, 232, 232, 238)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 42, 105, 45)),
                        borderRadius: BorderRadius.circular(12) 
                      ),
                          hintText: 'Masukkan Email',
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Tombol reset password
                  MaterialButton(
                    onPressed: () => passwordReset(context),
                    child: Text('Reset Password'),
                    color: Color.fromARGB(255, 42, 105, 45),
                  
                  )
        ],
      )
    );
  }
}
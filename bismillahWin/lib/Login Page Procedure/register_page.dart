import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Registerpage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const Registerpage({super.key, required this.showLoginPage});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {

  //text controller buat backend
final _emailcontroller = TextEditingController();
final _passwordcontroller = TextEditingController();
final _confirmpasswordController = TextEditingController();
final _usernameController = TextEditingController();


@override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future signUp() async{
    // Show loading indicator
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent user interaction
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

    if(passwordConfirmed()){
      try{
      // fungsi untuk membuat user baru
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailcontroller.text.trim(), 
      password: _passwordcontroller.text.trim(),
      );

      // // menambahkan detail user
      addUserDetails(
        _usernameController.text.trim(),
      );

      // Dismiss the loading indicator before navigating
      Navigator.of(context).pop();

      // Navigate to HomePage after successful sign-in
      Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => const HomePage()
      )
      );

      }on FirebaseAuthException catch(e){
        // Dismiss loading indicator before showing error
        Navigator.of(context).pop();
        
        showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        });
      }
    }
  }

  Future addUserDetails(String username) async {
    await FirebaseFirestore.instance.collection('username').add({
      'username': username,
    });
  }
  

  bool passwordConfirmed() {
    if (_passwordcontroller.text.trim() == _confirmpasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 238),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 32,
                    ),
                  ),
                ),
          
                // const SizedBox(height: 50),

                // textfield untuk username
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 232, 232, 238)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 42, 105, 45)),
                        borderRadius: BorderRadius.circular(12) 
                      ),
                          hintText: 'Username',
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                      ),
                    ),
                  ),
              
          
        
                
          
                // textfield untuk email
                const SizedBox(height: 10),
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
                          hintText: 'Email',
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                      ),
                    ),
                  ),
              
          
                // textfield untuk password
                const SizedBox(height: 10),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordcontroller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 232, 232, 238)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 42, 105, 45)),
                          borderRadius: BorderRadius.circular(12) 
                        ),
                            hintText: 'Password',
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            filled: true,
                        ),
                      ),
                  ),

                 // textfield untuk konfirmasi password
                const SizedBox(height: 10),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      obscureText: true,
                      controller: _confirmpasswordController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 232, 232, 238)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 42, 105, 45)),
                          borderRadius: BorderRadius.circular(12) 
                        ),
                            hintText: 'Confirm Password',
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            filled: true,
                        ),
                      ),
                  ),

          
                // tombol sign in
                const SizedBox(height: 240),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 42, 105, 45),
                        borderRadius: BorderRadius.circular(12)
                        ),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            ),
                          ),
                      ),
                    ),
                  ),
                ),
          
                //register
                const SizedBox(height: 25),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Back to'),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        ' Login', 
                      style: TextStyle(
                        color: Color.fromARGB(255, 42, 105, 45),
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
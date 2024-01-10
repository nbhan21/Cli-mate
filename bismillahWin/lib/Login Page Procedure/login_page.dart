import 'package:climate/Login%20Page%20Procedure/forgot_password_page.dart';
import 'package:climate/Login%20Page%20Procedure/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const Loginpage({super.key,required this.showRegisterPage});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
//text controller buat backend
final _emailcontroller = TextEditingController();
final _passwordcontroller = TextEditingController();

Future signIn() async {
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

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text.trim(),
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

  } on FirebaseAuthException catch (e) {
    // Dismiss loading indicator before showing error
    Navigator.of(context).pop();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },
    );
  }
}


@override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 42, 105, 45),
      //   elevation: 0,
      // ),

      backgroundColor: Color.fromARGB(255, 232, 232, 238),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                // Icon(Icons.android, size: 100),
          
                // SizedBox(height: 75), // ganti logo cli-mate
                
                // Selamat datang kembali
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 32,
                    ),
                  ),
                ),
                // const SizedBox(height: 10),
                // const Text(
                //   'Cli-mate telah menunggumu!',
                //   style: TextStyle(
                //     fontSize: 17,
                //   ),
                // ),
          
               
          
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
                          hintText: 'Email', 
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true
                      ),
                    ),
                  ),
              
          
                // textfield untuk password
                const SizedBox(height: 10),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      obscureText: true, //hide password
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

                  //Lupa password
                  const SizedBox(height: 10),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                              return const ForgotPasswordPage();
                              }
                            ),
                            );
                          },
                          child: Text('Forgot Password?', 
                          style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          color: Color.fromARGB(255, 42, 105, 45),
                          fontWeight: FontWeight.bold,
                                              ),
                                              ),
                        ),
                      ],
                    ),
                  ),

          
                // tombol sign in
                const SizedBox(height: 350),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 42, 105, 45),
                        borderRadius: BorderRadius.circular(12)
                        ),
                      child: const Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
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
                    Text("Don't have an account?", 
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                    ),),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        ' Sign Up', 
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        color: Color.fromARGB(255, 42, 105, 45),
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
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
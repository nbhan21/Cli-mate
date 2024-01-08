import 'package:climate/pages/forgot_password_page.dart';
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

Future signIn() async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailcontroller.text.trim(), 
    password: _passwordcontroller.text.trim(),
    );
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
      backgroundColor: Color.fromARGB(255, 232, 232, 238),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Icon(Icons.android, size: 100),
          
                SizedBox(height: 75), // ganti logo cli-mate
                
                // Selamat datang kembali
                const Text(
                  'Halo, Cli-MATES!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Cli-mate telah menunggumu!',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
          
                const SizedBox(height: 50),
          
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
                            hintText: 'Masukkan Password',
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
                          child: Text('Lupa password?', 
                          style: TextStyle(
                          color: Color.fromARGB(255, 42, 105, 45),
                          fontWeight: FontWeight.bold,
                                              ),
                                              ),
                        ),
                      ],
                    ),
                  ),

          
                // tombol sign in
                const SizedBox(height: 10),
          
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
                          'Sign In',
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
                    Text('Belum memiliki akun?'),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        ' Register', 
                      style: TextStyle(
                        color: Color.fromARGB(255, 42, 105, 45),
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
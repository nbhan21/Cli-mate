import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

@override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if(passwordConfirmed()){
      try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailcontroller.text.trim(), 
      password: _passwordcontroller.text.trim());
      }on FirebaseAuthException catch(e){
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
                Icon(Icons.android, size: 100),
          
                SizedBox(height: 75), // ganti logo cli-mate
                
                // Selamat datang kembali
                const Text(
                  //'Jadilah bagian dari CLI-MATES!',
                  'Register Now!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  //'Isi form registrasi dibawah',
                  'Jadilah bagian dari Cli-MATES!',
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
                            hintText: 'Masukkan Password',
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
                            hintText: 'Konfirmasi Password',
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            filled: true,
                        ),
                      ),
                  ),

          
                // tombol sign in
                const SizedBox(height: 10),
          
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
                    Text('Sudah memiliki akun?'),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
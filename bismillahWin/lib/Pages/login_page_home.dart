import 'package:climate/auth/auth_page.dart';
import 'package:flutter/material.dart';

class loginPageHome extends StatefulWidget {
  const loginPageHome({super.key});

  @override
  State<loginPageHome> createState() => _loginPageHomeState();
}

// void SignIn(){

// }

class _loginPageHomeState extends State<loginPageHome> {
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
                  height: 200,
                  child: Image.asset(
                    'icons/Logo.png', 
                    )),
          
                SizedBox(height: 75), // ganti logo cli-mate
                
                /*
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
                */

                // Welcome
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 180, 5),
                  child:  
                  Text(
                    'Welcome!',
                    textAlign:  TextAlign.center,
                    style:  TextStyle (
                      fontSize:  36,
                      fontFamily: 'PlusJakartaSans', 
                      fontWeight:  FontWeight.w500,
                      height:  1.26,
                      color:  Color(0xff000000),
                    ),
                  ),
                ),

                // Welcome description
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 20, 0 ),
                  child:  
                  Text(
                    'We’re your helping buddy for any climate needs',
                    style:  TextStyle (
                      fontSize:  15,
                      fontFamily: 'PlusJakartaSans', 
                      fontWeight:  FontWeight.w500,
                      height:  1.26,
                      color:  Color(0xff000000),
                    ),
                  ),
                ),
          

          
                // tombol Continue
                const SizedBox(height: 200),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                              return const AuthPage();
                            }),
                          );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 42, 105, 45),
                        borderRadius: BorderRadius.circular(12)
                        ),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PlusJakartaSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            ),
                          ),
                      ),
                    ),
                  ),
                ), 
                
                /*
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                              return const AuthPage();
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
                  */
                
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
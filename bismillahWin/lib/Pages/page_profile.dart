import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class pageProfile extends StatefulWidget {
  const pageProfile({super.key});

  @override
  State<pageProfile> createState() => _pageProfileState();
  
}

class _pageProfileState extends State<pageProfile> {
  
    // Get user data within the build method
  User? get user => FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), 
              bottomRight: Radius.circular(10),)
          ),
        toolbarHeight: 75,
        backgroundColor: const Color.fromARGB(255, 42, 105, 45),
        elevation: 10,
      ), 

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, ${user?.email ?? ''}'), // Handle potential null
            MaterialButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  // Handle navigation after sign-out (e.g., back to login page)
                } catch (e) {
                  print(e); // Handle errors if needed
                }
              },
              color: const Color.fromARGB(255, 42, 105, 45),
              child: const Text('Sign Out'),
            )
          ],
        ),
      ),
    
    
    );
  }
}
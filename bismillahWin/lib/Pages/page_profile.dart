import 'package:climate/Pages/page%20components/text_box.dart';
import 'package:climate/pages/login_page_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class pageProfile extends StatefulWidget {
  const pageProfile({super.key});

  @override
  State<pageProfile> createState() => _pageProfileState();
}

class _pageProfileState extends State<pageProfile> {
  // Get user data within the build method
  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 238),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
          child: Text(
            'Log out',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.logout, color: Colors.white),
          onPressed: () async {
            showDialog(
              context: context,
              barrierDismissible: false, // Prevent user interaction
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
            await FirebaseAuth.instance.signOut();

            // Dismiss the loading indicator before navigating
            Navigator.of(context).pop();

            // Navigate to HomePage after successful sign-in
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const loginPageHome()));
          },
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )),
        toolbarHeight: 75,
        backgroundColor: const Color.fromARGB(255, 42, 105, 45),
        elevation: 10,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          //mendapatkan data user dari firebase
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                //profile
                const SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.person,
                  size: 70,
                ),

                //user email
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Hello, ${currentUser.email!}',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                  ),
                  textAlign: TextAlign.center,
                ),

                //detail user
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.grey[600],
                    ),
                  ),
                ),

                //user name
                textBox(
                  text: userData['username'],
                  sectionName: 'bio',
                  onPressed: () => editField('username'),
                ),

                //bio
                textBox(
                  text: userData['bio'],
                  sectionName: 'bio',
                  onPressed: () => editField('bio'),
                ),

                //contribution history user
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Contributions',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            );
          }else if (snapshot.hasError){
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

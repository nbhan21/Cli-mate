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
  // Get all user data
  final usersCollection = FirebaseFirestore.instance.collection("users");

  // untuk mengedit data user
  Future editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 232, 232, 238),
        title: Text("Edit $field",
            style: TextStyle(fontFamily: 'PlusJakartaSans')),
        content: TextField(
          autofocus: true,
          style: TextStyle(fontFamily: 'PlusJakartaSans'),
          decoration: InputDecoration(
              hintText: "New $field",
              hintStyle: TextStyle(fontFamily: 'PlusJakartaSans')),
              onChanged: (value) {
                newValue = value;
              },
        ),
        actions: [
          // Tombol untuk cancel
          TextButton(
            onPressed: ()=>Navigator.pop(context), 
            child: Text('Cancel',
            style: TextStyle(fontFamily: 'PlusJakartaSans'),
            ),
          ),

          // Tombol untuk save
          TextButton(
            onPressed: ()=>Navigator.of(context).pop(newValue), 
            child: Text('Save',
            style: TextStyle(fontFamily: 'PlusJakartaSans'),
            ),
          ),
        ],
      ),
    );
    
    // mengatur firestore
    if (newValue.trim().length>0){
      //hanya update firestore jika ada value baru
      await usersCollection.doc(currentUser.email).update({field: newValue});

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 238),
      appBar: AppBar(
        // title log out
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            'Log out',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
            ),
          ),
        ),

        //Button Log Out
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
              await FirebaseAuth.instance.signOut();
        
              // Dismiss the loading indicator before navigating
              Navigator.of(context).pop();
        
              // Navigate to loginPageHome after successful log out
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const loginPageHome()));
            },
          ),
        ),

        // Custom untuk AppBar
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )),
        toolbarHeight: 75,
        backgroundColor: const Color.fromARGB(255, 42, 105, 45),
        elevation: 10,
      ),

      //mendapatkan data user dari firebase
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          // jika user memiliki data, maka akan menampilkan data user
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
                  sectionName: 'Username',
                  onPressed: () => editField('username'),
                ),

                //bio
                textBox(
                  text: userData['bio'],
                  sectionName: 'bio',
                  onPressed: () => editField('bio'),
                ),

                //histori kontribusi dari user
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
                const SizedBox(
                  height: 30,
                ),
                Center(
                  //padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Coming Soon', 
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                  ),)
              ],
            );
          } // jika error maka return error
          else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }

          //return loading
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

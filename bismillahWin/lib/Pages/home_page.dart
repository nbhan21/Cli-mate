
import 'package:climate/Pages/page%20navigation%20components/bottom_nav_bar.dart';
import 'package:climate/Pages/page_climate.dart';
import 'package:climate/Pages/page_news.dart';
import 'package:climate/Pages/page_profile.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // Get user data within the build method
//   User? get user => FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Successfully Logged In As: ${user?.email ?? ''}'), // Handle potential null
//             MaterialButton(
//               onPressed: () async {
//                 try {
//                   await FirebaseAuth.instance.signOut();
//                   // Handle navigation after sign-out (e.g., back to login page)
//                 } catch (e) {
//                   print(e); // Handle errors if needed
//                 }
//               },
//               color: const Color.fromARGB(255, 42, 105, 45),
//               child: const Text('Sign Out'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Navigasi bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Pages
  final List <Widget> _pages = [
    //Page berita
    const pageNews(),

    //Page map
    const pageClimate(),

    //Page profile
    const pageProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //    shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(10), 
      //         bottomRight: Radius.circular(10),)
      //     ),
      //   toolbarHeight: 75,
      //   backgroundColor: const Color.fromARGB(255, 42, 105, 45),
      //   elevation: 10,
      // ),
      backgroundColor: const Color.fromARGB(255, 232, 232, 238),
      // backgroundColor: Colors.transparent,
      bottomNavigationBar: bottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
// final user = FirebaseAuth.instance.currentUser!;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Berhasil masuk sebagai: ' + user.email!),
//             MaterialButton(onPressed: (){
//               FirebaseAuth.instance.signOut();},
//               color: Color.fromARGB(255, 42, 105, 45),
//               child: Text('Keluar')
//             )
//           ],
//         )),
//     );
//   }
// }

// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Get user data within the build method
  User? get user => FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Berhasil masuk sebagai: ${user?.email ?? ''}'), // Handle potential null
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
              child: const Text('Keluar'),
            )
          ],
        ),
      ),
    );
  }
}



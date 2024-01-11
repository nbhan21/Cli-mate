import 'package:flutter/material.dart';

class pageProfile extends StatefulWidget {
  const pageProfile({super.key});

  @override
  State<pageProfile> createState() => _pageProfileState();
}

class _pageProfileState extends State<pageProfile> {
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

      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Nanti jadi page buat nunjukkin profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'PlusJakartaSans', 
              fontSize: 15),
            ),
          ),
        ]
      )
    
    
    );
  }
}
import 'package:flutter/material.dart';

class pageNews extends StatefulWidget {
  const pageNews({super.key});

  @override
  State<pageNews> createState() => _pageNewsState();
}

class _pageNewsState extends State<pageNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 238),
      
      //app
      appBar: AppBar(
        automaticallyImplyLeading: false,  
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), 
            bottomRight: Radius.circular(10),)
        ),
        toolbarHeight: 75,
        // backgroundColor: Colors.transparent,
        // shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 42, 105, 45),
        elevation: 10,
      ), 

      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Nanti jadi page buat nunjukkin berita',
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
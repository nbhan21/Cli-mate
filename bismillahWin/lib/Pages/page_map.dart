import 'package:flutter/material.dart';

class pageMap extends StatefulWidget {
  const pageMap({super.key});

  @override
  State<pageMap> createState() => _pageMapState();
}

class _pageMapState extends State<pageMap> {
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
        backgroundColor: Colors.transparent,
        elevation: 10,
        shadowColor: Colors.transparent,
      ),

      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Nanti jadi page buat nunjukkin map',
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
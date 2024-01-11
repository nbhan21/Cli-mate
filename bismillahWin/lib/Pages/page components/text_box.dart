import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class textBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const textBox({super.key,
  required this.text,
  required this.sectionName,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 15, ),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sectionName,
              style: TextStyle(
                color: Colors.grey[600],
                fontFamily: 'PlusJakartaFont',
              ),),
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.settings,
                color: Colors.grey[600],))
            ],
          ),
          Text(text,
          style: TextStyle(
                fontFamily: 'PlusJakartaFont',
              ),
          ),
        ],
      ),
    );
  }
}
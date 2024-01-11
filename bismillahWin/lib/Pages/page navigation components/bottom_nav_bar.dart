import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: camel_case_types
class bottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const bottomNavBar({super.key, required this.onTabChange,});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 25.0,
          ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          
        child: GNav(
          onTabChange: (value) => onTabChange!(value),
          backgroundColor: const Color.fromARGB(255, 42, 105, 45),
          color: Colors.white,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          activeColor: Colors.white,
          tabBackgroundColor: const Color.fromARGB(255, 53, 129, 56),
          gap: 5,
          padding: const EdgeInsets.all(15),
          tabs: const [
            GButton(
              icon: Icons.newspaper,
              text: 'News',
              ),
            GButton(
              icon: Icons.map,
              text: 'Map',
              ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              ),
          ],
        ),
      ),
    );
  }
}
  
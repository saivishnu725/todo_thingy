import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

GNav buildBottomNavBar() {
  return const GNav(
    tabs: [
      GButton(
        gap: 10,
        icon: Icons.date_range,
        text: 'Date',
        backgroundColor: Color.fromARGB(255, 255, 209, 220),
      ),
      GButton(
        gap: 10,
        icon: Icons.category_outlined,
        text: 'Category',
        backgroundColor: Color.fromRGBO(255, 209, 140, 1),
      ),
      GButton(
        gap: 10,
        icon: Icons.settings,
        text: 'Settings',
        backgroundColor: Color.fromARGB(255, 179, 252, 255),
      ),
    ],
  );
}

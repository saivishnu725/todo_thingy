import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 240, 240, 240),
    elevation: 1,
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        'assets/images/logo.png',
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      ),
    ),
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Todo list thingy'),
      ],
    ),
    actions: const [Icon(Icons.search), SizedBox(width: 30)],
  );
}

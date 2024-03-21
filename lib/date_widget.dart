import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget dateWidget(String date) {
  String today = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String yesterday = DateFormat('dd/MM/yyyy')
      .format(DateTime.now().subtract(const Duration(days: 1)));

  if (date == today) date = "Today";
  if (date == yesterday) date = "Yesterday";
  return ListTile(
    title: Text(
      date,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 150, 150, 150),
      ),
    ),
  );
}

// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:test_app/build_app_bar.dart';
import 'package:test_app/build_bottom_nav_bar.dart';
import 'package:test_app/date_widget.dart';
import 'package:test_app/list_data_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> dataList = [
    {
      'title': 'Home',
      'category': 'Software',
      'enabled': true,
      'date': '21/03/2024',
    },
    {
      'title': 'Profile',
      'category': 'Icons',
      'enabled': false,
      'date': '17/03/2024',
    },
    {
      'title': 'Profile',
      'category': 'Icons',
      'enabled': false,
      'date': '20/03/2024',
    },
    {
      'title': 'Profile',
      'category': 'Icons',
      'enabled': false,
      'date': '17/03/2024',
    },
    {
      'title': 'Profile',
      'category': 'Icons',
      'enabled': false,
      'date': '15/03/2024',
    },
    {
      'title': 'heheh',
      'category': 'fwe',
      'enabled': false,
      'date': '20/03/2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Step 1: Sort items by date
    dataList.sort((a, b) => b["date"].compareTo(a["date"]));

    // Step 2: Group items by date
    Map<String, List<Map<String, dynamic>>> groups = {};
    for (var item in dataList) {
      String date = item["date"];
      groups.putIfAbsent(date, () => []).add(item);
    }
    // Step 3: Create widgets for grouped items
    List<Widget> groupedWidgets = [];
    groups.forEach((date, tasks) {
      // Add divider widget for date
      groupedWidgets.add(dateWidget(date));
      // Add list data widgets for tasks
      for (var task in tasks) {
        groupedWidgets.add(listDataWidget(task, (bool? value) {
          setState(() => task['enabled'] = value!);
        }));
      }
    });

    return Center(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // debugShowMaterialGrid: true,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: buildAppBar(),
          body: ListView(
            children: groupedWidgets,
          ),
          floatingActionButton: const FloatingActionButton(
            tooltip: 'Increment',
            onPressed: null,
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: buildBottomNavBar(),
        ),
      ),
    );
  }
}

// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:todo_thingy/build_app_bar.dart';
import 'package:todo_thingy/build_bottom_nav_bar.dart';
import 'package:todo_thingy/date_widget.dart';
import 'package:todo_thingy/list_data_widget.dart';

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
    // data logic

    // sort items by date
    dataList.sort((a, b) => b["date"].compareTo(a["date"]));
    // group items by date
    Map<String, List<Map<String, dynamic>>> groups = {};
    for (var item in dataList) {
      String date = item["date"];
      groups.putIfAbsent(date, () => []).add(item);
    }
    // create widgets for grouped items
    List<Widget> groupedWidgets = [];
    groups.forEach((date, tasks) {
      // add divider widget for date
      groupedWidgets.add(dateWidget(date));
      // add list data widgets for tasks
      for (var task in tasks) {
        groupedWidgets.add(listDataWidget(task, (bool? value) {
          setState(() => task['enabled'] = value!);
        }));
      }
    });

    // app UI logic

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

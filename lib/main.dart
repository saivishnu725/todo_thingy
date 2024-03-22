// ignore_for_file: curly_braces_in_flow_control_structures

// package files
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// local files
import 'package:todo_thingy/build_app_bar.dart';
import 'package:todo_thingy/build_bottom_nav_bar.dart';
import 'package:todo_thingy/data/data_manager.dart';
import 'package:todo_thingy/date_widget.dart';
import 'package:todo_thingy/list_data_widget.dart';
import 'package:todo_thingy/pages/second_page.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();
  // open the box
  var box = await Hive.openBox('todoList5');

  //run the app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

extension WidgetExt on Widget {
  Widget wrappedInBuilder() {
    return Builder(builder: (context) => this);
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<dynamic, dynamic>> dataList = [];
  int _idCounter = 0;

  // reference the box
  final _myBox = Hive.box('todoList5');

  void readData() {
    setState(() {
      dataList = _myBox.values.cast<Map<dynamic, dynamic>>().toList();
      _idCounter = dataList.isEmpty ? 0 : findMaxId(dataList) + 1;
    });
  }
  // void deleteData() {}
  // Future<void> loadData() async {
  //   await _myBox.openBox();
  //   setState(() {
  //     dataList = taskBox.values.toList();
  //   });
  // }

  Future<void> writeData(task) async {
    task['id'] = _idCounter++;
    await _myBox.add(task);
    readData(); // Reload data
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // data logic

    // saveData({
    //   'title': 'home 4',
    //   'category': 'internet',
    //   'enabled': false,
    //   'date': '22/03/2024',
    // });
    readData();
    // sort items by date
    dataList.sort((a, b) => b["date"].compareTo(a["date"]));
    // group items by date
    Map<dynamic, List<Map<dynamic, dynamic>>> groups = {};
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
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                onPressed: () {
                  debugPrint("Clicked here!!");
                  writeData({
                    'title': 'home 100',
                    'category': 'instagram',
                    'enabled': false,
                    'date': '25/03/2024',
                  });
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const InputPage()));
                },
                child: const Icon(Icons.add)),
          ),
          bottomNavigationBar: buildBottomNavBar(),
        ),
      ),
    );
  }
}

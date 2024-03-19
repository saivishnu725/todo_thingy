import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool enabled1 = true;
  bool enabled2 = true;
  String today = DateFormat('dd/MM/yyyy').format(DateTime.now());

  List<Map<String, dynamic>> dataList = [
    {
      'divider': true,
      'date': '19/03/2024',
    },
    {
      'divider': false,
      'title': 'Home',
      'category': 'Software',
      'enabled': true,
      'date': '19/03/2024',
    },
    {
      'divider': true,
      'date': '18/03/2024',
    },
    {
      'divider': false,
      'title': 'Profile',
      'category': 'Icons',
      'enabled': true,
      'date': '17/03/2024',
    }
  ];

  @override
  Widget build(BuildContext context) {
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
          body: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              if (dataList[index]['divider']) {
                if (dataList[index]['date'] == today) {
                  return const ListTile(
                    title: Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 150, 150, 150),
                      ),
                    ),
                  );
                } else {
                  return ListTile(
                    title: Text(
                      dataList[index]['date'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 150, 150, 150),
                      ),
                    ),
                  );
                }
              } else {
                return ListTile(
                  leading: Checkbox(
                    value: dataList[index]['enabled'],
                    onChanged: (value) {
                      setState(() {
                        dataList[index]['enabled'] = value!;
                      });
                    },
                  ),
                  title: Text(dataList[index]['title']),
                  subtitle: Text(dataList[index]['category']),
                  trailing: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  ),
                );
              }
            },
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

// app bar
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
}



/*
body: ListView(
            children: [
              Column(
                children: [
                  // date
                  const ListTile(
                    title: Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 150, 150, 150),
                      ),
                    ),
                  ),

                  // one
                  ListTile(
                    leading: Checkbox(
                        value: enabled1,
                        onChanged: (value) {
                          setState(() {
                            enabled1 = value!;
                          });
                        }),
                    title: const Text('First'),
                    trailing: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                  ),
                  // two
                  ListTile(
                    leading: Checkbox(
                        activeColor: const Color.fromARGB(255, 255, 100, 152),
                        value: enabled2,
                        onChanged: (value) {
                          setState(() {
                            enabled2 = value!;
                          });
                        }),
                    title: const Text('Two'),
                    trailing: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
*/
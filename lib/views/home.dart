// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:web_sec/views/add.dart';
import 'package:web_sec/views/TaskScreen.dart';
import 'package:web_sec/views/ProfileScreen.dart';
import 'package:web_sec/views/CalendarScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    
    TaskScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )
              ],
            ))
          : null,
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Color.fromARGB(255, 186, 3, 253),
          child: Icon(
            color: const Color.fromARGB(255, 255, 255, 255),
            Icons.add,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Create()));
          }),
      body: SingleChildScrollView(
          child: Column(children: [
        _widgetOptions.elementAt(_selectedIndex),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 186, 3, 253),
        onTap: _onItemTapped,
      ),
    );
  }
}

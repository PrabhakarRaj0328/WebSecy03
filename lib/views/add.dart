// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_init_to_null, avoid_unnecessary_containers, sort_child_properties_last, curly_braces_in_flow_control_structures, sized_box_for_whitespace, unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/material.dart';
import 'package:web_sec/views/TaskList.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _taskController = TextEditingController();
  String? _selectedValue;

  final List<String> _dropdownItems = [
    'Work',
    'Personal',
    'Home',
    'Wishlist',
    'Health',
  ];
  DateTime? _selectedDate;
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  TimeOfDay? _selectedTime;
  TimeOfDay now = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Create Task',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_vert_outlined),
              onPressed: () {},
            )
          ],
        )),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 360,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 186, 3, 253)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedValue,
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        hint: Text(
                          'Select Category',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedValue = newValue!;
                          });
                        },
                        items: _dropdownItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                    child: TextFormField(
                      maxLines: null,
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: 'Task Description',
                        hintStyle: TextStyle(
                          fontSize: 23,
                          fontFamily: 'Inter-Bold',
                          color: Color.fromARGB(255, 50, 49, 49),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () => _selectDate(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 75, 74, 74))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selectedDate == null
                                      ? '${currentDate.day}/${currentDate.month}/${currentDate.year}'
                                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                Icon(Icons.calendar_month_outlined,
                                    color: Color.fromARGB(255, 75, 74, 74)),
                              ],
                            ),
                          )),
                      TextButton(
                          onPressed: () => _selectTime(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 75, 74, 74))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selectedDate == null
                                      ? '${now.hour}:${now.minute}'
                                      : '${_selectedTime?.hour}:${_selectedTime?.minute}',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                Icon(Icons.access_time,
                                    color: Color.fromARGB(255, 75, 74, 74)),
                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 180,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 243, 97, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Create",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => TaskList(
                                      task: Task(
                                    category: _selectedValue!,
                                    task: _taskController.text.trim(),
                                    date: _selectedDate!,
                                    time: _selectedTime!,
                                  ))),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class Task {
  final String category;
  final String task;
  final DateTime date;
  final TimeOfDay time;
  Task(
      {required this.category,
      required this.task,
      required this.date,
      required this.time});
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, sort_child_properties_last, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:web_sec/views/add.dart';

class TaskList extends StatefulWidget {
  final Task task;
  const TaskList({super.key, required this.task,});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'My Lists',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  color: isChecked ? Colors.green[600] : Colors.white,
                ),
                child: Center(
                  child: Icon(
                    isChecked ? Icons.check : null,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.task.task),
                Text('${widget.task.time.hour}:${widget.task.time.minute}')
              ],
            ),
            subtitle: Text(
                '${widget.task.date.day}/${widget.task.date.month}/${widget.task.date.year}'),
          )
        ],
      ),
    )));
  }
}

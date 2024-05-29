// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, sort_child_properties_last, avoid_unnecessary_containers
import 'package:flutter/material.dart';


class TaskScreen extends StatefulWidget {
  
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'My Lists',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        
        ),
      ],
    );
  }
}
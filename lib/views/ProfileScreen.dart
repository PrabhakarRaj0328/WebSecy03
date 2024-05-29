// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, sort_child_properties_last, avoid_unnecessary_containers
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.person_rounded,
                      color: Color.fromARGB(255, 180, 179, 179),
                      size: 60,
                    ),
                    backgroundColor: Color.fromARGB(255, 237, 235, 235),
                  ),
                  SizedBox(width: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Yohan Lawlite',
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          '3 days left of free trial',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        )
                      ])
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text('Tasks Overview',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 92, 91, 91),
                    fontWeight: FontWeight.w900,
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 120,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 230, 239, 247),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('0',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              )),
                          Text(
                            'Pending Tasks',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          )
                        ]),
                  ),
                  Container(
                    height: 120,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 230, 239, 247),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('0',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              )),
                          Text(
                            'Completed Tasks',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          )
                        ]),
                  ),
                ],
              ),
            ])));
  }
}

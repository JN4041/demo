import 'package:flutter/material.dart';

import 'Page_viewss.dart';
import 'gredviews.dart';

class Bottam extends StatefulWidget {
  const Bottam({Key? key}) : super(key: key);

  @override
  State<Bottam> createState() => _BottamState();
}

class _BottamState extends State<Bottam> {
  List icon = [
    PageView123(),
    Gradviews12(),
    Gradviews12(),
    SizedBox(),
  ];
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: select,
        onTap: (value) {
          setState(() {
            select = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "call"),
          BottomNavigationBarItem(icon: Icon(Icons.adb_sharp), label: "adb"),
        ],
      ),
      body: icon[select],
    );
  }
}

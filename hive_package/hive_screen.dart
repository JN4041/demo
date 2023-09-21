import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_Screen extends StatefulWidget {
  const Hive_Screen({Key? key}) : super(key: key);

  @override
  State<Hive_Screen> createState() => _Hive_ScreenState();
}

class _Hive_ScreenState extends State<Hive_Screen> {
  adddata() {
    Box box = Hive.box("mybox");
    box.put("name", "jaydip");
  }

  getdata() {
    Box box = Hive.box("mybox");
    var n = box.get("name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HiveScreen"),
      ),
      body: Column(
        children: [
          Center(
              child: ElevatedButton(onPressed: () {}, child: Text("Add data"))),
          ElevatedButton(onPressed: () {}, child: Text("get data")),
          ElevatedButton(onPressed: () {}, child: Text("update data")),
          ElevatedButton(onPressed: () {}, child: Text("delete data")),
        ],
      ),
    );
  }
}

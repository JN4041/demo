import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life/views/home_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedScreen extends StatefulWidget {
  const SharedScreen({Key? key}) : super(key: key);

  @override
  State<SharedScreen> createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Data"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences pp =
                        await SharedPreferences.getInstance();
                    pp.setInt("age", 20);
                    pp.setString("name", "jaydip");
                    pp.setBool("passing", true);
                    if (kDebugMode) {
                      print("jaydip done");
                    }
                    setState(() {});
                  },
                  child: Text("Add data"))),
          Center(
              child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences pp =
                        await SharedPreferences.getInstance();
                    print(pp.getString("name"));
                    print(pp.getInt("age"));
                    print(pp.getBool("passing"));
                    setState(() {});
                  },
                  child: Text("get data"))),
          Center(
              child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences pp =
                        await SharedPreferences.getInstance();
                    pp.remove("name");
                    pp.remove("passing");
                    pp.remove("age");
                    setState(() {});
                  },
                  child: Text("remove data"))),
          FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    Text(snapshot.data!.getInt("age").toString()),
                    Text(snapshot.data!.getString("email").toString() ?? ""),
                    Text(snapshot.data!.getBool("passing").toString()),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          InkWell(
            onTap: () async {
              SharedPreferences per = await SharedPreferences.getInstance();
              per.remove("email").then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreens(),
                  )));
              setState(() {});
            },
            child: Icon(
              Icons.delete,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}

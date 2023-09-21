import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life/local_database/Shareprefer_small/shared_perfScreen.dart';
import 'package:life/views/home_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  String? getstor;
  Future Getconfo() async {
    SharedPreferences stor = await SharedPreferences.getInstance();
    final stong = stor.getString("email");
    setState(() {
      getstor = stong;
    });
  }

  @override
  void initState() {
    Getconfo().whenComplete(() => Timer(
          Duration(seconds: 10),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    getstor == null ? HomeScreens() : SharedScreen(),
              )),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(
          "https://media.istockphoto.com/id/1257005098/photo/hd-wallpaper-for-mobile-phones.jpg?s=170667a&w=0&k=20&c=E7OoX-_NAU7e9TgYvG9nA7_R6L52_yYtoMJ7P8akVjg=",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

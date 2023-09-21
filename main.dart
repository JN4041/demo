import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:life/views/home_screens.dart';
import 'package:life/views/splace_screen.dart';
import 'package:life/views/widget_animations/animations.dart';

import 'hive_package/hive_screen.dart';
import 'list_curedoprations/List_screens.dart';
import 'local_database/Shareprefer_small/shared_perfScreen.dart';
import 'local_database/secure_Storege/secure_storege.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("mybox");

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.red));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red, accentColor: Colors.yellow),
      home: DCode(),
    );
  }
}

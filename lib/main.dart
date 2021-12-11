import 'package:bmicaculator/models/bmi_result/bmi_resualt_screen.dart';
import 'package:bmicaculator/models/bmi/bmi_screen.dart';
import 'package:flutter/material.dart';

import 'layout/home_layout.dart';
import 'models/login/login_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}


import 'package:bloc/bloc.dart';
import 'package:bmicaculator/models/bmi_result/bmi_resualt_screen.dart';
import 'package:bmicaculator/models/bmi/bmi_screen.dart';
import 'package:bmicaculator/shared/bloc_observer.dart';
import 'package:flutter/material.dart';

import 'layout/home_layout.dart';
import 'models/counter/counter_screen.dart';
import 'models/login/login_screen.dart';

void main(){
  BlocOverrides.runZoned(
        () {
          runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  }

class MyApp extends StatefulWidget {

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


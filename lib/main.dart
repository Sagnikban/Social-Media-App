import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Screen0.dart';
import 'Screen1.dart';
import 'Screen2.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';
import 'Screen6.dart';
import 'Screen7.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


        initialRoute: '/',
        routes: {

          '/': (context) => Screen0(),
          '/first': (context) => Screen1(),
          '/second':(context) => Screen2(),
          '/three':(context)=> Screen3(),
          '/four':(context)=> Screen4(),
          '/five':(context)=> Screen5(),
          '/six':(context)=> Screen6(),
          '/seven':(context)=> Screen7(),
           },

    );
  }
}

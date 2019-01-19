import 'package:flutter/material.dart';
import 'package:flutter_app/AnimateWidgetDemo.dart';
import 'package:flutter_app/CurvedAnimation.dart';
import 'package:flutter_app/AnimationStatusDemo.dart';
import 'package:flutter_app/GrowTransitionDemo.dart';
import 'package:flutter_app/StaggerAnimation.dart';
import 'package:flutter_app/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
//      home:BackdropDemo(),
//      home:ScaleImageDemo(),
//      home:CurvedScaleImageDemo(),
//      home:AnimatedWidgetDemo(),
//      home:GrowTransitionDemo(),
      home:StaggerDemo(),
    );
  }
}

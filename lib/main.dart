import 'package:flutter/material.dart';
import 'package:flutter_app/AnimateWidgetDemo.dart';
import 'package:flutter_app/AnimatedCrossFadeDemo.dart';
import 'package:flutter_app/CurvedAnimation.dart';
import 'package:flutter_app/AnimationStatusDemo.dart';
import 'package:flutter_app/FadeTransitionDemo.dart';
import 'package:flutter_app/GrowTransitionDemo.dart';
import 'package:flutter_app/PositionedTransitionDemo.dart';
import 'package:flutter_app/PositionedTransitionOfficalDemo.dart';
import 'package:flutter_app/ReverseTweenDemo.dart';
import 'package:flutter_app/RotationTransitionDemo.dart';
import 'package:flutter_app/StaggerAnimation.dart';
import 'package:flutter_app/TweenColorDemo.dart';
import 'package:flutter_app/drawer.dart';

void main() => runApp(AnimationDemo());

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Animation Demo", home: AnimationHome());
  }
}

class AnimationHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation demo"),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,position){
            return   ListTile(
              title: Text(list[position].name),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder:list[position].builder));
              },
            );
          }
      ),
    );
  }
}
class _RouterInfo {
  String name;
  WidgetBuilder builder;
  _RouterInfo({this.name, this.builder});
}

final List<_RouterInfo> list = <_RouterInfo>[
  _RouterInfo(name: "Tween的简单使用", builder: (context) => ScaleImageDemo()),
  _RouterInfo(name: "ColorTween的简单使用", builder: (context) => TweenColorDemo()),
  _RouterInfo(name: "CurvedAnimation的简单使用", builder: (context) => CurvedScaleImageDemo()),
  _RouterInfo(name: "AnimatedWidget的简单使用", builder: (context) => AnimatedWidgetDemo()),
  _RouterInfo(name: "AnimatedBuilder的简单应用", builder: (context) => GrowTransitionDemo()),
  _RouterInfo(name: "组合动画的简单使用", builder: (context) => StaggerDemo()),
  _RouterInfo(name: "PositionTransaction的简单使用", builder: (context) => PTDemo()),
  _RouterInfo(name: "RelativeRectTween的简单应用", builder: (context) => BackdropDemo()),
  _RouterInfo(name: "PositionTransaction官方api例子实现", builder: (context) => PTDemo2()),
  _RouterInfo(name: "RotationTransition的简单使用", builder: (context) => RTDemo()),
  _RouterInfo(name: "FadeTransition的简单使用", builder: (context) => FTDemo()),
  _RouterInfo(name: "AnimatedCrossFade的简单使用", builder: (context) => AnimatedCrossFadeDemo()),
];

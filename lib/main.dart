import 'package:flutter/material.dart';
import 'package:flutter_app/AnimateWidgetDemo.dart';
import 'package:flutter_app/CurvedAnimation.dart';
import 'package:flutter_app/AnimationStatusDemo.dart';
import 'package:flutter_app/GrowTransitionDemo.dart';
import 'package:flutter_app/ReverseTweenDemo.dart';
import 'package:flutter_app/StaggerAnimation.dart';
import 'package:flutter_app/drawer.dart';

void main() => runApp(AnimationDemo());
class AnimationDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "CookBook",
        home: AnimationHome()
    );
  }

}
//https://blog.csdn.net/nimeghbia/article/details/84388725
class AnimationHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("CookBook demo"),
      ),
      body: ListView(
        children: <Widget>[

          ListTile(
            title: Text("抽拉效果"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => BackdropDemo()
                  )
              );
            },
          ),
          ListTile(
            title: Text("Tween的简单使用"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => ScaleImageDemo()
                  )
              );
            },
          ),
          ListTile(
            title: Text("ReverseTween的简单使用"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => ReverseTweenDemo()
                  )
              );
            },
          ),
          ListTile(
            title: Text("CurvedAnimation的简单使用"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => CurvedScaleImageDemo()
                  )
              );
            },
          ),

          ListTile(
            title: Text("AnimatedWidget的简单使用"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => AnimatedWidgetDemo()
                  )
              );
            },
          ),

          ListTile(
            title: Text("AnimatedBuilder的简单应用"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => GrowTransitionDemo()
                  )
              );
            },
          ),
          ListTile(
            title: Text("组合动画的简单使用"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => StaggerDemo()
                  )
              );
            },
          ),
        ],
      ),
    );
  }
}
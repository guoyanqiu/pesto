
import 'package:flutter/material.dart';
//颜色从红到绿
class TweenColorDemo extends StatefulWidget {
  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<TweenColorDemo>  with SingleTickerProviderStateMixin{

  Animation<Color> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =  AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //写法1、图片宽高从0变到300
    animation = ColorTween(begin: Colors.green, end: Colors.red).animate(controller)
      ..addListener(() {
        setState(()=>{});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child:Text("ColorTween的简单使用")),
          elevation: 0.0,
        ),
        body:  Center(
            child:Column(
              children: <Widget>[
                Text("颜色从绿色逐渐变成红色"),
                Container(
                  color: animation.value,
                  width: 50.0,
                  height: 300,
                )
              ],
            )
        )
      );
      /// 从这里可以看出，animation其实和wiget是无关的
  }
  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
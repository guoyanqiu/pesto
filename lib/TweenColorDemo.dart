
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
    return new Center(
      child: Container(
        color: animation.value,
        width: 50.0,
        height: 300,
      )
    );
  }
  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
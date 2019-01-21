
import 'package:flutter/material.dart';
// 图片宽高匀速从0变到300
class TweenDemo extends StatefulWidget {
  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<TweenDemo>  with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =  AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //写法1、图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(()=>{});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Image.asset("images/beauty12.png",
          width: animation.value,
          height: animation.value
      ),
    );
  }
  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';

/// 弹簧效果的动画
class CurvedScaleImageDemo extends StatefulWidget {
  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<CurvedScaleImageDemo>  with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =  AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation =CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(()=>{});
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Image.asset("images/111.png",
          width: 100,
          height: 100
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
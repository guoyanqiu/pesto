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
    return Scaffold(
        appBar: AppBar(
          title: Center(child:Text("CurvedAnimation的简单使用")),
          elevation: 0.0,
        ),
        body: Center(
          child: Image.asset("images/beauty3.jpg",
              width: animation.value,
              height: animation.value
          ),
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
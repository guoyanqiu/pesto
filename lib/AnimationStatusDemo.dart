import 'package:flutter/material.dart';
/// 图片宽高匀速放大和缩小
class ScaleImageDemo extends StatefulWidget {
  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<ScaleImageDemo>  with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();

    controller =  AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    Tween<double> tween =  Tween(begin: 300, end: 0);
    animation  = ReverseTween(tween).animate(controller)
      ..addListener(() {
        setState(()=>{});
      })..addStatusListener((status){
        print("------status=="+status.toString());
        if(status==AnimationStatus.completed){//已经完成
          controller.reverse();
        }else if(status==AnimationStatus.dismissed){//动画的初始状态
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Image.asset("images/111.png",
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
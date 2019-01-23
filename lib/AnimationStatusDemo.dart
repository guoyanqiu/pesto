import 'package:flutter/material.dart';
/// 图片宽高匀速循环放大和缩小
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
    Tween<double> tween =  Tween(begin: 0, end: 300);
    animation  = tween.animate(controller)
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
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Tween的简单使用")),
        elevation: 0.0,
      ),
      body: Center(
        child: Image.asset("images/beauty1.jpg",
            width: animation.value,
            height: animation.value
        ),
      ),
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
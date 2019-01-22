import 'package:flutter/material.dart';

class _AnimatedWidget extends AnimatedWidget {
  //Animation extends Listenable
  _AnimatedWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("images/beauty4.jpg",
          width: animation.value, height: animation.value),
    );
  }
}

class AnimatedWidgetDemo extends StatefulWidget {
  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<AnimatedWidgetDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addStatusListener((status) {
        print("------status==" + status.toString());
        if (status == AnimationStatus.completed) {
          //已经完成
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画的初始状态
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child:Text("AnimatedWidget的简单使用")),
          elevation: 0.0,
        ),
        body:_AnimatedWidget(animation: animation)
    );
    /// 从这里可以看出，animation其实和wiget是无关的
  }


  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
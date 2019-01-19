import 'package:flutter/material.dart';

class _GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  _GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(//本身就是一个AnimateWidget
          animation: animation,
          child: child,
          builder: (BuildContext ctx, Widget child) {
            return Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          }),
    );
  }
}

class GrowTransitionDemo extends StatefulWidget {
  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<GrowTransitionDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //写法1、图片宽高从0变到300
    //AnimatedBuilder是一个AnimateWidget，所以本身不需要在添加addListener
    animation = Tween(begin: 0.0, end: 800.0).animate(controller);
//      ..addListener(() {
//        setState(()=>{});
//      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return _GrowTransition(
      child: Image.asset("images/snow.jpg"),
      animation: animation,
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

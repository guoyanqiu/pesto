import 'package:flutter/material.dart';
/// 图片宽高匀速从0变到300
class ReverseTweenDemo extends StatefulWidget {
  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<ReverseTweenDemo>  with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =  AnimationController(
        duration: const Duration(seconds: 3), vsync: this);

    //写法2 用 ReverseTween
    //必须指定泛型类型
    Tween<double> tween =  Tween(begin: 300, end: 0);
    animation  = ReverseTween(tween).animate(controller)
      ..addListener(() {
        setState(()=>{});
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
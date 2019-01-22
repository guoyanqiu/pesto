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
    return Scaffold(
        appBar: AppBar(
          title: Center(child:Text("ReverseTween的简单使用")),
          elevation: 0.0,
        ),
        body: Center(
          child: Image.asset("images/beauty2.jpg",
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
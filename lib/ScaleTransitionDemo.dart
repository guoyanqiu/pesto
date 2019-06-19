import 'package:flutter/material.dart';

///图片的放大和缩小
class ScaleTDemo extends StatefulWidget {
  @override
  _STState createState() => _STState();
}

class _STState extends State<ScaleTDemo> with SingleTickerProviderStateMixin {
  AnimationController controller; //动画控制器
  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    ///动画开始
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("ScaleTransition简单使用")),
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: ScaleTransition(
              scale: controller,
              child: Image.asset("images/beauty7.jpg"),
            ),
          ),
        ));
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

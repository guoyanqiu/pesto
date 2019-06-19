import 'package:flutter/material.dart';

///旋转动画
class RTDemo extends StatefulWidget {
  @override
  _RTState createState() => _RTState();
}

class _RTState extends State<RTDemo> with SingleTickerProviderStateMixin {
  Animation<double> animation; //动画对象
  AnimationController controller; //动画控制器
  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 6), vsync: this);

    animation = CurvedAnimation(parent: controller, curve:  ElasticOutCurve());

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();

    ///动画开始
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("RotationTransition简单使用")),
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
            width: 1.0,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
            child: RotationTransition(
//              turns: controller,///可以打开这个注释，直接利用controller来实现旋转
              turns: animation,
              child:Container(
                width: 1.0,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
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

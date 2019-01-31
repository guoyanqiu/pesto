import 'package:flutter/material.dart';

///透明度变化:或隐或现的美女
class FTDemo extends StatefulWidget {
  @override
  _FTState createState() => _FTState();
}

class _FTState extends State<FTDemo> with SingleTickerProviderStateMixin {
  Animation<double> animation; //动画对象
  AnimationController controller; //动画控制器
  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    controller.addStatusListener((status){
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
          title: Center(child: Text("FadeTransition简单使用")),
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: FadeTransition(
              opacity: controller,
              child: Image.asset("images/beauty5.jpg"),
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

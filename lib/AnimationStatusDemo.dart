import 'package:flutter/material.dart';

/// 图片宽高匀速循环放大和缩小
class ScaleImageDemo extends StatefulWidget {
  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<ScaleImageDemo>
    with SingleTickerProviderStateMixin {


  Animation<double> animation;//动画对象
  AnimationController controller;//动画控制器
  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    Tween<double> tween = Tween(begin: 0, end: 300);///图片大小从0到300

    animation = tween.animate(controller); ///初始化animation

    ///添加动画监听
    animation.addListener(() {
      setState(() => {});
///  /    if(animation.isCompleted){
///        controller.reverse();
///      }else if(animation.isDismissed){
///        controller.forward();
///      }

      print("key====="+widget.toStringShort());
    });

    //添加状态监听,也可以在addListener里面监听如上面代码
    animation.addStatusListener((status) {
//        if (status == AnimationStatus.completed) {
//          controller.reverse();//从大到小，然后从小到大循环
//        } else if (status == AnimationStatus.dismissed) {
//          controller.forward();
//        }
      });

    controller.forward();///动画开始
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:Key("hello"),
      appBar: AppBar(
        title: Center(child: Text("Tween的简单使用")),
        elevation: 0.0,
      ),
      body: Center(
        child: Image.asset(
            "images/beauty1.jpg",
            width: animation.value,
            height: animation.value),
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

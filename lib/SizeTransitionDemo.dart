import 'package:flutter/material.dart';

///图片的放大和缩小
class SizeTDemo extends StatefulWidget {
  @override
  _STState createState() => _STState();
}

class _STState extends State<SizeTDemo> with SingleTickerProviderStateMixin {
  AnimationController controller;

  CurvedAnimation animation;

  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

//    animation =
//        CurvedAnimation(parent: controller, curve: Cubic(0.5, 0.5, 0.5, 0.5));

    ///动画开始
    controller.forward();
  }
  Widget _buildWidget(){
    return Center(
      child: Container(
        child: Row(
          children: <Widget>[
            Text("A"),
            Text("B"),
           Text("C")
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("SizeTransition简单使用")),
        elevation: 0.0,
      ),
      body: SizeTransition(
          sizeFactor: controller,
          axis: Axis.horizontal,
          axisAlignment: -1.0,
          ///默认值
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
          )),
//      body:Container(
//          height: 300,///因为SizeTransition的axis是水平的，所以可以单独设置高，但是不能把宽度写死
//          decoration: BoxDecoration(
//            color: Colors.red,
//          ),
//          child: SizeTransition(
//              sizeFactor: controller,
//              axis: Axis.horizontal,
//              axisAlignment: 10.0,
//              ///默认值
//              child:  Container(
//                width: 200,
//                height: 200,
//                decoration: BoxDecoration(
//                  color: Colors.yellow,
//                ),
//              )),
//
//      ),

      ///如果把sizeTransition放在大小固定的widget，则sizeTransition不会工作
//      body: Container(
//        width: 100,
//        height: 100,
//        decoration: BoxDecoration(
//          color: Colors.red,
//        ),
//        child: SizeTransition(sizeFactor: animation),
//      ),
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

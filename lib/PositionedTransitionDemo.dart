import 'package:flutter/material.dart';
//循环放大和缩小效果
class PTDemo extends StatefulWidget {
  @override
  _PTState createState() => _PTState();
}

class _PTState extends State<PTDemo>
    with SingleTickerProviderStateMixin {

  Animation<RelativeRect> animation;//动画对象
  AnimationController controller;//动画控制器
  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);


    RelativeRectTween rectTween=  RelativeRectTween(
      begin: RelativeRect.fromLTRB(
        100.0,///l child.left 到此left边的距离为0
        100.0,///t child.top的距离到此rect.top的距离为0
        100.0,///r child.right的距离到此rect.rignt的距离为0
        100.0,///t child.bottom到此rect.bottom边的距离为100
      ),
      end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    );

    animation = rectTween.animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();///动画开始
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("PositionTranstion简单使用")),
        elevation: 0.0,
      ),
      body:Stack(
        children: <Widget>[
          PositionedTransition( //这玩意必须作为Stack的子widget
            rect: animation,
            child:Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    width: 5.0, color: Colors.green
                  )
              ),
            ),
          ),
        ],
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

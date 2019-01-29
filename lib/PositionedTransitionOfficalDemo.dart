import 'package:flutter/material.dart';
///可以实现从start  rect的大小 变化到 end 的rect 大小
class PTDemo2 extends StatefulWidget {
  @override
  _PTState createState() => _PTState();
}

class _PTState extends State<PTDemo2>
    with SingleTickerProviderStateMixin {

  Animation<RelativeRect> animation;//动画对象
  AnimationController controller;//动画控制器
  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    RelativeRectTween rectTween=  RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0,0.0,240.0,240.0),
      end: const RelativeRect.fromLTRB(240.0,240, 0.0, 0.0),
    );

    ElasticInOutCurve  elasticInOut = const ElasticInOutCurve();

    animation = rectTween.animate(CurvedAnimation(parent: controller, curve: elasticInOut));

    //如果不使用CurvedAnimation的话，使用下面这句就是简单的平移了，读者可以试着去掉看看效果
//   animation = rectTween.animate(controller);
    controller.forward();///动画开始
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("PositionTranstion官方demo")),
        elevation: 0.0,
      ),
      body:Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
                width: 5.0, color: Colors.grey
            )
        ),
        child:
          Stack(
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
      )
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

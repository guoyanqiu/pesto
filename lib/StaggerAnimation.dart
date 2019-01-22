import 'package:flutter/material.dart';

///交错动画

class _StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  _StaggerAnimation({Key key, this.controller}) : super(key: key) {

    height = Tween<double>(begin: 0, end: 300.0)
        .animate(
           CurvedAnimation(
              parent: controller,
               curve: Interval(0.0, 0.6, curve: Curves.ease)
        ///间隔，前60%的动画时间
        ));

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)

        ///间隔，前60%的动画时间
        ));

    padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: 0.0),
            end: EdgeInsets.only(left: 250.0))
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)

            ///间隔，后40%的动画时间
            ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildWidget,
      animation: controller,
    );
  }


  ///widget 参数没用到
  Widget _buildWidget(BuildContext context, Widget child) {
    return Container(
        alignment: Alignment.bottomLeft,
        padding: padding.value,
        child: Container(
          color: color.value,
          width: 50.0,
          height: height.value,
        ));
  }
}

class StaggerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StaggerDemoState();
  }
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: 3), vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child:Text("AnimatedBuilder的简单使用")),
          elevation: 0.0,
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _playAnimation,
          child: Center(
              child: Column(
                children: <Widget>[
                  Text("点击灰色区域"),
                  Container(
                    width: 300.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                            color: Colors.green
                        )
                    ),
                    child: _StaggerAnimation(controller: _controller,),
                  ),
                ],
              )
          ),
        )
    );
    /// 从这里可以看出，animation其实和wiget是无关的
  }

//
  Future<Null> _playAnimation() async {
    try {
      ///先正向执行动画
      await _controller.forward().orCancel;

      ///再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {}
  }


}

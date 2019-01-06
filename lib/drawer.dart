import 'package:flutter/material.dart';



// This widget is essentially the backdrop itself.
class BackdropDemo extends StatefulWidget {
  @override
  _BackdropDemoState createState() => _BackdropDemoState();
}

class _BackdropDemoState extends State<BackdropDemo>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');

  //AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值。默认情况下，
  AnimationController _controller;

  //初始化第一个级别

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 2.0,
      //vsync对象会绑定动画的定时器到一个可视的widget，所以当widget不显示时，
      // 动画定时器将会暂停，当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。
      // 如果要使用自定义的State对象作为vsync时，请包含TickerProviderStateMixin。
      vsync: this,
    );
  }

  @override
  void dispose() {
    //动画完成时释放控制器(调用dispose()方法)以防止内存泄漏。
    _controller.dispose();
    super.dispose();
  }

  bool get _backdropPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropPanelVisibility() {
    //-值关闭，+值打开
    //例如，fling()函数允许您提供速度(velocity)、力量(force)、position(通过Force对象)
    _controller.fling(velocity: _backdropPanelVisible ? -2.0 : 2.0);
  }


  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double panelTitleHeight = 48.0;
    final Size panelSize = constraints.biggest;
    final double panelTop = panelSize.height - panelTitleHeight;

    final Animation<RelativeRect> panelAnimation = _controller.drive(
      RelativeRectTween(
        begin: RelativeRect.fromLTRB(
          0.0,
          panelTop - MediaQuery
              .of(context)
              .padding
              .bottom,
          0.0,
          panelTop - panelSize.height,
        ),
        end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
      ),
    );

    final ThemeData theme = Theme.of(context);

    return Container(
      key: _backdropKey,
      color: theme.primaryColor,
      child: Stack(
        children: <Widget>[
          PositionedTransition( //这玩意必须作为Stack的子widget
            rect: panelAnimation,
            child:
            Material(
              elevation: 2.0,
              //左上角和右上角圆角
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _toggleBackdropPanelVisibility,
                    child: Container(
                      height: 48.0,
                      //title 左边距
                      alignment: AlignmentDirectional.center,
                      child: Text(_backdropPanelVisible?"关闭":"打开"),
                    ),
                  ),
                  //下划线分割线
                  const Divider(
                    height: 1.5,
                    color: Colors.red,
                  ),
                  Center(
                    child: Text("抽拉效果"),
                  ),
                ],
              ),
            ),
//
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: LayoutBuilder(
        builder: _buildStack,
      ),
    );
  }
}

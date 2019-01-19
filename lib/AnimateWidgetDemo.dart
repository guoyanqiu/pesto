import 'package:flutter/material.dart';

class _AnimatedWidget extends AnimatedWidget {
  //Animation extends Listenable
  _AnimatedWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("images/111.png",
          width: animation.value, height: animation.value),
    );
  }
}

class AnimatedWidgetDemo extends StatefulWidget {
  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<AnimatedWidgetDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addStatusListener((status) {
        print("------status==" + status.toString());
        if (status == AnimationStatus.completed) {
          //已经完成
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画的初始状态
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return _AnimatedWidget(animation: animation);
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
/**
 * AnimateWidget 含有一个Listenable，而Animation也是继承了Listenable
 * 所以可以将初始化的animation交给listenable,在AnimatedWidget内部调用了
 *
 * @override
    void initState() {
    super.initState();
    widget.listenable.addListener(_handleChange);
    }
 */


//
//
//    abstract class AnimatedWidget extends StatefulWidget {
//    /// Creates a widget that rebuilds when the given listenable changes.
//    ///
//    /// The [listenable] argument is required.
//    const AnimatedWidget({
//    Key key,
//    @required this.listenable
//    }) : assert(listenable != null),
//    super(key: key);
//
//    /// The [Listenable] to which this widget is listening.
//    ///
//    /// Commonly an [Animation] or a [ChangeNotifier].
//    final Listenable listenable;
//
//    /// Override this method to build widgets that depend on the state of the
//    /// listenable (e.g., the current value of the animation).
//    @protected
//    Widget build(BuildContext context);
//
//    /// Subclasses typically do not override this method.
//    @override
//    _AnimatedState createState() => _AnimatedState();
//
//    @override
//    void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//    super.debugFillProperties(properties);
//    properties.add(DiagnosticsProperty<Listenable>('animation', listenable));
//    }
//    }
//
//    class _AnimatedState extends State<AnimatedWidget> {
//    @override
//    void initState() {
//    super.initState();
//    widget.listenable.addListener(_handleChange);
//    }
//
//    @override
//    void didUpdateWidget(AnimatedWidget oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    if (widget.listenable != oldWidget.listenable) {
//    oldWidget.listenable.removeListener(_handleChange);
//    widget.listenable.addListener(_handleChange);
//    }
//    }
//
//    @override
//    void dispose() {
//    widget.listenable.removeListener(_handleChange);
//    super.dispose();
//    }
//
//    void _handleChange() {
//    setState(() {
//    // The listenable's state is our build state, and it changed already.
//    });
//    }
//
//    //回调widget的build方法
//    @override
//    Widget build(BuildContext context) => widget.build(context);
//    }
//
//

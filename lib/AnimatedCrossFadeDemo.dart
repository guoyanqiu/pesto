import 'package:flutter/material.dart';
///点击图片使得两个图片来回切换
///https://docs.flutter.io/flutter/widgets/AnimatedCrossFade-class.html
class AnimatedCrossFadeDemo extends StatefulWidget {
  @override
  _ACFState createState() => _ACFState();
}

class _ACFState extends State<AnimatedCrossFadeDemo> {
   bool isFirst=true;
  _ACFState();

  @override
  Widget build(BuildContext context) {
    String tip = isFirst?"点击图片切换美女2":"点击图片切换美女1";
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("AnimatedCrossFade简单使用")),
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {//点击改变状态
                  isFirst =!isFirst;
                });
              },
              child: Center(
                child:Column(
                  children: <Widget>[
                    Text(tip),
                    AnimatedCrossFade(
                      crossFadeState: isFirst?CrossFadeState.showFirst:CrossFadeState.showSecond,
                      firstChild: Image.asset( "images/beauty5.jpg",width: 200,height: 200,),
                      secondChild: Image.asset("images/beauty6.jpg",height: 300,),
                      duration: Duration(seconds: 3),
                    ),
                  ],
                )
              ),
            ),
          ),
        ));
  }
}

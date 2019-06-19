import 'package:flutter/material.dart';

class APDemo extends StatefulWidget {
  @override
  _APState createState() => _APState();
}

class _APState extends State<APDemo> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("AnimatedPadding简单使用")),
        elevation: 0.0,
      ),
      body: AnimatedPadding(
          duration: Duration(seconds: 2),
          padding: EdgeInsets.all(70),

          curve: Curves.bounceOut,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/RouterAnimation.dart';
import 'package:flutter_app/RouterWidget.dart';

void main() => runApp(FlutterDemo());

class FlutterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter学习笔记", home: FlutterHome());
  }
}

class FlutterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter学习笔记"),
      ),
//      body:DebugDump(),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,position){
            return   ListTile(
              title: Text(list[position].name),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder:list[position].builder));
              },
            );
          }
      ),
    );
  }
}
class _RouterInfo {
  String name;
  WidgetBuilder builder;
  _RouterInfo({this.name, this.builder});
}

final List<_RouterInfo> list = <_RouterInfo>[
  _RouterInfo(name: "AnimationDemo学习笔记", builder: (context) => RouterAnimation()),
  _RouterInfo(name: "常用Widget学习笔记", builder: (context) => RouterWidget()),
  //  _RouterInfo(name: "debugDumpApp", builder: (context) => DebugDump()),
//  _RouterInfo(name: "MyStepper组件的简单使用", builder: (context) => MyStepperDemo()),
];

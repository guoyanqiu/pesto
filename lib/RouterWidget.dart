import 'package:flutter/material.dart';
import 'package:flutter_app/StepperDemo.dart';
import 'package:flutter_app/SwitchDemo.dart';
import 'package:flutter_app/WrapDemo.dart';

class RouterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("常用Widget学习笔记"),
      ),
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
    );;
  }
}
class _RouterInfo {
  String name;
  WidgetBuilder builder;
  _RouterInfo({this.name, this.builder});
}

final List<_RouterInfo> list = <_RouterInfo>[
  _RouterInfo(name: "Switch组件的简单使用", builder: (context) => SwitchDemo()),
  _RouterInfo(name: "Stepper组件的简单使用", builder: (context) => StepperDemo()),
  _RouterInfo(name: "Wrap组件的简单使用", builder: (context) => WrapDemo()),
];

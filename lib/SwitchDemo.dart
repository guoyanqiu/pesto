import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchState createState() => _SwitchState();
}

bool switchValue = false;

class _SwitchState extends State<SwitchDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Switch的简单使用系列")),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              ///ListTile是Flutter ListView的item组件
              title: Text('默认打开，且禁止关闭'),
              trailing: Switch.adaptive(
                  value: true, activeColor: Colors.red, onChanged: null),
            ),
            ListTile(
              ///ListTile是Flutter ListView的item组件
              title: Text('默认关闭，且禁止打开'),
              trailing: Switch.adaptive(value: false, onChanged: null),
            ),
            ListTile(
              ///ListTile是Flutter ListView的item组件
              title: Text('可以打开和关闭(打开设置为红色)'),
              onTap: () {
                setState(() {
                  switchValue = !switchValue;
                });
              },

              ///使用Switch.adaptive
              trailing: Switch.adaptive(
                  value: switchValue,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      switchValue = value;
                    });
                  }),
            ),
            SwitchListTile(
                title: Text('SwitchListTile的简单使用（默认打开蓝色）'),
                value: switchValue,
                onChanged: (bool value) {
                  setState(() {
                    switchValue = value;
                  });
                })
          ],
        ));

    /// 从这里可以看出，animation其实和wiget是无关的
  }
}

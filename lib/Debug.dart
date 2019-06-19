import 'package:flutter/material.dart';

class DebugDump extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: FlatButton(onPressed: (){ debugDumpApp();}, child: Text("测试")),
    );
  }
}

import 'package:flutter/material.dart';
class WrapDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:Key("wrap"),
      appBar: AppBar(
        title: Center(child: Text("Wrap的简单使用")),
        elevation: 0.0,
      ),
      body: _createBody(),
    );
  }

  Widget _createBody(){
    return  Wrap(
       spacing: 8.0, // gap between adjacent chips
       runSpacing: 4.0, // gap between lines
       children: <Widget>[
         Chip(
           avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('AH')),
           label: Text('Hamilton'),
         ),
         Chip(
           avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('ML')),
           label: Text('Lafayette'),
         ),
         Chip(
           avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('HM')),
           label: Text('Mulligan'),
         ),
         Chip(
           avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('JL')),
           label: Text('Laurens'),
         ),
       ],
     );
  }
}
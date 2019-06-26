import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}
class _StepperState extends State<StepperDemo> {
  int current_step = 0;
  List<Step> steps =[
    Step(
      title: Text('stepTitle A'),
      subtitle:Text('disabled状态') ,
      state: StepState.disabled,
      content: Card(
          color:Colors.red,
          child:SizedBox(
            child: Center( child: Text("设置state: StepState.disabled，注意标题setTitle A字体颜色为灰色,此时该Step"
                "不会响应onStepTapped 事件"),),
            width: 600.0,
            height: 100.0,
          )
      ),
    ),
    Step(
      title: Text('stepTitle B'),
      subtitle:Text('activie为true'),
      isActive: true,
      content:  Card(
          color:Colors.blue,
          child:SizedBox(
            child: Center( child: Text("设置isActive: true,此时步骤2为蓝色"),),
            width: 600.0,
            height: 100.0,
          )
      ),
    ),
    Step(
      title: Text('stepTitle C'),
      subtitle:Text('error状态'),
      state: StepState.error,
      content:  Card(
          color:Colors.red,
          child:SizedBox(
            child: Center( child: Text("设置state: StepState.error，表明此步骤错误，为进度条显示红色警告"),),
            width: 600.0,
            height: 100.0,
          )
      ),
    ),
    Step(
      title: Text('stepTitle D'),
      subtitle:Text('editing状态'),
      state: StepState.editing,
      content:  Card(
          color:Colors.yellow,
          child:SizedBox(
            child: Center( child: Text("设置state: StepState.editing，自动设置了编辑状态的铅笔标志"),),
            width: 600.0,
            height: 50.0,
          )
      ),
    ),
    Step(
      title: Text('stepTitle E'),
      subtitle:Text('indexed状态'),
      state: StepState.indexed,
      content:  Card(
          color:Colors.pink,
          child:SizedBox(
            child: Center( child: Text("设置state: StepState.indexed，此状态为默认状态，显示当前步骤的索引"),),
            width: 600.0,
            height: 50.0,
          )
      ),
    ),
    Step(
      title: Text('stepTitle F'),
      subtitle:Text('complete状态'),
      state: StepState.complete,
      content:  Card(
          color:Colors.pink,
          child:SizedBox(
            child: Center( child: Text("设置state: StepState.complete，此状态为默认状态，显示对号"),),
            width: 600.0,
            height: 50.0,
          )
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Stepper简单使用")),
          elevation: 0.0,
        ),
        body: _createStepper()
    );
  }

  Widget _createStepper(){
     return Stepper(
         steps:  steps,
         onStepTapped: (step) {///点击某step直接打开
           setState(() {
             current_step = step;
           });
         },
       currentStep: this.current_step,
       onStepCancel: () {//回到上一步
         setState(() {
           if (current_step > 0) {
             current_step = current_step - 1;
           } else {
             current_step = 0;
           }
         });
       },
       onStepContinue: () {//下一步
         setState(() {
           if (current_step < steps.length - 1) {
             current_step = current_step + 1;
           } else {
             current_step = 0;
           }
         });
       },
     );
  }

  Widget test(){
    return Container(
      margin:const EdgeInsets.all(10.0),
      color: const Color(0xFF00FF00),
      width: 48.0,
      height: 48.0,
    );
  }
}
/**
    如果一个对象是不会改变的，你可以讲这些对象创建为编译时常量。定义cost构造函数，而且要确保所有的常量都是final的。

*/
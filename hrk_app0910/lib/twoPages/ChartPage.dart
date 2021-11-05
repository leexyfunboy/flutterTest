import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget{


  @override
  _DataPageState createState() => new _DataPageState();
}

class _DataPageState extends State<ChartPage>{

  //当前项目的固定箱的个数
  int boxCount = 10;
  //当前显示的box的编号
  int boxid = 1;
  //下拉时间选择框的选中值
  String _timelengthValue = "5";

  //点击上一个按钮时
  void _onClickPreviousButton(){
    if(boxid ==1){
      boxid = boxCount;
    }else{
      boxid--;
    }
  }

  //点击下一个按钮时
  void _onClickNextButton(){
    if(boxid ==boxCount){
      boxid = 1;
    }else{
      boxid++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(child:Text("上一个"),onPressed: (){
                _onClickPreviousButton();
              }),
              Text("时长"),
              DropdownButton(
                value: _timelengthValue,
                items: [
                  DropdownMenuItem(child: Text("5"),value: "5",),
                  DropdownMenuItem(child: Text("6"),value: "6",),
                  DropdownMenuItem(child: Text("12"),value: "12",),
                  DropdownMenuItem(child: Text("24"),value: "24",),
                ],
                onChanged: (value){
                  setState(() {
                    _timelengthValue = value.toString();
                  });
                  print("_timelengthValue"+_timelengthValue);
                },
              ),
              RaisedButton(child:Text("下一个"),onPressed: (){
                _onClickNextButton();
              } ),
            ],
          ),
        ],
      ),
    );
  }
}
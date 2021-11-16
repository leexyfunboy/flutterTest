import "package:flutter/material.dart";



class Register extends StatefulWidget{

  Register({Key?key,required this.title}) : super(key:key);
  final String title;


  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register>{

  var _dropdownValue_company = "1";
  var _dropdownValue_project = "1";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset:false,
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding:const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Text("选择公司：",style: TextStyle(fontSize: 15),),
                      DropdownButton(
                        value: _dropdownValue_company,
                        items: [
                          DropdownMenuItem(child: Text("11111111"),value: "1",),
                          DropdownMenuItem(child: Text("22222222"),value: "2",),
                          DropdownMenuItem(child: Text("33333333"),value: "3",),
                          DropdownMenuItem(child: Text("44444444"),value: "4",),
                          DropdownMenuItem(child: Text("55555555"),value: "5",),
                          DropdownMenuItem(child: Text("66666666"),value: "6",),
                          DropdownMenuItem(child: Text("77777777"),value: "7",),
                        ],
                        onChanged: (value){
                          setState(() {
                            _dropdownValue_company = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Text("选择项目：",style: TextStyle(fontSize: 15),),
                      DropdownButton(
                        value: _dropdownValue_project,
                        items: [
                          DropdownMenuItem(child: Text("11111111"),value: "1",),
                          DropdownMenuItem(child: Text("22222222"),value: "2",),
                          DropdownMenuItem(child: Text("33333333"),value: "3",),
                          DropdownMenuItem(child: Text("44444444"),value: "4",),
                          DropdownMenuItem(child: Text("55555555"),value: "5",),
                          DropdownMenuItem(child: Text("66666666"),value: "6",),
                          DropdownMenuItem(child: Text("77777777"),value: "7",),
                        ],
                        onChanged: (value){
                          setState(() {
                            _dropdownValue_project = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:BorderSide(
                                width: 3,
                                color: Colors.green
                            )
                        ),
                        hintText: '请输入姓名',
                        labelText: '姓名：'
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:BorderSide(
                                width: 3,
                                color: Colors.green
                            )
                        ),
                        hintText: '请输入手机',
                        labelText: '手机：'
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:BorderSide(
                                width: 3,
                                color: Colors.green
                            )
                        ),
                        hintText: '请输入密码',
                        labelText: '密码：'
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:BorderSide(
                                width: 3,
                                color: Colors.green
                            )
                        ),
                        hintText: '请重复刚才的密码',
                        labelText: '再次输入密码：'
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){

                      },
                      child: Text('注册'),
                    ),
                    ElevatedButton(
                      onPressed: (){

                      },
                      child: Text('重置'),
                    )
                  ],
                )
              ],
            )

        ),
      ),
    );
  }
}


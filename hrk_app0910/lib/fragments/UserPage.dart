import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          // appBar: AppBar(
          //   title: Text("User"),
          //   leading: Icon(Icons.home),
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),
                          child: Text("name",
                            style: TextStyle(fontSize:38),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(40, 10, 30, 0),
                          child:
                          Text("telephone",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20,color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(10, 10 , 0, 0),
                          child: Text("projectname",
                            style: TextStyle(fontSize:20,color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                          child:
                          Text("deptname",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20,color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Card(
                          color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text("查看权限",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:14,backgroundColor: Colors.grey,color: Colors.black),
                                ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text("10",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:14,backgroundColor: Colors.grey,color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text("操作权限",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:14,backgroundColor: Colors.grey,color: Colors.black),
                                ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text("10",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:14,backgroundColor: Colors.grey,color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text("管理权限",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:14,backgroundColor: Colors.grey,color: Colors.black),
                                ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text("10",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:14,backgroundColor: Colors.grey,color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      alignment: Alignment.topLeft,
                      child: Padding(padding: EdgeInsets.fromLTRB(20, 0 , 0, 0),
                        child: Text("传感器报警设置",
                          style: TextStyle(fontSize:26,color: Colors.black,backgroundColor: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      alignment: Alignment.topLeft,
                      child:  Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child:Text("员工管理",
                            style: TextStyle(fontSize:26,color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      alignment: Alignment.topLeft,
                      child: Padding(padding: EdgeInsets.fromLTRB(20, 0 , 0, 0),
                        child: Text("入职申请",
                          style: TextStyle(fontSize:26,color: Colors.black,backgroundColor: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      alignment: Alignment.topLeft,
                      child:  Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child:Text("用户管理",
                          style: TextStyle(fontSize:26,color: Colors.black,backgroundColor: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

      ),
    );
  }
}
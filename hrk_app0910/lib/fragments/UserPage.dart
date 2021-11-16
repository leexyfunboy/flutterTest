import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrk_app0910/fragments/item_headerInfo.dart';
import 'package:hrk_app0910/userchoice/RegisterCheck.dart';
import 'package:hrk_app0910/userchoice/SensorReferencePage.dart';
import 'package:hrk_app0910/userchoice/UserInfoPage.dart';
import 'package:hrk_app0910/userchoice/usermanagement.dart';

class UserPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          // appBar: AppBar(
          //   title: Text("User"),
          //   leading: Icon(Icons.home),
          // ),
        backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              item_headerInfo(),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    GestureDetector(
                      child: Card(
                        color: Colors.white70,
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Padding(padding: EdgeInsets.fromLTRB(20, 5 , 0, 5),
                          child: Text("传感器报警设置",
                            style: TextStyle(fontSize:26,color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return SensorReferencePage();
                            })
                        );
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        color: Colors.white70,
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Padding(padding: EdgeInsets.fromLTRB(20, 5 , 0, 5),
                          child: Text("员工管理",
                            style: TextStyle(fontSize:26,color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return UsermanagementPage();
                            })
                        );
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        color: Colors.white70,
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Padding(padding: EdgeInsets.fromLTRB(20, 5 , 0, 5),
                          child: Text("入职申请",
                            style: TextStyle(fontSize:26,color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return RegisterCheck();
                            })
                        );
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        color: Colors.white70,
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Padding(padding: EdgeInsets.fromLTRB(20, 5 , 0, 5),
                          child: Text("用户管理",
                            style: TextStyle(fontSize:26,color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return UserInfoPage();
                            })
                        );
                      },
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
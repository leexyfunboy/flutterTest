import 'package:flutter/material.dart';

class Item_usermanagement extends StatefulWidget{


  @override
  _Item_usermanagement createState() => _Item_usermanagement();
}

class _Item_usermanagement extends State<Item_usermanagement>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(10, 0 , 0, 0),

                child: Text("name",
                  style: TextStyle(fontSize:30),
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
              Padding(padding: EdgeInsets.fromLTRB(10, 5 , 0, 0),
                child: Text("projectname",
                  style: TextStyle(fontSize:20,color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(10, 5, 30, 0),
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
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text("查看权限",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:14,backgroundColor: Colors.grey,color: Colors.black),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text("操作权限",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:14,backgroundColor: Colors.grey,color: Colors.black),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text("管理权限",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:14,backgroundColor: Colors.grey,color: Colors.black),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
      // body: SizedBox(
      //   width: 40,
      //   height: 40,
      //   child:
      // ),
    );
  }
}
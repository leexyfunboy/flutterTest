import 'package:flutter/material.dart';
import 'package:hrk_app0910/entity/User.dart';
import 'package:hrk_app0910/tools/DartHttpUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class item_headerInfo extends StatefulWidget{


  @override
  State createState() => item_headerInfoState();
}

/**
 * 获取登录用户信息对象的json字符串
 */
Future<String> getUserinfo() async{
  String res = "";
  SharedPreferences _sp = await SharedPreferences.getInstance();
  String userinput = _sp.get("userinput");
  DartHttpUtils dartHttpUtils = new DartHttpUtils();
  dartHttpUtils.search_Userinfo(userinput).then((value) => (){
    res = value;
    print("userinfo:: "+value);
  });
  return res;
}

class item_headerInfoState extends State<item_headerInfo>{



  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
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
                color: Colors.white60,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text("查看权限",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:14,color: Colors.black),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text("10",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:14,color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white60,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text("操作权限",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:14,color: Colors.black),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text("10",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:14,color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white60,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text("管理权限",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:14,color: Colors.black),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text("10",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:14,color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    getUserinfo();
  }
}
import 'package:flutter/material.dart';
import 'package:hrk_app0910/models/department.dart';
import 'package:hrk_app0910/models/user.dart';
import 'package:hrk_app0910/tools/DartHttpUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class item_headerInfo extends StatefulWidget{


  @override
  State createState() => item_headerInfoState();
}

/**
 * 获取登录用户信息对象的json字符串
 */
Future<User> getUserinfo() async{
  String res = "";
  User user = User();
  Map<String,dynamic> user_json = Map<String,dynamic>();
  SharedPreferences _sp = await SharedPreferences.getInstance();
  String userinput = _sp.get("userinput");
  DartHttpUtils dartHttpUtils = new DartHttpUtils();
  await dartHttpUtils.search_Userinfo(userinput).then((value){
    res = value;
    user_json = convert.jsonDecode(value);
    user = User.fromJson(user_json);
    // print("userinfo:: "+res);

  });

  return user;
}

/**
 * 获取登录用户的公司名
 */
Future<String> getCompanyName(String companyid) async{
  String res = "";
  Map<String,dynamic> companyname_json = Map<String,dynamic>();
  DartHttpUtils dartHttpUtils = new DartHttpUtils();
  await dartHttpUtils.search_Companyinfo(companyid).then((value){
    if(value.length<=2){
      print("companyname:: "+value);
    }else{
      res = value;
      res = res.substring(1,(res.length-1));    //去除首尾的两个中括号[]
      print("companyname:: "+res);
    }
  });
  return res;
}

/**
 * 获取登录用户的部门名称
 */
Future<String> getDeptName(String deptid) async{
  String res = "";
  Map<String,dynamic> json_department = Map<String,dynamic>();
  Department department = Department();
  DartHttpUtils dartHttpUtils = new DartHttpUtils();
  await dartHttpUtils.search_Department(deptid).then((value){
    // List list = convert.json.decode(value);
    // json_department = convert.jsonDecode(value[0]);
    // department = Department.fromJson(json_department);
    print("deptname::"+convert.json.decode(value)[0]["deptname"]);
    res = convert.json.decode(value)[0]["deptname"];
  });
  return res;
}

Future<User> getUserDetails() async{
  User user = User();
  getUserinfo().then((value){
    getCompanyName(value.companyid).then((value){
      user.companyid = value;
    });
    getDeptName(value.deptid).then((value){
      user.deptid = convert.json.decode(value)[0]["deptname"];
    });
  });
  return user;
}

class item_headerInfoState extends State<item_headerInfo>{

  item_headerInfoState();

  var _mfuture ;
  late String _username = "";
  late String _telephone = "";

  @override
  void initState() {
    super.initState();
    _mfuture = getUserinfo();
  }

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: FutureBuilder(
          future: getUserinfo(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              }else {
                // 请求成功，显示数据
                User user = snapshot.data;
                // return Text("Contents: ${snapshot.data.toString()}");
                return Card(
                  shadowColor: Colors.grey,
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.fromLTRB(10, 10 , 0, 0),
                            child:Text(user.username,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24,color: Colors.black),
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(40, 10, 30, 0),
                            child:
                            Text(user.telephone,
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
                            child: Text(user.companyid,
                              style: TextStyle(fontSize:20,color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
                            child:
                            Text(user.deptid,
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
                                  child: Text(user.authority_message.toString(),
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
                                  child: Text(user.authority_action.toString(),
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
                                  child: Text(user.authority_admin.toString(),
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
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
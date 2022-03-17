import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrk_app0910/fragments/item_headerInfo.dart';
import 'package:hrk_app0910/models/user.dart';
import 'package:hrk_app0910/tools/DartHttpUtil.dart';
import 'package:hrk_app0910/userchoice/RegisterCheck.dart';
import 'package:hrk_app0910/userchoice/SensorReferencePage.dart';
import 'package:hrk_app0910/userchoice/UserInfoPage.dart';
import 'package:hrk_app0910/userchoice/usermanagement.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:async/async.dart' show AsyncMemoizer;

class UserPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => UserPageState();

}

class UserPageState extends State<UserPage> with AutomaticKeepAliveClientMixin {



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      home: Scaffold(
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
                      child: Padding(padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                        child: Text("传感器报警设置",
                          style: TextStyle(fontSize: 26, color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SensorReferencePage();
                          })
                      );
                    },
                  ),
                  GestureDetector(
                    child: Card(
                      color: Colors.white70,
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: Padding(padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                        child: Text("员工管理",
                          style: TextStyle(fontSize: 26, color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return UsermanagementPage();
                          })
                      );
                    },
                  ),
                  GestureDetector(
                    child: Card(
                      color: Colors.white70,
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: Padding(padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                        child: Text("入职申请",
                          style: TextStyle(fontSize: 26, color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return RegisterCheck();
                          })
                      );
                    },
                  ),
                  GestureDetector(
                    child: Card(
                      color: Colors.white70,
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: Padding(padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                        child: Text("用户管理",
                          style: TextStyle(fontSize: 26, color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("iiiiiiiiiii");
  }
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
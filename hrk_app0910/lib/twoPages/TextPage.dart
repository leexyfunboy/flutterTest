import 'package:flutter/material.dart';
import 'package:hrk_app0910/tools/DartHttpUtil.dart';
import 'package:hrk_app0910/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class TextPage extends StatefulWidget{

  String target_box;

  TextPage({Key?key,required this.target_box});
  @override
  _TextPageState createState() =>  _TextPageState(target_box: target_box);


}

class _TextPageState extends State<TextPage> with AutomaticKeepAliveClientMixin{

  String target_box;
  _TextPageState({required this.target_box});


  User logedUser = User();
  String _project_dbName = "";
  String projectid = "";

  /**
   * 获取登录用户信息对象的json字符串
   */
  Future<User> getUserinfo() async{
    User user = User();
    Map<String,dynamic> user_json = Map<String,dynamic>();
    SharedPreferences _sp = await SharedPreferences.getInstance();
    String userinput = _sp.get("userinput");
    DartHttpUtils dartHttpUtils = new DartHttpUtils();
    await dartHttpUtils.search_Userinfo(userinput).then((value){
      user_json = convert.jsonDecode(value);
      user = User.fromJson(user_json);
      // print("userinfo:: "+res);

    });

    return user;
  }

  /**
   * 获取该用户的项目数据库名，并查询该项目最近时刻的数据
   */
  Future<Map<String,String>> getProject_dbName(String projectid) async{
    DartHttpUtils dartHttpUtils = DartHttpUtils();
    Map<String,String> res = Map<String,String>();
    await dartHttpUtils.search_ProjectDBname(projectid).then((value){
      List list_project = convert.json.decode(value);
      _project_dbName = list_project[0]["db_name"];
      print("getProject_dbName target_box::: "+target_box);
      refreshBoxDetails_TextPage(target_box, _project_dbName).then((value){
        res = value;
        // print("value::"+value.toString());
      });
    });
    // print("res::map_value::"+res.toString());
    return map_data;
  }

  /**
   * 刷新文本界面的数据
   */
  Future<Map<String,String>> refreshBoxDetails_TextPage(String target_box,String dbName) async{
    DartHttpUtils dartHttpUtils = DartHttpUtils();
    print("refreshBoxDetails_TextPage target_box:: "+target_box);
    Map<String,String> map =Map<String,String>();
    await dartHttpUtils.select_BoxDetails(target_box, dbName).then((value){
      List list_boxdetails = convert.json.decode(value);
      map_data.addAll({"a":list_boxdetails[0]["a"],
                        "b":list_boxdetails[0]["b"],
                        "c":list_boxdetails[0]["c"],
                        "d":list_boxdetails[0]["d"],
                        "e":list_boxdetails[0]["e"],
                        "f":list_boxdetails[0]["f"],
                        "g":list_boxdetails[0]["g"],
                        "h":list_boxdetails[0]["h"],
                        "i":list_boxdetails[0]["i"],
                        "j":list_boxdetails[0]["j"],
                        "k":list_boxdetails[0]["k"],
                        "l":list_boxdetails[0]["l"],
                        "m":list_boxdetails[0]["m"],
                        "n":list_boxdetails[0]["n"],
                        "o":list_boxdetails[0]["o"],
                        "p":list_boxdetails[0]["p"],
                        "dc":list_boxdetails[0]["dc"],
      });

    });

    // print("map::"+map_data.toString());
    return map;
  }


  @override
  void initState() {
    super.initState();
    getUserinfo().then((value){
      logedUser = value;
      // print("initState projectid::"+logedUser.projectid);
      projectid = logedUser.projectid;
      // getProject_dbName(logedUser.projectid).then((value){
      //
      // });
    });

  }


  Map<String,String> map_data = Map<String,String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        body:
        Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                FutureBuilder(
                    future: getProject_dbName(projectid),
                    builder:(BuildContext context,AsyncSnapshot snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        if(snapshot.hasError){
                          return Text("数据获取失败！！");
                        }else{
                          map_data = snapshot.data;
                          return  Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(
                                  children: [
                                    TableCell(child: Text("空气温度：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['a'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("空气湿度：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['b'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("土壤温度：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['c'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("土壤湿度：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['d'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("CO2浓度：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['e'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("光照强度：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['f'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("大气压强：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['g'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("空气流速：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['h'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("风向：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['i'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("土壤EC：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['j'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("土壤PH：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['k'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("土壤氮含量：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['l'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("土壤磷含量：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['m'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("土壤钾含量：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['n'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("日照长度：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['o'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("辐照度：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['p'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(child: Text("电量：",style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text(map_data['dc'].toString(),style: TextStyle(color: Colors.black),)),
                                    TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                                  ]
                              ),
                            ],
                          );
                        }
                      } else {
                        // 请求未结束，显示loading
                        return CircularProgressIndicator();
                      }
                    }
                ),

              ],
            ),
        ],),

    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


}
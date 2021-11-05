import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrk_app0910/main.dart';
import 'package:dio/dio.dart';
import 'package:hrk_app0910/mainmenu.dart';
import 'package:hrk_app0910/menupage.dart';
import 'package:hrk_app0910/register.dart';
import 'package:hrk_app0910/tools/DartHttpUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';
//MD5加密
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Login Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int flag = 0;
  //为两个输入框绑定的FocusNode对象
  FocusNode _focusNode_userinput = new FocusNode();
  FocusNode _focusNode_password = new FocusNode();
  //为两个输入框绑定
  var _tf_userinput = new TextEditingController();
  var _tf_userpassword = new TextEditingController();


  //核验两个输入框的输入
  void checkuserinputForm(){
    String userinput = _tf_userinput.text.toString();
    String userpassword = _tf_userpassword.text.toString();
    print("userinput::"+userinput);
    print("userpassword::"+userpassword);
    if (userinput==""|| userpassword=="") {
      Fluttertoast.showToast(msg:"账号和密码不能为空！！",textColor: Colors.red);
      print("Toast::");
    }else{
      userpassword = transformToMD5(userpassword).toString();
      _login(userinput,userpassword).then((value){
        String res = value;
        print("res ::"+res);
        toNextMainmenu(res);
      });
    }
  }

  void toNextMainmenu(String res){
    if(res=="1"){
      showToast("登录成功");
      setSharedPreferences_logininfo(_tf_userinput.text.toString());
      getSharedPreferences_logininfo().then((value){
        print("sp::"+value);
      }).catchError((MissingPluginException){
        print("sp出错");
      });
      Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                  return Mainmenu();
              }));
    }else if(res=="2"){
      Fluttertoast.showToast(msg: "密码错误",textColor: Colors.red);
    }else if(res=="10"){
      Fluttertoast.showToast(msg: "没有该用户",textColor: Colors.red);
    }else if(res=="101"){
      Fluttertoast.showToast(msg: "用户非在职",textColor: Colors.red);
    }else if(res=="11"){
      Fluttertoast.showToast(msg: "response返回错误",textColor: Colors.red);
    }
  }


  Future<void> setSharedPreferences_logininfo(String userinput) async{
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.setString("userinput", userinput);
  }

  Future<String> getSharedPreferences_logininfo() async{
    SharedPreferences _sp = await SharedPreferences.getInstance();
    String res = _sp.getString("userinput");
    print("getSp:::"+res);
    return Future.value(res);
  }



  //Toast提示（公共）
  void showToast(String msg){
    Fluttertoast.showToast(msg: msg);
  }

  /**
   * 将密码转换成MD5编码
   */
  transformToMD5(String password){
    var content = new Utf8Encoder().convert(password);
    var digest = md5.convert(content);
    print(digest);
    return digest;
  }

  @override
  void initState() {
    _focusNode_userinput.addListener(() {
      print("点击账号");

    });

    _focusNode_password.addListener(() {
      print("点击密码");
      var _userinput = _tf_userinput.text;

      //print("_tf_userinput.text ==> "+_tf_userinput.text);
      if(_userinput.isEmpty){
        print("_tf_userinput.text ==> 为空");
      }else{
        print("_tf_userinput.text ==> "+_tf_userinput.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset:false,
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body:Container(
        width: 400,
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(10, 90, 10, 10),
                  child: Text('登录',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25
                    ),
                  ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                      child: TextField(
                        autofocus: true,
                        focusNode: _focusNode_userinput,
                        controller: _tf_userinput,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:BorderSide(
                                  width: 3,
                                  color: Colors.blue
                              )
                          ),
                          labelText: '账号：',
                          hintText: '输入手机/用户名/工号',
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                      child: TextField(
                        autofocus: true,
                        focusNode: _focusNode_password,
                        controller: _tf_userpassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:BorderSide(
                                  width: 3,
                                  color: Colors.blue
                              )
                          ),
                          labelText: '密码：',
                          hintText: '输入密码',
                        ),
                      )
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: ()=>checkuserinputForm(),
                        //     (){
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context){
                        //           return Mainmenu();
                        //       })
                        //   );
                        // },
                        child: Text('登录'),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Register()),
                          );
                        },
                        child: Text('注册'),
                      )
                    ],
                  ),)
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}



Future<String> _login(String userinput,String userpassword) async {
  Response response;
  String res ;
  DartHttpUtils dartHttpUtils = new DartHttpUtils();
  //dartHttpUtils.getParametersDio();
  res = await dartHttpUtils.postUrlencodedDio(userinput,userpassword);
  // dio.options.baseUrl = "http://192.168.101.3:8080/HRK_server0729";
  // dio.options.connectTimeout = 5000;
  // dio.options.receiveTimeout = 3000;
  //
  //

  // response = await dio.post('/login', queryParameters: {'userid': '李昕煜', 'userpassword': '123456'});

  return Future.value(res);

}

void _register(){



}

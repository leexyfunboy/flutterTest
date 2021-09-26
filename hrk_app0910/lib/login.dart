import 'package:flutter/material.dart';
import 'package:hrk_app0910/main.dart';
import 'package:dio/dio.dart';
import 'package:hrk_app0910/register.dart';


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
  int _counter = 0;
  String _userinput = '';
  String _userpassword = '';

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('登录',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25
                    ),),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: '账号：',
                          hintText: '输入手机/用户名/工号',
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                      child: TextField(
                        autofocus: true,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: '密码：',
                          hintText: '输入密码',
                        ),
                      )
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: (){
                              Navigator.push(
                              context,
                              new MaterialPageRoute(
                              builder: (context) => new MyApp()),
                            );
                          },
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
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

Future<void> _login() async {
  Response response;
  Dio dio = new Dio();
  dio.options.baseUrl = "http://192.168.101.3:8080/HRK_server0729";
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 3000;


  response = await dio.post('/login', queryParameters: {'userid': '李昕煜', 'userpassword': '123456'});

  print(response);

}

void _register(){



}

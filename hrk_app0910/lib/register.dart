import "package:flutter/material.dart";

class Register extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '注册',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterPage(title:'Register') ,
    );
  }

}

class RegisterPage extends StatefulWidget{

  RegisterPage({Key?key,required this.title}) : super(key:key);
  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding:const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: '请输入公司名称',
                  labelText: '公司：'
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: '请输入公司项目',
                    labelText: '项目：'
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
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
                    hintText: '请重复刚才的密码',
                    labelText: '再次输入密码：'
                ),
              ),
            ),
            Row(

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
        ),
      ),
    );
  }
}


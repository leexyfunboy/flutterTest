import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget{

  @override
  State createState() => _UserInfoPageState();

}

class _UserInfoPageState extends State<UserInfoPage>{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(10, 20,10, 0),
            child: Table(
              children: [
                TableRow(
                    children: [
                      TableCell(
                        child: Text("工号："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("姓名："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("手机："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("邮箱："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("公司："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("项目："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("部门："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("查看权限："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("操作权限："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("管理权限："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("在职状态："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                        child: Text("备注："),
                      ),
                      TableCell(
                        child: Text("xxxxxxxxx"),
                      ),
                    ]
                ),
              ],
            ),
            ),
            RaisedButton(
                child: Text("确定更改"),
              onPressed: (){

              },
            ),
          ],
        ),
      ),
    );
  }
}
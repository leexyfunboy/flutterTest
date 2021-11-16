import 'package:flutter/material.dart';
import 'package:hrk_app0910/userchoice/Item_registercheck.dart';

class RegisterCheck extends StatefulWidget{


  @override
  State createState() => RegisterCheckState();
}

class RegisterCheckState extends State<RegisterCheck>{


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
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child:  Text("公司名",style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child:  Text("姓名",style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                children: <Widget>[
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                  Item_registercheck(),
                ],
              ),)
          ],
        ),
      ),
    );
  }
}
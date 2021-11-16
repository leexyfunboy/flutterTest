import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrk_app0910/userchoice/Item_usermanagement.dart';


class UsermanagementPage extends StatefulWidget{


  @override
  _UsermanagementPageState createState() => _UsermanagementPageState();

}

class _UsermanagementPageState extends State<UsermanagementPage>{


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
            Expanded(
                child: Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Item_usermanagement(),
                      Item_usermanagement()
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
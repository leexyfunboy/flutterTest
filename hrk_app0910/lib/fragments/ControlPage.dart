import 'package:flutter/material.dart';

class ControlPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          appBar: AppBar(
            title: Text("home"),
            leading: Icon(Icons.home),
          ),
          body: ListView(
            children: <Widget>[

            ],
          ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hrk_app0910/fragments/MyTab.dart';

class Mainmenu extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:MyTab()//只要home，占满屏幕
    );
  }
}

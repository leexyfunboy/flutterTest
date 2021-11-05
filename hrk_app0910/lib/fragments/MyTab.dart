import 'package:flutter/material.dart';
import 'package:hrk_app0910/fragments/ControlPage.dart';
import 'package:hrk_app0910/fragments/DataPage.dart';
import 'package:hrk_app0910/fragments/UserPage.dart';

class MyTab extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _TabState();
  }
}

class _TabState extends State<MyTab>{

  int _currentIndex = 0;
  List _pageList=[DataPage(),ControlPage(),UserPage()];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: _pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          fixedColor: Colors.purple,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("数据")),
            BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("操控")),
            BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("用户")),
          ],

        ),
      ),
    );
  }

}
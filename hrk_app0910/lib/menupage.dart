import 'package:flutter/material.dart';
import 'package:hrk_app0910/Login.dart';
import 'package:hrk_app0910/main.dart';
import 'package:hrk_app0910/register.dart';


class menupage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo menu Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  Widget _currBody = MyApp();

  _onTap(int index) {
    switch (index) {
      case 0:
        _currBody = MyApp();
        break;
      case 1:
        _currBody = Register(title: '',);
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currBody,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('查看'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text('操作'), icon: Icon(Icons.book)),
          BottomNavigationBarItem(
              title: Text('用户'), icon: Icon(Icons.perm_identity)),
        ],
      ),
    );
  }
}

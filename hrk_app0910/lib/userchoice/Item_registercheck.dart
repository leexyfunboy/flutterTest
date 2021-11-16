import 'package:flutter/material.dart';

class Item_registercheck extends StatefulWidget{

  @override
  State createState() => _Item_registercheck();

}

class _Item_registercheck extends State<Item_registercheck>{


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text("name",style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text("telephone",style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
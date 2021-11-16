import 'package:flutter/material.dart';

class TextPage extends StatefulWidget{


  @override
  _TextPageState createState() => new _TextPageState();
}

class _TextPageState extends State<TextPage>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                        children: [
                          TableCell(child: Text("空气温度：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("空气湿度：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤温度：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤湿度：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("CO2浓度：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("光照强度：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("大气压强：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("空气流速：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("风向：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤EC：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤PH：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤氮含量：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤磷含量：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤钾含量：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("日照长度：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("辐照度：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("电量：",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("123456789",style: TextStyle(color: Colors.black),)),
                          TableCell(child: Text("###",style: TextStyle(color: Colors.red),)),
                        ]
                    ),
                  ],
                ),
              ],
            ),
        ],),

    );

  }
}
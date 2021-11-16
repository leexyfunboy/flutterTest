import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SensorReferencePage extends StatefulWidget{


  @override
  _SensorReferencePageState createState() => _SensorReferencePageState();
}

class _SensorReferencePageState extends State<SensorReferencePage>{


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
            Expanded(child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Table(
                  border: TableBorder(
                    top: BorderSide(color: Colors.red),
                    left: BorderSide(color: Colors.red),
                    right: BorderSide(color: Colors.red),
                    bottom: BorderSide(color: Colors.red),
                    horizontalInside: BorderSide(color: Colors.red),
                    verticalInside: BorderSide(color: Colors.green),
                  ),
                  children: [
                    TableRow(
                        children: [
                          TableCell(child: Text("传感器",style:TextStyle(fontSize: 12),),),
                          TableCell(child: Text("最小报警",style: TextStyle(fontSize: 12),),),
                          TableCell(child: Text("正常最小",style: TextStyle(fontSize: 12),),),
                          TableCell(child: Text("正常最大",style: TextStyle(fontSize: 12),),),
                          TableCell(child: Text("最大报警 ",style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("空气温度：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("空气湿度：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤温度：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤湿度：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("CO2浓度：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("光照强度：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("大气压强：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("空气流速：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("风向：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤EC：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤PH：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤氮含量：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤磷含量：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("土壤钾含量：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("日照长度：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("辐照度：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Text("电量：",style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                          TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
                        ]
                    ),
                  ],
                ),
              ],
            ),),
            RaisedButton(
              color: Colors.blue,
              child: Text("更新"),
                onPressed: (){

                })
            // Padding(padding: EdgeInsets.fromLTRB(5, 30, 5, 0),
            // child:
            // CustomScrollView (
            //   scrollDirection: Axis.vertical,
            //   reverse: true,
            //   shrinkWrap: true,
            //   physics: BouncingScrollPhysics(),
            //   slivers: <Widget>[
            //     new SliverPadding(
            //         padding: EdgeInsets.all(10),
            //         sliver: new SliverList(
            //           delegate: new SliverChildListDelegate(
            //             <Widget>[
            //               Table(
            //                 border: TableBorder(
            //                   top: BorderSide(color: Colors.red),
            //                   left: BorderSide(color: Colors.red),
            //                   right: BorderSide(color: Colors.red),
            //                   bottom: BorderSide(color: Colors.red),
            //                   horizontalInside: BorderSide(color: Colors.red),
            //                   verticalInside: BorderSide(color: Colors.green),
            //                 ),
            //                 children: [
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("传感器",style:TextStyle(fontSize: 12),),),
            //                         TableCell(child: Text("最小报警",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: Text("正常最小",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: Text("正常最大",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: Text("最大报警 ",style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("空气温度：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("空气湿度：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("土壤温度：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("土壤湿度：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("CO2浓度：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("光照强度：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("大气压强：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("空气流速：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("风向：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("土壤EC：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("土壤PH：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("土壤氮含量：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("土壤磷含量：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("土壤钾含量：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("日照长度：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("辐照度：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                   TableRow(
            //                       children: [
            //                         TableCell(child: Text("电量：",style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                         TableCell(child: TextField(style: TextStyle(fontSize: 12),),),
            //                       ]
            //                   ),
            //                 ],
            //               ),
            //             ]
            //           ),
            //         ),
            //     )
            //   ],
            // ),
            //
            // )

          ],
        ),
      ),
    );
  }
}
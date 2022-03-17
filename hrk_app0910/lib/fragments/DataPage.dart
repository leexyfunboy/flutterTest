import 'package:flutter/material.dart';
import 'package:hrk_app0910/twoPages/ChartPage.dart';
import 'package:hrk_app0910/twoPages/TextPage.dart';
import 'package:hrk_app0910/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:hrk_app0910/tools/DartHttpUtil.dart';

class DataPage extends StatefulWidget{


  @override
  _DataPageState createState() => new _DataPageState();
}

class _DataPageState extends State<DataPage> with AutomaticKeepAliveClientMixin {

  var _dropValue = "1";
  final List<String> _tabValues = ["概览","图表"];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),

    );
  } // final List<String> _pageVIew = ["1","2"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              // width: 120,
              // height: 40,
              shadowColor: Colors.grey,
              margin: EdgeInsets.fromLTRB(10, 25, 10, 5),
              color: Colors.white70,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text("箱号："),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: DropdownButton(
                      value: _dropValue,
                      items: [
                        DropdownMenuItem(child: Text("1"),value: "1",),
                        DropdownMenuItem(child: Text("2"),value: "2",),
                        DropdownMenuItem(child: Text("3"),value: "3",),
                        DropdownMenuItem(child: Text("4"),value: "4",),
                        DropdownMenuItem(child: Text("5"),value: "5",),
                        DropdownMenuItem(child: Text("6"),value: "6",),
                        DropdownMenuItem(child: Text("7"),value: "7",),
                        DropdownMenuItem(child: Text("8"),value: "8",),
                        DropdownMenuItem(child: Text("9"),value: "9",),
                        DropdownMenuItem(child: Text("10"),value: "10",)
                      ],
                      onChanged: (value){
                        setState(() {
                          _dropValue = value.toString();
                          // print("下拉value::"+value.toString());
                          TextPage(target_box:_dropValue);
                          print("_dropValue::"+_dropValue);
                          ChartPage(_dropValue);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text("2021-11-04 15:00:00",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh_outlined),
                    iconSize: 30,
                    color: Colors.black,
                    onPressed: () {
                      // print("点击了refresh");
                      setState(() {
                        TextPage(target_box:_dropValue);
                        ChartPage(_dropValue);
                      });
                    },
                  )
                ],
              ),
            ),
            TabBar(
                tabs: _tabValues.map((f) {
                  return Text(f);
                }).toList(),
              controller: _controller,
              indicatorColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              indicatorWeight: 5.0,
              labelStyle: TextStyle(height: 2),
            ),
            Flexible(
              fit: FlexFit.tight,
              child:Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: 400,
                height: 600,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    TabBarView(
                      controller: _controller,
                      children: <Widget>[
                        TextPage(target_box:_dropValue),
                        ChartPage(_dropValue),
                      ],
                    ),
                  ],
                  onPageChanged: (int index){
                    setState(() {
                      // print("PaperView_index"+index.toString());
                    });
                  },
                ),
              ) ,
            ),
          ]
        ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
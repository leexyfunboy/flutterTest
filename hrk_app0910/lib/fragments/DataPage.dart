import 'package:flutter/material.dart';
import 'package:hrk_app0910/twoPages/ChartPage.dart';
import 'package:hrk_app0910/twoPages/TextPage.dart';

class DataPage extends StatefulWidget{


  @override
  _DataPageState createState() => new _DataPageState();
}

class _DataPageState extends State<DataPage>{

  var _dropValue = "1";
  final List<String> _tabValues = ["概览","图表"];
  // final List<String> _pageVIew = ["1","2"];





  @override
  void initState() {
    super.initState();


    // // _pageController = PageController();


  }

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
                      ],
                      onChanged: (value){
                        setState(() {
                          _dropValue = value.toString();
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
                    onPressed: () {},
                  )
                ],
              ),
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
                    TextPage(),
                    ChartPage()
                  ],
                  onPageChanged: (int index){
                    setState(() {
                      print("PaperView_index"+index.toString());
                    });
                  },
                ),
              ) ,
            ),
          ]
        ),
    );
  }
}
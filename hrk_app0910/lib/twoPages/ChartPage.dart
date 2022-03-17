import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:hrk_app0910/tools/DartHttpUtil.dart';
import 'dart:convert' as convert;


class ChartPage extends StatefulWidget{

  int _dropvalue = 0;
  ChartPage(_dropvalue);

  @override
  _DataPageState createState() => new _DataPageState(_dropvalue);
}

class _DataPageState extends State<ChartPage> with AutomaticKeepAliveClientMixin{


  // int box_select ;
  int boxid ;

  _DataPageState(this.boxid); //当前项目的固定箱的个数
  int boxCount = 10;
  //当前显示的box的编号

  //下拉时间选择框的选中值
  String _timelengthValue = "5";
  var sensorName = ["空气温度",
  "空气湿度",
  "土壤温度",
  "土壤湿度",
  "CO2浓度",
  "光照强度",
  "大气压强",
  "空气流速",
  "风向",
  "土壤EC",
  "土壤PH",
  "土壤氮含量",
  "土壤磷含量",
  "土壤钾含量",
  "日照时长",
  "辐照度",
  "电量"];
  var _radioGroupValue = "line";

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //点击上一个按钮时
  void _onClickPreviousButton(){
    if(boxid ==1){
      boxid = boxCount;
    }else{setState(() {
      boxid--;
    });

    }
  }

  //点击下一个按钮时
  void _onClickNextButton(){
    if(boxid ==boxCount){
      boxid = 1;
    }else{
      setState(() {
        boxid++;
      });
    }
  }

  /**
   * 获取该箱号单个传感器一段时间的数据
   */
  Future<List<List>> getdata_forEchart(String box,String daylength,String dbName) async{
    var sensors = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","dc"];
    List<List> res = [];
    DartHttpUtils dartHttpUtils = DartHttpUtils();
    for(var target_sensor in sensors){
      await dartHttpUtils.select_dataforechart(box, target_sensor, daylength, dbName).then((value) {
        res.add(convert.jsonDecode(value));
      });
    }

  return res;
  }

  List<String> getSingalSensorDataFromDataSet(List data,String sensorKind,String valueKind){
    List<String>  res = [];
    Map<String,dynamic> map = {"a":1,"b":2,"c":3,"d":4,"e":5,"f":6,"g":7,"h":8,"i":9,"j":10,"k":11,"l":12,"m":13,"n":14,"o":15,"p":16,"dc":17};
    int index = map[sensorKind]-1;
    if(valueKind=="time"){
      for(int i=0;i<data[index].length;i++){
        res.add(data[index][i]["time"].split(" ")[1].split(":")[0]);
      }
    }else if(valueKind=="value"){
      for(int i=0;i<data[index].length;i++){
        res.add(data[index][i]["a"]);
      }
    }

    // print(data[0][0]["time"]);
    return res;
  }


  Future<String> getData() async{
    return "helloworld";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(child:Text("上一个"),onPressed: (){
                _onClickPreviousButton();
              }),
              Text("时长"),
              DropdownButton(
                value: _timelengthValue,
                items: [
                  DropdownMenuItem(child: Text("5"),value: "5",),
                  DropdownMenuItem(child: Text("6"),value: "6",),
                  DropdownMenuItem(child: Text("12"),value: "12",),
                  DropdownMenuItem(child: Text("24"),value: "24",),
                ],
                onChanged: (value){
                  setState(() {
                    _timelengthValue = value.toString();
                  });
                  // print("_timelengthValue"+_timelengthValue);
                },
              ),
              RaisedButton(child:Text("下一个"),onPressed: (){
                _onClickNextButton();
              } ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: RadioListTile(
                  title: Text('折线图'),
                  value: 'line',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value.toString();
                    });
                  },
                ),
              ),
              Flexible(
                  child: RadioListTile(
                    title: Text('条形图'),
                    value: 'bar',
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value.toString();
                      });
                    },
                  )),
            ],
          ), FutureBuilder(
                  future: getdata_forEchart(boxid.toString(),  _timelengthValue, "testData"),
                  // future: getData(),
                  builder:(BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      if(snapshot.hasError){
                        return Text("数据获取失败！！");
                      }else{
                        List data = snapshot.data;
                        // List data_time = [];
                        // List data_sensor = [];
                        // for(int i=0;i<data.length;i++){
                        //   data_time.add(data[i]["time"].split(" ")[1].split(":")[0]);
                        //   data_sensor.add(data[i]["a"]);
                        // }

                        // print("cahrtpage:data.toString():::  "+data.toString());
                        // print("data_time.toString:::  "+data_time.toString());
                        // print("data_sensor.toString:::  "+data_sensor.toString());
                        // List<String> data_time = [];
                        // for(int i=0;i<data.length;i++){
                        //   data_time.add(data[i].values.single);
                        // }


                        return  Container(
                          child: ListView(
                            children:<Widget>[
                              //空气温度
                              Text(sensorName[0]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "a", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "a", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //空气湿度
                              Text(sensorName[1]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "b", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "b", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //土壤温度
                              Text(sensorName[2]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "c", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "c", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //土壤湿度
                              Text(sensorName[3]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "d", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "d", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //CO2浓度
                              Text(sensorName[4]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "e", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "e", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //光照强度
                              Text(sensorName[5]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "f", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "f", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //大气压强
                              Text(sensorName[6]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "g", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "g", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //空气流速
                              Text(sensorName[7]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "h", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "h", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //风向
                              Text(sensorName[8]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "i", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "i", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //土壤EC
                              Text(sensorName[9]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "j", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "j", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //土壤PH
                              Text(sensorName[10]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "k", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "k", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //土壤氮含量
                              Text(sensorName[11]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "l", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "l", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //土壤磷含量
                              Text(sensorName[12]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "m", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "m", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //土壤钾含量
                              Text(sensorName[13]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "n", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "n", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //日照时长
                              Text(sensorName[14]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "o", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "o", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //辐照度
                              Text(sensorName[15]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "p", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "p", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),
                              //电量
                              Text(sensorName[16]),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                  ),
                                ),
                                child: Echarts(
                                  option:
                                  '''
                            {
                              xAxis: {
                                type: 'category',
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "dc", "time"))}
                              },
                              yAxis: {
                                type: 'value'
                              },
                              series: [{
                                data: ${convert.jsonEncode(getSingalSensorDataFromDataSet(data, "dc", "value"))},
                                type: '${_radioGroupValue}'
                              }],
                            }
                            ''',
                                  extraScript:
                                  '''
                              chart.on('click', (params) => {
                              if(params.componentType === 'series') {
                              Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                              }));
                              }
                              });
                            ''',
                                  onMessage: (String message) {
                                    // Map<String, Object> messageAction = convert.jsonDecode(message);
                                    // print(messageAction);
                                    // if (messageAction['type'] == 'select') {
                                    //   final item = data_sensor[messageAction['payload']];
                                    //   _scaffoldKey.currentState!.showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(item['name'].toString() + ': ' + display(item['value'])),
                                    //       duration: Duration(seconds: 2),
                                    //     ));
                                    // }
                                  },
                                ),
                                width: 300,
                                height: 250,
                              ),

                            ],

                          ),
                          width:300,
                          height:550,
                        );

                      }
                    } else {
                      // 请求未结束，显示loading
                      return CircularProgressIndicator();
                    }
                  }
              ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
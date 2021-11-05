import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class Map extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Login Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  // @override
  // Widget build(BuildContext context) {
  //   return FlutterMap(
  //     // options: MapOptions(
  //     //   center: LatLng(51.5, -0.09),
  //     //   zoom: 13.0,
  //     // ),
  //     // layers: [
  //     //   TileLayerOptions(
  //     //     urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
  //     //     subdomains: ['a', 'b', 'c'],
  //     //     attributionBuilder: (_) {
  //     //       return Text("© OpenStreetMap contributors");
  //     //     },
  //     //   ),
  //     //   MarkerLayerOptions(
  //     //     markers: [
  //     //       Marker(
  //     //         width: 80.0,
  //     //         height: 80.0,
  //     //         point: LatLng(51.5, -0.09),
  //     //         builder: (ctx) =>
  //     //             Container(
  //     //               child: FlutterLogo(),
  //     //             ),
  //     //       ),
  //     //     ],
  //     //   ),
  //     // ],
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
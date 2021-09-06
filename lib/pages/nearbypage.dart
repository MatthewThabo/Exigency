import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlng/latlng.dart';


class NearByPage extends StatefulWidget with NavigationStates {
  @override
  _NearByPageState createState() => _NearByPageState();
}

class _NearByPageState extends State<NearByPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFd2e4fa),
        title: Text(""),
      ),
      body: new FlutterMap(options: new MapOptions(
          minZoom: 10.0), layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
        ]
    ),
    );
  }
  }


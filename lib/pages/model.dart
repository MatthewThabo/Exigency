import 'package:flutter/material.dart';

class ModelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
        appBar: AppBar(
        title: Text(''),
    ),
    body: Center(
    child: Text('Your request is successful'),
    ),
    ),
    );
  }
}



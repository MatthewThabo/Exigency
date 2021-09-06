import 'package:flutter/material.dart';
import 'package:flutter_app/pages/splash_screen.dart';
import 'package:flutter_app/sidebar/sidebar-layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white
      ),
      home: FutureBuilder(
        future: _fbApp,builder: (context, snapshot){
          if (snapshot.hasError){
              print('you have an error! ${snapshot.error.toString()}');
                return Text('something went wrong');} else if (snapshot.hasData){
                return SplashScreen();}
                else  {
                  return Center(child: CircularProgressIndicator(),);}})
                  // home: SideBarLayout(),
    );
  }
}

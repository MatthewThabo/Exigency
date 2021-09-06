import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/navigation_bloc/navigation_bloc.dart';


class EmergencyContactDetails extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                  Color(0xFFd2e4fa),
                  Color(0xFFf5f6f7),
                  Color(0xFFa7d1fa),
                  Color(0xFF8dc2f7),
                  ],
            ),
          ),
        ),
      ),
      // child: Text(
      //   "Emergency Contact Details",
      //   style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      // ),
    );
    // return new Scaffold(
    //   appBar: AppBar(
    //     title: Text("Nearby"),
    //   ),
    // );
  }
}
// body: SafeArea(
// top: false,
// bottom: false,
// child: Container(
// height: double.maxFinite,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// colors: <Color>[
// Color(0xFFd2e4fa),
// Color(0xFFf5f6f7),
// Color(0xFFa7d1fa),
// Color(0xFF8dc2f7),
// ],
// ),
// ),
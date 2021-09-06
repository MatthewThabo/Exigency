import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter_app/pages/nearbypage.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';

class HomePage extends StatefulWidget with NavigationStates {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final TextEditingController emailCtrlr = TextEditingController();
  final TextEditingController lacationCtrlr = TextEditingController();
  final TextEditingController firstNameCtrlr = TextEditingController();
  final TextEditingController lastNameCtrlr = TextEditingController();
  final TextEditingController phoneNumberCtrlr = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    lacationCtrlr.dispose();
  }

  void checkValue() {
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    _testRef.set("great thibos ${Random().nextInt(100)}");
    if (_formKey.currentState.validate()) {
      // print("Email Address: ${emailCtrlr.text}");
      print("Email Address: ${lacationCtrlr.text}");
      print("Email Address: ${firstNameCtrlr.text}");
      print("Email Address: ${lastNameCtrlr.text}");
      print("Email Address: ${phoneNumberCtrlr.text}");
      _formKey.currentState.save();
      Map <String,dynamic> data = {"Currentlocation": lacationCtrlr.text,"FirstName": firstNameCtrlr.text,"LastName": lastNameCtrlr.text,"Cellphone": phoneNumberCtrlr.text,"latitude": _position.latitude,"longitude": _position.longitude};
      FirebaseFirestore.instance.collection("test").add(data);
      Navigator.push(context,MaterialPageRoute(builder: (context)=> ModelPage()));
    }
  }

  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;

  @override
  void initState() {
    super.initState();
    // var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _streamSubscription =
        Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.high)
            .listen((Position position) {
          setState(() {
            print(position);
            _position = position;

            final coordinate = new Coordinates(
                position.latitude, position.longitude);
            convertCoordinatesToAddress(coordinate).then((value) =>
            _address = value);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        backgroundColor: Color(0xFFd2e4fa),
        title: new Text(
          "",
          style: TextStyle(
            fontFamily: "Merriweather-Black",
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
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
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.lightBlue,
                            width: 1.0,
                          ),
                          right: BorderSide(
                            color: Colors.lightBlue,
                            width: 1.0,
                          ),
                          left: BorderSide(
                            color: Colors.lightBlue,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.lightBlue,
                            width: 1.0,
                          ),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            50,
                          ),
                        ),
                      ),
                      child: Image.asset(
                        "images/logo.png", height: 72, width: 72,),
                      // Icon(
                      //   Icons.person,
                      //   size: 100.0,
                      //   color: Colors.grey.shade500,
                      // ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: lacationCtrlr,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.length < 3) {
                        print(value);
                        return "";
                      }
                    },
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      labelText: "${_address?.addressLine?? ''}",
                      helperText: "Your location",
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: firstNameCtrlr,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.length < 3) {
                        print(value);
                        return "Please write your first name more than 3 letters";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.contacts,
                        color: Colors.black,
                      ),
                      // labelText: "First Name",
                      helperText: "Your first name",
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: lastNameCtrlr,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.length < 3) {
                        print(value);
                        return "Please write last name more than 3 letters";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.contacts,
                        color: Colors.black,
                      ),
                      // labelText: "Last Name",
                      helperText: "Your Last Name",
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: phoneNumberCtrlr,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.length < 10) {
                        print(value);
                        return "Please write your phone number more than 3 letters";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      // prefixText: "+27",
                      prefixStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      // labelText: "Telephone Number",
                      helperText: "Your Cellphone number",
                    ),
                    maxLines: 1,
                  ),
                  RaisedButton(
                    onPressed: checkValue,
                    child: Text("Submit"),
                  ),
                  //const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispos(){
    super.dispose();
    _streamSubscription.cancel();
  }
  Future<Address> convertCoordinatesToAddress(Coordinates coordinate) async {
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinate);
    return addresses.first;
  }
//on Tuesday
// class checkString {
//
// }
}



// Position _position;
  // StreamSubscription<Position> _streamSubscription;
  // Address _address;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  //   _streamSubscription= Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.high).listen((Position position) {
  //
  //     setState(() {
  //       print(position);
  //       _position = position;
  //
  //       final coordinate = new Coordinates(position.latitude, position.longitude);
  //       convertCoordinatesToAddress(coordinate).then((value)=> _address=value);
  //     });
  //   });
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Icon(
  //             Icons.location_on,
  //             size: 46.0,
  //             color: Colors.blue,
  //           ),
  //           Text(
  //               "CURRENT LOCATION"
  //           ),
  //           Text("latitude:${_position?.latitude?? '-'}, longitude:${_position?.longitude?? '-'}"),
  //           Text("${_address?.addressLine?? '-'}"),
  //           RaisedButton.icon(
  //             onPressed: () {
  //               Navigator.push(context,
  //                 MaterialPageRoute(builder: (context)=> DetailsPage()),
  //               );
  //             },
  //             icon: Icon(
  //                 Icons.forward
  //             ),
  //             label: Text('Next'),
  //             color: Colors.lightBlue,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // @override
  // void dispose(){
  //   super.dispose();
  //   _streamSubscription.cancel();
  // }
  // Future<Address> convertCoordinatesToAddress(Coordinates coordinate) async {
  //   var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinate);
  //   return addresses.first;
  // }
  // // @override
  // // Widget build(BuildContext context) {
  // //   return Center(
  // //     child: RaisedButton.icon(
  // //       onPressed: () {
  // //         Navigator.push(context,
  // //         MaterialPageRoute(builder: (context)=> DetailsPage()),
  // //         );
  // //       },
  // //       icon: Icon(
  // //         Icons.add_location_alt
  // //       ),
  // //       label: Text('Request'),
  // //       color: Colors.lightBlue  ,
  // //       // Icons.airport_shuttle,
  // //       // color: Colors.lightBlue,
  // //       // size: 50.0,
  // //       // "HomePage",
  // //       // style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
  // //     ),
  // //   );
  // // }
// }
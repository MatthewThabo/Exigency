import 'package:bloc/bloc.dart';
import 'package:flutter_app/pages/aboutpage.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/pages/emergencytipspage.dart';
import 'package:flutter_app/pages/emergencycontactdetails.dart';
import 'package:flutter_app/pages/nearbypage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  EmergencyTipsPageClickedEvent,
  EmergencyContactDetailsClickedEvent,
  NearByPageClickedEvent,
  AboutPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.EmergencyTipsPageClickedEvent:
        yield EmergencyTipsPage();
        break;
      case NavigationEvents. EmergencyContactDetailsClickedEvent:
        yield EmergencyContactDetails();
        break;
      case NavigationEvents.NearByPageClickedEvent:
        yield NearByPage();
        break;
      case NavigationEvents.AboutPageClickedEvent:
        yield AboutPage();
        break;
    }
  }
}

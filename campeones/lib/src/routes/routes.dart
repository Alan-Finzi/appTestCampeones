import 'package:campeones/src/pages/home_page.dart';
import 'package:campeones/src/pages/start_page.dart';
import 'package:flutter/material.dart';
///////////////////////////////////////////////////////
//// DON'T DELETE AND ADIT COMMENTS OF THIS PAGE  /////
//// Enter the routes in their respective module  /////
///////////////////////////////////////////////////////
class ApplicationRoutes {
  static Map<String, WidgetBuilder> getApplicationRoutes(){
    return <String, WidgetBuilder> {
    //#home
      StartPage.routeName         : (BuildContext context) => StartPage(),
      HomePage.routeName         : (BuildContext context) => HomePage(),
    };
  }
}

//////////////////////////////////////
//////////////////////////////////////
///  MUST BE IMPLEMENT NEXT CLASS  ///
//////////////////////////////////////

class PaymunRoutes{
  static void campeonesNavigator({required BuildContext context, required String routeName}){
    Navigator.of(context).push(_createRoute(destinationPage: _navigationData[routeName]),);
  }

  static Route _createRoute({dynamic destinationPage}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) { return child;},
    );
  }

  static Map<String, dynamic> _navigationData = {
    //#home
    StartPage.routeName      : StartPage(),
    HomePage.routeName      : HomePage(),

  };
}

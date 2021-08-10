import 'package:campeones/src/pages/start_page.dart';
import 'package:campeones/src/providers/provider_bloc.dart';
import 'package:campeones/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {
  String _initialRoute = StartPage.routeName;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CampeonesApp(initialRoute: _initialRoute, key:  Key("AppKey"),));
}



class CampeonesApp extends StatelessWidget {
  final String initialRoute;
  CampeonesApp({required Key key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ));
    return  ProviderBloc(key: Key("providersKey"),
    child:  MaterialApp(
      title: 'Campeones',
      theme: _themeData(),
      initialRoute: initialRoute,
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      routes: ApplicationRoutes.getApplicationRoutes(),
    ),);
  }
  ThemeData _themeData() {
    return ThemeData(
        primaryColor: Colors.black,
        backgroundColor: Colors.amber,
        fontFamily: "Poppins"
    );
  }
}

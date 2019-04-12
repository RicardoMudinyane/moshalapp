import 'package:flutter/material.dart';
import 'package:moshal/home_dashboard.dart';
import 'package:moshal/LoginPage.dart';
import 'package:moshal/SignUp.dart';
import 'package:moshal/api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag :(context) => LoginPage(),
    Dashboard.tag :(context) => Dashboard(),
    SignUpPage.tag :(context) => SignUpPage(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moshal',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}

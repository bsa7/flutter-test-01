import 'package:flutter/material.dart';
import 'package:hw_4/src/views/landing_page.dart';

class AppView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Max Fitness',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white)
        ),
      ),
      home: LandingPage(),
    );
  }
}
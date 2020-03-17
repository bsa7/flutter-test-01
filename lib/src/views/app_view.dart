import 'package:flutter/material.dart';
import 'package:hw_4/src/models/user.dart';
import 'package:hw_4/src/services/auth.dart';
import 'package:hw_4/src/views/landing_page.dart';
import 'package:provider/provider.dart';

class AppView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      child: MaterialApp(
        title: 'APP Name',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white)
          ),
        ),
        home: LandingPage(),
      ),
      value: AuthService().currentUser,
    );
  }
}

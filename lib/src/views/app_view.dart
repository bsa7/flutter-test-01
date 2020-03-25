import 'package:flutter/material.dart';
import 'package:hw_4/src/constants/defaultTheme.dart';
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
        theme: themeData,
        darkTheme: darkThemeData,
        home: LandingPage(),
      ),
      value: AuthService().currentUser,
    );
  }
}

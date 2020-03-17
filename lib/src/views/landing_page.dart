import 'package:flutter/material.dart';
import 'package:hw_4/src/views/auth/auth_page.dart';
import 'package:hw_4/src/views/home/home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;
    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}

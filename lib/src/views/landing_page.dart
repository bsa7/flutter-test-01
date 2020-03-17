import 'package:flutter/material.dart';
import 'package:hw_4/src/models/user.dart';
// import 'package:hw_4/src/services/auth.dart';
import 'package:hw_4/src/views/auth/auth_page.dart';
import 'package:hw_4/src/views/home/home_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}

import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
import 'package:hw_4/src/views/shared/logo.dart';
import 'package:hw_4/src/views/auth/components/auth_form_navigation_bar.dart';
import 'components/auth_form.dart';


class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({ Key key }) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> with SingleTickerProviderStateMixin {

  var authController;

  @override
  Widget build(BuildContext context) {
    var themeBackgroundColor = Theme.of(context).primaryColor;
    authController ??= AuthController(setState: setState);

    return Scaffold(
      backgroundColor: themeBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            logo(),
            authForm(
              context: context,
              label: authController.showLogin ? 'LOGIN' : 'REGISTER',
              controller: authController,
            ),
            authFormNavigationBar(
              controller: authController,
              context: context,
            ),
          ],
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

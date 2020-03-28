import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
import 'package:hw_4/src/views/shared/logo.dart';
import 'package:hw_4/src/views/auth/components/auth_form_navigation_bar.dart';
import 'package:hw_4/src/views/auth/components/auth_providers_bar.dart';
import 'components/auth_form.dart';


class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({ Key key }) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    authController.setState = setState;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Logo(),
            AuthProvidersBar(),
            AuthForm(label: authController.showModeLabel),
            AuthFormNavigationBar(),
          ],
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

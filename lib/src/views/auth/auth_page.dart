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

class _AuthorizationPageState extends State<AuthorizationPage> with SingleTickerProviderStateMixin {

  var authController;

  @override
  Widget build(BuildContext context) {
    authController ??= AuthController();
    authController.setState ??= setState;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            logo(context: context),
            authProvidersBar(
              context: context,
              controller: authController,
            ),
            authForm(
              context: context,
              controller: authController,
              label: authController.showModeLabel,
            ),
            authFormNavigationBar(
              context: context,
              controller: authController,
            ),
          ],
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
import 'package:hw_4/src/constants/auth.dart';

class AuthFormNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();

    return Column(
      children: <Widget>[
        Padding(
          child: GestureDetector(
            child: Text(
              authController.showMode == ShowMode.login ? 'Not registered yet? Register!' : 'Already registered? Login!',
              style: TextStyle(fontSize: 20),
            ),
            onTap: authController.showMode == ShowMode.login ? authController.showRegisterForm : authController.showLoginForm,
          ),
          padding: EdgeInsets.all(10),
        ),
        if (authController.showMode != ShowMode.forgottenPassword) Padding(
          child: GestureDetector(
            child: Text(
              'Forgotten password?',
              style: TextStyle(fontSize: 20),
            ),
            onTap: authController.showForgottenPasswordForm,
          ),
          padding: EdgeInsets.all(10),
        ),
      ],
    );
  }
}

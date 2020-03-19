import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
import 'package:hw_4/src/constants/auth.dart';

Widget authFormNavigationBar({ AuthController controller, BuildContext context }) {
  return Column(
    children: <Widget>[
      Padding(
        child: GestureDetector(
          child: Text(
            controller.showMode == ShowMode.registration ? 'Not registered yet? Register!' : 'Already registered? Login!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onTap: () {
            controller.showMode == ShowMode.login ? controller.showRegisterForm() : controller.showLoginForm();
          },
        ),
        padding: EdgeInsets.all(10),
      ),
      if (controller.showMode != ShowMode.forgottenPassword) Padding(
        child: GestureDetector(
          child: Text(
            'Forgotten password?',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onTap: controller.showForgottePasswordForm,
        ),
        padding: EdgeInsets.all(10),
      ),
    ],
  );
}

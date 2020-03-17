import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';

Widget authFormNavigationBar({ AuthController controller, BuildContext context }) {
  return Padding(
    child: GestureDetector(
      child: Text(
        controller.showLogin ? 'Not registered yet? Register!' : 'Already registered? Login!',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onTap: () {
        controller.showLogin ? controller.showRegisterForm() : controller.showLoginForm();
      },
    ),
    padding: EdgeInsets.all(10),
  );
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
import 'package:hw_4/src/views/shared/button.dart';
import 'package:hw_4/src/views/shared/input.dart';
import 'package:hw_4/src/constants/auth.dart';

class AuthForm extends StatelessWidget {
  final String label;
  AuthForm({ this.label });

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);
    final AuthController authController = AuthController();

    if (authController.validationErrorsPresent) Fluttertoast.showToast(
      msg: authController.validationErrorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 3,
      backgroundColor: Colors.red,
      textColor: currentTheme.primaryColor,
      fontSize: 16.0,
    );

    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Padding(
                child: Text('Or sign with email and password'),
                padding: EdgeInsets.all(10),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: input(
              context: context,
              controller: authController.emailController,
              hint: 'EMAIL',
              icon: Icon(Icons.email),
              obscure: false,
            ),
          ),
          AnimatedContainer(
            child: ClipRect(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: input(
                  context: context,
                  controller: authController.passwordController,
                  hint: 'PASSWORD',
                  icon: Icon(Icons.lock),
                  obscure: true,
                  onChanged: authController.onEditPassword,
                ),
              ),
            ),
            curve: Curves.easeInCubic,
            duration: Duration(milliseconds: 300),
            height: authController.showMode != ShowMode.forgottenPassword ? 70 : 0,
          ),
          AnimatedContainer(
            child: ClipRect(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: input(
                  context: context,
                  controller: authController.passwordConfirmationController,
                  hint: 'CONFIRM PASSWORD',
                  icon: Icon(authController.passwordConfirmed ? Icons.check : Icons.lock_open),
                  obscure: true,
                  onChanged: authController.onEditPassword,
                ),
              ),
            ),
            curve: Curves.easeInCubic,
            duration: Duration(milliseconds: 300),
            height: authController.showMode == ShowMode.registration ? 70 : 0,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              child: button(
                actionInProgress: authController.authInProgress,
                context: context,
                onPressed: authController.authAction,
                text: label,
              ),
              height: 50,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

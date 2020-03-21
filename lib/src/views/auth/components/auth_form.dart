import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
import 'package:hw_4/src/views/shared/button.dart';
import 'package:hw_4/src/views/shared/input.dart';
import 'package:hw_4/src/constants/auth.dart';

Widget authForm({ BuildContext context, String label, AuthController controller}) {
  if (controller.validationErrorsPresent) Fluttertoast.showToast(
    msg: controller.validationErrorMessage,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 3,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );

  return Container(
    child: Column(
      children: <Widget>[
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Padding(
              child: Text('Or sign with email and password', style: TextStyle(color: Colors.white)),
              padding: EdgeInsets.all(10),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20, top: 10),
          child: input(
            controller: controller.emailController,
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
                controller: controller.passwordController,
                hint: 'PASSWORD',
                icon: Icon(Icons.lock),
                obscure: true,
                onChanged: controller.onEditPassword,
              ),
            ),
          ),
          curve: Curves.easeInCubic,
          duration: Duration(milliseconds: 300),
          height: controller.showMode != ShowMode.forgottenPassword ? 80 : 0,
        ),
        AnimatedContainer(
          child: ClipRect(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: input(
                controller: controller.passwordConfirmationController,
                hint: 'CONFIRM PASSWORD',
                icon: Icon(controller.passwordConfirmed ? Icons.check : Icons.lock_open),
                obscure: true,
                onChanged: controller.onEditPassword,
              ),
            ),
          ),
          curve: Curves.easeInCubic,
          duration: Duration(milliseconds: 300),
          height: controller.showMode == ShowMode.registration ? 80 : 0,
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            child: button(
              actionInProgress: controller.authInProgress,
              context: context,
              onPressed: controller.authAction,
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

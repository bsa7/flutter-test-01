import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
import 'package:hw_4/src/assets/fonts/custom_icons.dart';

class AuthProvidersBar extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final AuthController authController = AuthController();

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              child: Text('Sign with'),
              padding: EdgeInsets.all(10),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Row(
          children: <Widget>[
            Padding(
              child: Container(
                child: MaterialButton(
                  onPressed: authController.signInWithGoogle,
                  color: Colors.blue,
                  child: Icon(
                    CustomIcons.google_1,
                    size: 24,
                  ),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
            Padding(
              child: Container(
                child: MaterialButton(
                  onPressed: authController.signInWithFacebook,
                  color: Color(0xff2851a3),
                  child: Icon(
                    CustomIcons.facebook,
                    size: 24,
                  ),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(),
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}

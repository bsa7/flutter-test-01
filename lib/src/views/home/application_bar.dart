import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';

class ApplicationBar extends StatelessWidget with PreferredSizeWidget {
  final AuthController authController;
  ApplicationBar({ this.authController });

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);

    return AppBar(
      actions: <Widget>[
        Padding(
          child: GestureDetector(
            child: Icon(Icons.exit_to_app),
            onTap: authController.logoutUser,
          ),
          padding: EdgeInsets.all(10),
        ),
      ],
      backgroundColor: currentTheme.backgroundColor,
      leading: GestureDetector(
        child: Icon(Icons.menu),
        onTap: Scaffold.of(context).openDrawer,
      ),
      title: Text('APPBar name'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

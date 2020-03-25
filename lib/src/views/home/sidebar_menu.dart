import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
import 'package:hw_4/src/models/user.dart';
import 'package:hw_4/src/views/shared/user_cached_avatar.dart';
import 'package:provider/provider.dart';

class SidebarMenu extends StatelessWidget {
  final AuthController authController;
  SidebarMenu({ this.authController });

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user.displayName),
            accountEmail: Text(user.email),
            arrowColor: Colors.white,
            currentAccountPicture: ClipOval(
              child: Container(
                child: UserCachedAvatar(user: user),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: authController.logoutUser,
          ),
        ],
      ),
    );
  }
}


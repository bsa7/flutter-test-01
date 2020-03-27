import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/home/home_controller.dart';
import 'package:hw_4/src/models/user.dart';
import 'package:hw_4/src/services/auth.dart';
import 'package:hw_4/src/views/shared/user_cached_avatar.dart';
import 'package:provider/provider.dart';

class SidebarMenu extends StatelessWidget {
  SidebarMenu();

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final HomeController homeController = HomeController();
    final Brightness platformBrightness = WidgetsBinding.instance.window.platformBrightness;
    final ThemeMode currentThemeMode = homeController.themeMode != null
      ? homeController.themeMode
      : platformBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user.displayName ?? ''),
            accountEmail: Text(user.email ?? ''),
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
          if (currentThemeMode == ThemeMode.dark) ListTile(
            leading: Icon(Icons.brightness_high),
            title: Text('Set light theme'),
            onTap: homeController.setLightTheme,
          ),
          if (currentThemeMode == ThemeMode.light) ListTile(
            leading: Icon(Icons.brightness_3),
            title: Text('Set dark theme'),
            onTap: homeController.setDarkTheme,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: AuthService().logout,
          ),
        ],
      ),
    );
  }
}

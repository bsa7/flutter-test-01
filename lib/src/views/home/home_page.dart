import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
import 'package:hw_4/src/controllers/home/home_controller.dart';
import 'package:hw_4/src/views/home/sidebar_menu.dart';
import 'package:hw_4/src/views/workout/workout_list.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  var authController;
  var homeController;

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    authController ??= AuthController(setState: setState);
    homeController ??= HomeController(setState: setState);

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
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
              onTap: homeController.openMenu,
            ),
            title: Text('APPBar name'),
          ),
          body: WorkoutList(),
        ),
        // sidebarMenu(context: context),
        AnimatedPositioned(
          bottom: 0,
          child: sidebarMenu(context: context, homeController: homeController),
          curve: Curves.easeInCubic,
          duration: Duration(milliseconds: 300),
          left: homeController.sidebarMenuOpened ? 0 : -screenWidth,
          right: homeController.sidebarMenuOpened ? 0 : screenWidth,
          top: 0,
        ),
      ],
    );
  }
}
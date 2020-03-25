import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/auth/auth_controller.dart';
// import 'package:hw_4/src/controllers/home/home_controller.dart';
import 'package:hw_4/src/views/home/application_bar.dart';
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
    authController ??= AuthController(setState: setState);

    return Scaffold(
      appBar: ApplicationBar(authController: authController),
      body: WorkoutList(),
      drawer: SidebarMenu(),
    );
  }
}


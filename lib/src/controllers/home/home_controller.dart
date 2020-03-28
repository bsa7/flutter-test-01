import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/application_controller.dart';

class HomeController extends ApplicationController {
  ThemeMode themeMode;

  static final HomeController _homeController = HomeController._internal();

  factory HomeController() {
    return _homeController;
  }

  HomeController._internal();

  void setDarkTheme() {
    setState(() {
      this.themeMode = ThemeMode.dark;
    });
  }

  void setLightTheme() {
    setState(() {
      this.themeMode = ThemeMode.light;
    });
  }
}

import 'package:flutter/material.dart';
typedef void StatefullDataUpdater();
typedef void StateUpdater(StatefullDataUpdater callback);

class HomeController {
  ThemeMode themeMode;
  StateUpdater setState;

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

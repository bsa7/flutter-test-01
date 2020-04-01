import 'package:flutter/material.dart';
import 'package:hw_4/src/constants/defaultTheme.dart';
import 'package:hw_4/src/constants/routes.dart';
import 'package:hw_4/src/controllers/home/home_controller.dart';
import 'package:hw_4/src/services/auth.dart';
import 'package:provider/provider.dart';

class AppView extends StatefulWidget {

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {

  void onPlatformBrightnessChanged(VoidCallback callback) {
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = callback;
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    homeController.setState ??= setState;

    onPlatformBrightnessChanged(() {
      final Brightness currentPlatformBrightness = WidgetsBinding.instance.window.platformBrightness;
      setState(() {
        homeController.themeMode = currentPlatformBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
      });
    });

    print('#32, routes: $routes');

    return StreamProvider(
      child: MaterialApp(
        darkTheme: darkThemeData,
        initialRoute: '/',
        routes: routes,
        title: 'APP Name',
        theme: lightThemeData,
        themeMode: homeController.themeMode,
      ),
      create: (_) => AuthService().currentUser,
    );
  }
}

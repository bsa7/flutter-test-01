import 'package:hw_4/src/controllers/application_controller.dart';

class HomeController extends ApplicationController {
  bool sidebarMenuOpened;
  static final HomeController _homeController = HomeController._internal();

  factory HomeController({ StateUpdater setState }) {
    _homeController.sidebarMenuOpened = false;
    _homeController.setState = setState;

    return _homeController;
  }

  HomeController._internal();

  void openMenu() {
    setState(() {
      sidebarMenuOpened = true;
    });
  }

  void closeMenu() {
    setState(() {
      sidebarMenuOpened = false;
    });
  }
}

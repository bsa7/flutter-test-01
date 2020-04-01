import 'package:flutter/material.dart';
import 'package:hw_4/src/models/user.dart';
import 'package:hw_4/src/views/auth/auth_page.dart';
import 'package:hw_4/src/views/home/application_bar.dart';
import 'package:hw_4/src/views/home/sidebar_menu.dart';
import 'package:hw_4/src/views/workout/workout_list.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;
    print('#16 isLoggedIn: $isLoggedIn');
    if (isLoggedIn) {
      return Scaffold(
        appBar: ApplicationBar(),
        body: WorkoutList(),
        drawer: SidebarMenu(),
      );
    }
    return AuthorizationPage();
  }
}

import 'package:flutter/material.dart';
import 'package:hw_4/src/services/auth.dart';
import 'package:hw_4/src/views/workout/workout_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key key }) : super(key: key);

  logoutUser() {
    AuthService().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              label: SizedBox.shrink(),
              onPressed: logoutUser,
            )
          ],
          leading: Icon(Icons.fitness_center),
          title: Text('BSAFit'),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: WorkoutList(),
      ),
    );
  }
}
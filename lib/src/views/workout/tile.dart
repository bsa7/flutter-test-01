import 'package:flutter/material.dart';
import 'package:hw_4/src/models/workout.dart';

Widget tile({ BuildContext context, Workout workout }) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch(workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }
  final ThemeData currentTheme = Theme.of(context);

  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    leading: Container(
      child: Icon(Icons.fitness_center),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: currentTheme.primaryColor, width: 1)
        )
      ),
      padding: EdgeInsets.only(right: 12),
    ),
    subtitle: Row(
      children: <Widget>[
        Expanded(
          child: LinearProgressIndicator(
            backgroundColor: currentTheme.textTheme.headline1.color,
            value: indicatorLevel,
            valueColor: AlwaysStoppedAnimation(color),
          ),
          flex: 1,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            workout.level,
            style: currentTheme.textTheme.subtitle1,
          ),
          flex: 3,
        )
      ]
    ),
    title: Text(
      workout.title,
      style: currentTheme.textTheme.headline6,
    ),
    trailing: Icon(Icons.keyboard_arrow_right),
  );
}

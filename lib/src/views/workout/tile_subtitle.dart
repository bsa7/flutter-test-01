import 'package:flutter/material.dart';
import 'package:hw_4/src/models/workout.dart';

Widget tileSubtitle(BuildContext context, Workout workout) {
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
  final themePrimaryColor = Theme.of(context).textTheme.headline1.color;

  return Row(
    children: <Widget>[
      Expanded(
        child: LinearProgressIndicator(
          backgroundColor: themePrimaryColor,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
        flex: 1,
      ),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          workout.level,
          style: TextStyle(
            color: themePrimaryColor,
          ),
        ),
        flex: 3,
      )
    ]
  );
}

import 'package:flutter/material.dart';
import 'package:hw_4/src/models/workout.dart';
import 'tile.dart';

class WorkoutList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(author: 'Max1', description: 'Test workout1', level: 'Beginner', title: 'Test1'),
    Workout(author: 'Max2', description: 'Test workout2', level: 'Intermediate', title: 'Test2'),
    Workout(author: 'Max3', description: 'Test workout3', level: 'Advanced', title: 'Test3'),
    Workout(author: 'Max4', description: 'Test workout4', level: 'Beginner', title: 'Test4'),
    Workout(author: 'Max5', description: 'Test workout5', level: 'Intermediate', title: 'Test5'),
    Workout(author: 'Max11', description: 'Test workout11', level: 'Beginner', title: 'Test1'),
    Workout(author: 'Max12', description: 'Test workout12', level: 'Intermediate', title: 'Test2'),
    Workout(author: 'Max13', description: 'Test workout13', level: 'Advanced', title: 'Test3'),
    Workout(author: 'Max14', description: 'Test workout14', level: 'Beginner', title: 'Test4'),
    Workout(author: 'Max15', description: 'Test workout15', level: 'Intermediate', title: 'Test5'),
    Workout(author: 'Max1', description: 'Test workout1', level: 'Advanced', title: 'Test1'),
    Workout(author: 'Max2', description: 'Test workout2', level: 'Beginner', title: 'Test2'),
    Workout(author: 'Max3', description: 'Test workout3', level: 'Intermediate', title: 'Test3'),
    Workout(author: 'Max4', description: 'Test workout4', level: 'Beginner', title: 'Test4'),
    Workout(author: 'Max5', description: 'Test workout5', level: 'Intermediate', title: 'Test5'),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);

    return Container(
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Container(
              child: Tile(workout: workouts[i])
            ),
          );
        }
      ),
      color: currentTheme.backgroundColor,
    );
  }
}

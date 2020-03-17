import 'package:flutter/material.dart';
import 'package:hw_4/src/models/workout.dart';
import 'tile_subtitle.dart';


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
    final primaryColor = Theme.of(context).textTheme.title.color;

    return Container(
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                leading: Container(
                  child: Icon(Icons.fitness_center, color: primaryColor),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.white24, width: 1)
                    )
                  ),
                  padding: EdgeInsets.only(right: 12),
                ),
                subtitle: tileSubtitle(context, workouts[i]),
                title: Text(
                  workouts[i].title,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.keyboard_arrow_right, color: primaryColor),
              ),
            ),
          );
        }
      ),
    );
  }
}

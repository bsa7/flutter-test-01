import 'package:flutter/material.dart';
import 'package:hw_4/src/views/workout/workout_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MaxFit'),
          leading: Icon(Icons.fitness_center)
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: WorkoutList(),
      ),
    );
  }
}
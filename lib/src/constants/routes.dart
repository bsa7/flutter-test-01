import 'package:flutter/material.dart';
import 'package:hw_4/src/views/workout/workout_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => WorkoutPage(),
};

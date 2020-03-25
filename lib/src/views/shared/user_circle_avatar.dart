import 'package:flutter/material.dart';
import 'package:hw_4/src/models/user.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    List<String> variants = [user.displayName, user.email];
    variants.removeWhere((element) => element == null || element.isEmpty);

    return CircleAvatar(
      child: Text(
        variants[0].substring(0, 1).toUpperCase(),
        style: TextStyle(fontSize: 40.0),
      ),
    );
  }
}

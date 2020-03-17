import 'package:flutter/material.dart';

Widget button({ bool actionInProgress, BuildContext context, String text, void onPressed() }) {
  return RaisedButton(
    color: Colors.white,
    child: Text(
      actionInProgress ? 'WAIT PLEASE...' : text,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    highlightColor: Theme.of(context).primaryColor,
    onPressed: actionInProgress ? null : onPressed,
    splashColor: Theme.of(context).primaryColor,
  );
}

import 'package:flutter/material.dart';

Widget button({ bool actionInProgress, BuildContext context, String text, void onPressed() }) {
  final ThemeData currentTheme = Theme.of(context);

  return RaisedButton(
    child: Text(
      actionInProgress ? 'WAIT PLEASE...' : text,
    ),
    onPressed: actionInProgress ? null : onPressed,
    splashColor: currentTheme.backgroundColor,
  );
}

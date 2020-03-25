import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Padding(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  child: Text('App Config'),
                  padding: EdgeInsets.all(10),
                ),
                Padding(
                  child: GestureDetector(
                    child: Icon(Icons.close),
                    onTap: Navigator.of(context).pop,
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Row(
              children: <Widget>[
                Center(
                  child: Text('My Account'),
                ),
              ],
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
      decoration: BoxDecoration(
        color: currentTheme.accentColor,
        shape: BoxShape.rectangle,
      ),
      height: screenHeight,
      width: screenWidth,
    );
  }
}

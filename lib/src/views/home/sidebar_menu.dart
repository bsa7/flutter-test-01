import 'package:flutter/material.dart';
import 'package:hw_4/src/controllers/home/home_controller.dart';

Widget sidebarMenu({ BuildContext context, HomeController homeController }) {
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
                  onTap: homeController.closeMenu,
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

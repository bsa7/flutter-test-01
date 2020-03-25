import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget input({ BuildContext context, TextEditingController controller, Icon icon, String hint, bool obscure, Function onChanged }) {
  final ThemeData currentTheme = Theme.of(context);
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: currentTheme.primaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: currentTheme.primaryColor, width: 3),
        ),
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: currentTheme.hintColor),
        hintText: hint,
        prefixIcon: Padding(
          child: IconTheme(
            child: icon,
            data: currentTheme.iconTheme,
          ),
          padding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
      obscureText: obscure,
      onChanged: onChanged,
      // style: TextStyle(
      //   color: currentTheme.primaryColor,
      //   fontSize: 20,
      // ),
    ),
  );
}
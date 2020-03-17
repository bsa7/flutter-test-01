import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget input({ TextEditingController controller, Icon icon, String hint, bool obscure, Function onChanged }) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
        hintText: hint,
        prefixIcon: Padding(
          child: IconTheme(
            child: icon,
            data: IconThemeData(color: Colors.white),
          ),
          padding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
      obscureText: obscure,
      onChanged: onChanged,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}
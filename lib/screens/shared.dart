import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
//    hintText: 'Email',
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black26, width: 0.5)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 3.0)
  ),
);
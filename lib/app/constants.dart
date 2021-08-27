import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black54,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black54,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  errorStyle: TextStyle(
    color: Color(0xFFae0000),
    fontWeight: FontWeight.bold,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    borderSide: BorderSide(
      color: Color(0xFFae0000),
    ),
  ),
);

const kTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

const kTextStyle1 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

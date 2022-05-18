import 'package:flutter/material.dart';

const style = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const primaryColor = Color(0xff47E690);
const boldTextColor = Color(0xff052715);

Future<void> push(BuildContext context, Widget child) =>
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => child,
    ));
Future<void> pushReplacement(BuildContext context, Widget child) =>
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => child,
    ));
Future<void> pushAndRemoveUntil(BuildContext context, Widget child) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => child), (c) => false);

import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/screen/chat_screen.dart';
import 'package:flutter_custom_keyboard/screen/send_fund_screen.dart';
import 'package:flutter_custom_keyboard/screen/user_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const UserDashboard(),
    );
  }
}

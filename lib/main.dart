import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/screen/fund_transfer/transaction_pin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const TransactionPinScreen(),
    );
  }
}

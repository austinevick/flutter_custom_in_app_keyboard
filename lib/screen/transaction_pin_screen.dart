import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/widget/otp_keyboard_screen.dart';

class TransactionPinScreen extends StatelessWidget {
  const TransactionPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: OTPKeyboardScreen(
                onPressed: () {},
                buttonText: 'Confirm Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

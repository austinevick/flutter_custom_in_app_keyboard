import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';
import 'package:flutter_custom_keyboard/widget/custom_button.dart';
import 'package:flutter_custom_keyboard/widget/keypad_button.dart';

import 'custom_otp_textfield.dart';

class OTPKeyboardScreen extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  const OTPKeyboardScreen({Key? key, this.onPressed, this.buttonText})
      : super(key: key);

  @override
  State<OTPKeyboardScreen> createState() => _OTPKeyboardScreenState();
}

class _OTPKeyboardScreenState extends State<OTPKeyboardScreen> {
  String field1 = '';
  String field2 = '';
  String field3 = '';
  String field4 = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomOTPTextField(field1),
            CustomOTPTextField(field2),
            CustomOTPTextField(field3),
            CustomOTPTextField(field4),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            buildNumberButton('1'),
            buildNumberButton('2'),
            buildNumberButton('3')
          ],
        ),
        Row(
          children: [
            buildNumberButton('4'),
            buildNumberButton('5'),
            buildNumberButton('6')
          ],
        ),
        Row(
          children: [
            buildNumberButton('7'),
            buildNumberButton('8'),
            buildNumberButton('9')
          ],
        ),
        Row(
          children: [
            buildBiometricButton(),
            buildNumberButton('0'),
            buildClearButton()
          ],
        ),
        const SizedBox(height: 50),
        Center(
          child: CustomButton(
            onPressed: widget.onPressed,
            text: widget.buttonText,
          ),
        )
      ],
    );
  }

  void resetFieldOnExit() => setState(() {
        field1 = '';
        field2 = '';
        field3 = '';
        field4 = '';
      });

  Widget buildNumberButton(String text) => KeypadButton(
        onPressed: () => setState(() {
          if (field1.isEmpty) {
            field1 = text;
          } else if (field2.isEmpty) {
            field2 = text;
          } else if (field3.isEmpty) {
            field3 = text;
          } else if (field4.isEmpty) {
            field4 = text;
          }
        }),
        child: Text(text,
            style: style.copyWith(color: Colors.white, fontSize: 28)),
      );

  Widget buildClearButton() => KeypadButton(
        onPressed: () => setState(
          () {
            if (field4.isNotEmpty) {
              field4 = '';
            } else if (field3.isNotEmpty) {
              field3 = '';
            } else if (field2.isNotEmpty) {
              field2 = '';
            } else if (field1.isNotEmpty) {
              field1 = '';
            }
          },
        ),
        child: const Icon(Icons.backspace_outlined),
      );

  Widget buildBiometricButton() => KeypadButton(
        onPressed: () {},
        child: const Icon(Icons.fingerprint),
      );
}

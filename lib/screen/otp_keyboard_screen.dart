import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';
import 'package:flutter_custom_keyboard/widget/custom_button.dart';

class OTPKeyboardScreen extends StatefulWidget {
  const OTPKeyboardScreen({Key? key}) : super(key: key);

  @override
  State<OTPKeyboardScreen> createState() => _OTPKeyboardScreenState();
}

class _OTPKeyboardScreenState extends State<OTPKeyboardScreen> {
  String field1 = '';
  String field2 = '';
  String field3 = '';
  String field4 = '';

  Widget buildOTPTextField(String val) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
              alignment: Alignment.center,
              height: 85,
              width: 85,
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: val.isEmpty ? Colors.grey : Colors.red,
              ),
              child: Text(
                val,
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Please enter your 4 digit pin',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 25),
          Row(
            children: [
              buildOTPTextField(field1),
              buildOTPTextField(field2),
              buildOTPTextField(field3),
              buildOTPTextField(field4),
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
          )
        ],
      )),
    );
  }

  Widget buildNumberButton(String text) => CustomButton(
        onPressed: () {
          setState(() {
            if (field1.isEmpty) {
              field1 = text;
            } else if (field2.isEmpty) {
              field2 = text;
            } else if (field3.isEmpty) {
              field3 = text;
            } else if (field4.isEmpty) {
              field4 = text;
            }
          });
          final value = field1 + field2 + field3 + field4;
          if (value.length == 4) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('your pin is confirm $value')));
          }
        },
        child: Text(text, style: style),
      );

  Widget buildClearButton() => CustomButton(
      onPressed: () {
        setState(
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
        );
      },
      child: const Icon(Icons.backspace));

  Widget buildBiometricButton() => CustomButton(
        onPressed: () {},
        child: const Icon(Icons.fingerprint),
      );
}

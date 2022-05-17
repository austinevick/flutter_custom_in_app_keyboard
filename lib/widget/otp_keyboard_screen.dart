import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';
import 'package:flutter_custom_keyboard/widget/custom_button.dart';

import 'custom_otp_textfield.dart';

class OTPKeyboardScreen extends StatefulWidget {
  final String? headingText;
  final String? subText;
  final VoidCallback? onPressed;
  final String? buttonText;
  const OTPKeyboardScreen(
      {Key? key,
      this.headingText = '',
      this.subText = '',
      this.onPressed,
      this.buttonText})
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
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                widget.headingText!,
                style: style.copyWith(color: boldTextColor),
              ),
              Text(widget.subText!),
              const SizedBox(height: 50),
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
              const Spacer(),
              Center(
                child: CustomButton(
                  onPressed: widget.onPressed,
                  // () {
                  //   final pin = field1 + field2 + field3 + field4;
                  //   if (pin.length == 4) {
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //         content: SizedBox(
                  //             height: 60,
                  //             child: Text(
                  //               'your pin is confirm $pin',
                  //               style: style,
                  //             ))));
                  //   }
                  // },
                  text: widget.buttonText,
                ),
              )
            ],
          )),
    );
  }

  void resetFieldOnExit() => setState(() {
        field1 = '';
        field2 = '';
        field3 = '';
        field4 = '';
      });

  Widget buildNumberButton(String text) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
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
              icon: Text(
                text,
                style: style.copyWith(fontSize: 28),
              )),
        ),
      );

  Widget buildClearButton() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
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
              icon: const Icon(
                Icons.backspace_outlined,
                size: 30,
                color: Colors.black,
              )),
        ),
      );

  Widget buildBiometricButton() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.fingerprint,
                size: 30,
                color: Colors.black,
              )),
        ),
      );
}

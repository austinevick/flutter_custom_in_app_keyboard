import 'package:flutter/material.dart';

import '../constant.dart';

class CustomOTPTextField extends StatelessWidget {
  final String value;
  const CustomOTPTextField(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
          height: 60,
          width: 60,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 650),
          decoration: BoxDecoration(
            border: Border.all(
                color: value.isNotEmpty ? Colors.transparent : primaryColor,
                width: 2),
            borderRadius: BorderRadius.circular(50),
            color: value.isEmpty ? Colors.white : const Color(0xfff3fdf8),
          ),
          child: Text(
            value.isNotEmpty ? '\u{002A}' : value,
            style: style.copyWith(fontSize: 30),
          )),
    );
  }
}

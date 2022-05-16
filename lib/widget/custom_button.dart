import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final Color? textColor;

  final BorderSide? borderSide;
  const CustomButton(
      {Key? key,
      required this.onPressed,
      this.textColor,
      this.text,
      this.color,
      this.child,
      this.width,
      this.height,
      this.borderSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        height: height ?? 60,
        width: width ?? 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color ?? primaryColor,
        ),
        duration: const Duration(milliseconds: 500),
        child: MaterialButton(
          onPressed: onPressed,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: borderSide ?? BorderSide.none),
          child: child ??
              Text(text!,
                  style: style.copyWith(color: textColor ?? Colors.white)),
        ),
      ),
    );
  }
}

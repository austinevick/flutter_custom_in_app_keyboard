import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  const KeypadButton({Key? key, this.onPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: IconButton(
          onPressed: onPressed,
          icon: child!,
        ),
      ),
    );
  }
}

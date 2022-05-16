import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  const KeypadButton({Key? key, this.onPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundColor: Colors.black, radius: 35, child: child),
        ),
      ),
    );
  }
}

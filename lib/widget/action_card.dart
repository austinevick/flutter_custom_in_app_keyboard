import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';

class ActionCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  const ActionCard({Key? key, this.title, this.subtitle, this.onTap, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(3),
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
              topRight: Radius.circular(16)),
          borderSide: BorderSide(color: primaryColor, width: 1.8)),
      child: MaterialButton(
        height: 140,
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(children: [
            Icon(
              icon,
              size: 28,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: style.copyWith(fontSize: 14.6),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle!,
                    style: style.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.keyboard_arrow_right)
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextStyle? textStyle;
  final int maxLines;
  final TextAlign? textAlign;
  final bool? autoFocus;
  final int? maxLength;
  final bool? filled;

  final Widget? suffixIcon;
  final bool? hasBorderside;

  final bool? readOnly;
  final InputBorder? focusedBorder;
  final InputBorder? enableBorder;
  final String? initialValue;

  const CustomTextfield({
    Key? key,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
    this.autoFocus = false,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.words,
    this.onChanged,
    this.maxLines = 1,
    this.filled,
    this.hasBorderside = true,
    this.fillColor,
    this.maxLength,
    this.textStyle,
    this.textAlign,
    this.suffixIcon,
    this.readOnly = false,
    this.initialValue,
    this.onTap,
    this.prefixIcon,
    this.focusedBorder = InputBorder.none,
    this.enableBorder = InputBorder.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      initialValue: initialValue,
      textAlign: textAlign ?? TextAlign.start,
      onChanged: onChanged,
      autofocus: autoFocus!,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      readOnly: readOnly!,
      controller: controller,
      cursorWidth: 1.0,
      maxLines: maxLines,
      obscureText: obscureText,
      maxLength: maxLength,
      validator: validator,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        focusedBorder: focusedBorder,
        enabledBorder: enableBorder,
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
      ),
      style: textStyle ?? const TextStyle(fontSize: 16),
    );
  }
}

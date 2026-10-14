import 'package:flutter/material.dart';
import '../theme/style.dart';

class KInput extends StatelessWidget {
  final String? name;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  const KInput({
    super.key,
    this.name,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: KColors.dark,
      ),
      decoration: InputDecoration(
        labelText: name,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

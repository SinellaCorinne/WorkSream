import 'package:flutter/material.dart';
import '../theme/style.dart'; // Assurez-vous que le chemin est correct
import '../theme/police.dart'; // Assurez-vous que le chemin est correct

class KInput extends StatelessWidget {
  final String? name;
  final TextInputType? keyboardType;
  final bool showClearButton;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final dynamic initialValue;
  final TextEditingController? controller;

  KInput({
    super.key,
    required this.name,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.showClearButton = false,
    this.initialValue,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: KTypography.h6(context, color: Colors.black), // Utilisez le style de texte défini
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: name,
        labelStyle: KTypography.h5(context, color: Colors.black), // Utilisez le style de texte défini
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: showClearButton
            ? Icon(Icons.close, size: 20, color: KColors.primary) // Utilisez la couleur définie
            : suffixIcon,
      ),
    );
  }
}

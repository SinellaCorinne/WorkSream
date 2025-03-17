import 'package:flutter/material.dart';
import '../../commons/k_default_layout.dart';
import '../../commons/logo.dart';
import '../../theme/style.dart'; // Assurez-vous que le chemin est correct
import '../../theme/police.dart'; // Assurez-vous que le chemin est correct

class LoginItem extends StatelessWidget {
  final String title;
  final String description;
  final String color;
  final bool isReversed;
  final Widget? action;
  final Widget? child;
  final Logo? logo; // Ajout du paramètre logo

  LoginItem({
    super.key,
    required this.title,
    required this.color,
    this.action,
    this.child, // Initialisation du paramètre child
    this.isReversed = false,
    required this.description,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: KDefaultLayout(
        imagePath: color,
        isReversed: isReversed,
        logo: logo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (logo != null) logo!,
            Text(
              title,
              style: KTypography.h4(context, color: KColors.tertiary), // Utilisez le style de texte défini
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: KTypography.h6(context, color: KColors.secondary), // Utilisez le style de texte défini
            ),
            SizedBox(height: 10),
            if (child != null) child!,
            SizedBox(height: 20),
            action ?? Container(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../commons/k_default_layout.dart';
import '../../../commons/logo.dart';


class InscItem extends StatelessWidget {
  final String title;
  final String description;
  final String color;
  final bool isReversed;
  final Widget? action;
  final Widget? child;
  final Logo? logo; // Ajout du paramètre logo

  const InscItem({
    super.key,
    required this.title,
    required this.color,
    this.action,
    this.child,
    this.isReversed = false,
    this.logo,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return KDefaultLayout(
      imagePath: color,
      isReversed: isReversed,
      logo: logo, // Passer le logo au KDefaultLayout
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (logo != null) // Afficher le logo s'il est fourni
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF0B0A5C),
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 10),
          Text(
            description,
            style:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          if (child != null) child!,
          const SizedBox(height: 30),
          action ?? Container(),
        ],
      ),
    );
  }
}

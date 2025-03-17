import 'package:flutter/material.dart';
import '../theme/style.dart'; // Assurez-vous que le chemin est correct
import '../theme/police.dart'; // Assurez-vous que le chemin est correct

class KListTileLeading extends StatelessWidget {
  final String path;

  const KListTileLeading({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Center(
        child: Image.asset(
          path, // Utilisez directement la variable path
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}

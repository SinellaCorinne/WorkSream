import 'package:flutter/material.dart';
import 'K_list_tile_leading.dart';
import '../theme/style.dart'; // Assurez-vous que le chemin est correct
import '../theme/police.dart'; // Assurez-vous que le chemin est correct

class KListTile extends StatelessWidget {
  final String path;
  final String title;
  final String subtitle;

  KListTile({
    super.key,
    required this.path,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: KColors.secondary.withOpacity(0.1), // Utilisez une couleur secondaire avec opacité
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          KListTileLeading(path: path),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: KTypography.h5(context, color: Colors.black), // Utilisez le style de texte défini
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    subtitle,
                    style: KTypography.h6(context, color: Colors.black), // Utilisez le style de texte défini
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

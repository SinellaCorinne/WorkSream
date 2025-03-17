import 'package:flutter/material.dart';
import '../theme/style.dart'; // Assurez-vous que le chemin est correct
import '../theme/police.dart'; // Assurez-vous que le chemin est correct

class KContainer1 extends StatelessWidget {
  final Widget child;
  final String? title;
  final Color? color;

  KContainer1({super.key, required this.child, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: color ?? KColors.secondary.withOpacity(0.1), // Utilisez la couleur secondaire avec opacité
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(
            title ?? "",
            style: KTypography.h5(context, color: KColors.primary), // Utilisez le style de texte défini
          )
              : SizedBox.shrink(),
          Container(width: double.infinity, child: child),
        ],
      ),
    );
  }
}

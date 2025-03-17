import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size; // Taille du conteneur
  final Color backgroundColor; // Couleur de fond du conteneur
  final Color borderColor; // Couleur du bord
  final double borderWidth; // Largeur du bord

  const Logo({
    Key? key,
    this.size = 40.0, // Taille par défaut
    this.backgroundColor = Colors.white, // Couleur de fond par défaut
    this.borderColor = Colors.white, // Couleur du bord par défaut
    this.borderWidth = 2.0, // Largeur du bord par défaut
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          child: Center(
            child: Image.asset(
              'assets/images/logo.jpg', // Chemin de l'image
              width: size * 0.6, // Ajustez la taille de l'image en fonction de la taille du conteneur
              height: size * 0.6,
            ),
          ),
        ),
        Positioned(
          bottom: 5, // Position du trait horizontal sous l'image
          child: Container(
            height: 4, // Hauteur du trait
            width: 25, // Largeur du trait
            color: const Color(0xFF0B0A5C), // Couleur du trait
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/style.dart';

class Logo extends StatelessWidget {
  final double size;

  const Logo({
    super.key,
    this.size = 64,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: KGradients.primaryGradient,
        borderRadius: BorderRadius.circular(size * 0.28),
        boxShadow: KShadows.primary,
      ),
      child: Icon(
        Iconsax.task_square,
        color: Colors.white,
        size: size * 0.45,
      ),
    );
  }
}

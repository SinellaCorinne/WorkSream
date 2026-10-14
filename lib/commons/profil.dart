import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/style.dart';

class Profil extends StatelessWidget {
  final String name;
  final String imagePath;

  const Profil({
    super.key,
    this.name = 'Sinella Dk',
    this.imagePath = 'assets/images/Profil.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(imagePath),
              backgroundColor: KColors.primary.withOpacity(0.10),
              onBackgroundImageError: (_, __) {},
            ),
            Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: KColors.secondary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Iconsax.edit, size: 12, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: KColors.dark,
                ),
              ),
              const Text(
                'Administrateur',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: KColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

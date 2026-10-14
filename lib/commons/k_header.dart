import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/style.dart';
import '../fonctionnalités/ecrans/contacts/contacts.dart';

/// Header réutilisable pour la page d'accueil.
class KHeader extends StatelessWidget {
  const KHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Iconsax.textalign_left, color: KColors.primary, size: 24),
        GestureDetector(
          onTap: () => Get.to(() => const ContactsListPage()),
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: KColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Iconsax.user, color: Colors.white, size: 18),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/fonctionnalit%C3%A9s/ecrans/Param%C3%A8tres.dart';
import '../fonctionnalités/ecrans/contacts/contacts.dart';
import '../theme/style.dart'; // Assurez-vous que le chemin est correct
import '../theme/police.dart'; // Assurez-vous que le chemin est correct


class KHeader extends StatelessWidget {
  final IconData leftIcon;
  final Color leftIconColor;
  final IconData rightIcon;
  final Color rightIconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const KHeader({
    super.key,
    this.leftIcon = Iconsax.textalign_left,
    this.leftIconColor = KColors.primary,
    this.rightIcon = Iconsax.user,
    this.rightIconColor = Colors.white,
    this.backgroundColor = KColors.primary,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(leftIcon, color: leftIconColor),
        GestureDetector(
          onTap: () => Get.to(ContactsListPage()),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: backgroundColor,
            ),
            child: Icon(rightIcon, color: rightIconColor),
          ),
        ),
      ],
    );
  }
}

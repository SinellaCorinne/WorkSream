import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'logo.dart';
import '../theme/style.dart'; // Assurez-vous que le chemin est correct
import '../theme/police.dart'; // Assurez-vous que le chemin est correct

class KDefaultLayout extends StatelessWidget {
  final String? imagePath;
  final Widget child;
  final bool isReversed;
  final Logo? logo; // Add this attribute

  const KDefaultLayout({
    super.key,
    this.imagePath,
    this.isReversed = false,
    required this.child,
    this.logo, // Add this attribute to the constructor
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Container(
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          image: imagePath != null
              ? DecorationImage(
            image: AssetImage('$imagePath'),
            fit: BoxFit.fitHeight,
          )
              : null,
          color: KColors.secondary, // Utilisez la couleur secondaire
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 46,
                  width: 5,
                  decoration: BoxDecoration(
                    color: KColors.tertiary, // Utilisez la couleur tertiaire
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  height: 46,
                  width: 10,
                  decoration: BoxDecoration(
                    color: KColors.primary, // Utilisez la couleur primaire
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  height: 46,
                  width: 5,
                  decoration: BoxDecoration(
                    color: KColors.tertiary, // Utilisez la couleur tertiaire
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  logo ??
                      Logo(
                        size: 78.0,
                        // Default icon
                        
                        borderWidth: 2.0,
                        backgroundColor: KColors.secondary, // Utilisez la couleur secondaire
                        borderColor: KColors.tertiary, // Utilisez la couleur tertiaire
                      ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              child,
            ],
          ),
        ),
      ),
    ];

    return Row(
      children: isReversed ? widgets.reversed.toList() : widgets,
    );
  }
}

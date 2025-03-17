import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/Connexion/ecrans/inscrire/insc_item.dart';

import '../../../commons/K_Input.dart';
import '../../../commons/kelevated_button.dart';
import '../../../commons/logo.dart';
import '../../../theme/style.dart';
import 'email.dart';
 // Assurez-vous que le chemin est correct

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  PageController controller = PageController();
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Image de fond ou décoration
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [KColors.primary, KColors.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Logo(
                      size: 120.0, // Ajustez la taille selon vos besoins
                      backgroundColor: Colors.white.withOpacity(0.2),
                      borderColor: KColors.primary,
                      borderWidth: 3.0,
                    ),
                    SizedBox(height: 40),
                    // Titre
                    Text(
                      "Vérification du code",
                      style: KTypography.h4(context, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Champs de saisie
                    Row(
                      children: [
                        Expanded(child: KInput(name: "")),
                        SizedBox(width: 5),
                        Expanded(child: KInput(name: "")),
                        SizedBox(width: 5),
                        Expanded(child: KInput(name: "")),
                        SizedBox(width: 5),
                        Expanded(child: KInput(name: "")),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Renvoyer à nouveau",
                      style: KTypography.h5(context, color: KColors.tertiary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Bouton de continuation
                    KElevatedButton(
                      child: Text("Continuer"),
                      onPressed: () => Get.to(Email()),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

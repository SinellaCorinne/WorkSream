import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/Connexion/ecrans/forget_password/verification.dart';

import '../../../commons/K_Input.dart';
import '../../../commons/kelevated_button.dart';
import '../../../commons/logo.dart';
import '../../../theme/style.dart';
import '../../../theme/police.dart';

class Reinitialisation extends StatefulWidget {
  const Reinitialisation({super.key});

  @override
  State<Reinitialisation> createState() => _ReinitialisationState();
}

class _ReinitialisationState extends State<Reinitialisation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Fond avec gradient
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
                      size: 120.0,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      borderColor: KColors.primary,
                      borderWidth: 3.0,
                    ),
                    SizedBox(height: 40),
                    // Titre
                    Text(
                      "Réinitialisation du mot de passe",
                      style: KTypography.h4(context, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Description
                    Text(
                      "Veuillez renseigner votre email ou votre téléphone pour la vérification",
                      style: KTypography.h6(context, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    // Champ de saisie
                    KInput(name: "Email/Telephone"),
                    SizedBox(height: 15),
                    // Message d'information
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Un code de vérification vous sera envoyé dans votre boite mail et par WhatsApp",
                        style: KTypography.h6(context, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30),
                    // Bouton de continuation
                    KElevatedButton(
                      child: Text("Continuer"),
                      onPressed: () => Get.to(Verification()),
                      backgroundColor: KColors.primary,
                      borderColor: KColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    SizedBox(height: 15),
                    // Bouton de retour

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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/Connexion/ecrans/welcomePage.dart';

import '../../../commons/K_Input.dart';
import '../../../commons/kelevated_button.dart';
import '../../../commons/logo.dart';
import '../../../theme/style.dart';
import '../../../theme/police.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
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
                      "Définition de votre mot de passe",
                      style: KTypography.h4(context, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Champs de saisie
                    KInput(
                      name: "Mot de passe",
                      suffixIcon: Icon(Iconsax.password_check, color: KColors.primary),
                    ),
                    SizedBox(height: 10),
                    KInput(
                      name: "Confirmer",
                      suffixIcon: Icon(Iconsax.password_check, color: KColors.primary),
                    ),
                    SizedBox(height: 20),
                    // Bouton de continuation
                    KElevatedButton(
                      child: Text("Terminer"),
                      onPressed: () => Get.to(Welcomepage()),
                      backgroundColor: KColors.primary,
                      borderColor: KColors.primary,
                      foregroundColor: Colors.white,
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

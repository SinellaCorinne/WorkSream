import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../commons/K_Input.dart';
import '../../commons/kelevated_button.dart';
import '../../commons/logo.dart';
import 'inscrire/insc_item.dart';
import 'inscrire/telephone.dart';
import '../../theme/style.dart'; // Assurez-vous que le chemin est correct
import '../../theme/police.dart'; // Assurez-vous que le chemin est correct

class Inscriptionpage extends StatefulWidget {
  const Inscriptionpage({super.key});

  @override
  State<Inscriptionpage> createState() => _InscriptionpageState();
}

class _InscriptionpageState extends State<Inscriptionpage> {
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
                      "Inscription",
                      style: KTypography.h4(context, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Champs de saisie
                    KInput(name: "Noms"),
                    SizedBox(height: 10),
                    KInput(name: "Prénoms"),
                    SizedBox(height: 20),
                    // Bouton de continuation
                    KElevatedButton(
                      child: Text("Continuer"),
                      onPressed: () => Get.to(Phone()),

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

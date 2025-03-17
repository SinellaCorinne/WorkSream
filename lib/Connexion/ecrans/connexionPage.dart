import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/Connexion/ecrans/forget_password/reinitialisation.dart';
import 'package:management/Connexion/ecrans/inscriptionPage.dart';
import 'package:management/Connexion/ecrans/welcomePage.dart';
import '../../commons/K_Input.dart';
import '../../commons/logo.dart';
import '../../commons/kelevated_button.dart';
import '../../theme/style.dart'; // Assurez-vous que le chemin est correct
import '../../theme/police.dart'; // Assurez-vous que le chemin est correct

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
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
                      "Connexion à l'espace utilisateur",
                      style: KTypography.h4(context, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Champs de saisie
                    KInput(name: "Username"),
                    SizedBox(height: 10),
                    KInput(
                      name: "Password",
                      suffixIcon: Icon(Iconsax.password_check, color: KColors.primary),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      child: Text(
                        "Mot de passe oublié?",
                        style: KTypography.h6(context, color: KColors.tertiary),
                      ),
                      onPressed: () => Get.to(Reinitialisation()),
                    ),
                    SizedBox(height: 20),
                    // Bouton de connexion
                    KElevatedButton(
                      child: Text("Se connecter"),
                      onPressed: () {
                        Get.to(() => Welcomepage()); // Utilisez Get.to pour la navigation
                      },
                      backgroundColor: KColors.primary,
                      borderColor: KColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    SizedBox(height: 10),
                    // Bouton d'inscription
                    KElevatedButton(
                      child: Text("S'inscrire"),
                      onPressed: () => Get.to(Inscriptionpage()),
                      backgroundColor: Colors.white,
                      borderColor: KColors.primary,
                      foregroundColor: KColors.primary,
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

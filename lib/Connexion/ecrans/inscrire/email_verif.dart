import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/Connexion/ecrans/inscrire/password_define.dart';

import '../../../commons/K_Input.dart';
import '../../../commons/kelevated_button.dart';
import '../../../commons/logo.dart';
import '../../../theme/style.dart';
import 'insc_item.dart';
 // Assurez-vous que le chemin est correct

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
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
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
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
                    const Logo(
                      size: 120.0, // Ajustez la taille selon vos besoins
                      backgroundColor: Colors.white,
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
                    SizedBox(height: 5),
                    Text(
                      "Renvoyer à nouveau",
                      style: KTypography.h5(context, color: KColors.tertiary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Bouton de continuation
                    KElevatedButton(
                      child: const Text("Continuer"),
                      onPressed: () => Get.to(PasswordDefine()),

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

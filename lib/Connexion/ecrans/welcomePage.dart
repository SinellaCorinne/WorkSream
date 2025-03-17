import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management/fonctionnalités/accueil/accueilPage.dart'; // Assurez-vous que le chemin est correct
import '../../commons/kelevated_button.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
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
          // Image de fond
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/idee.png'), // Remplacez par votre image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenu superposé
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Message de bienvenue
                Text(
                  "Bienvenue sur Work Stream",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Profitez des avantages de l'application",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 40),
                // Bouton Commencer
                KElevatedButton(
                  child: Text("Commencer"),
                  onPressed: () => Get.to(() => AccueilPage()), // Navigation vers AccueilPage

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

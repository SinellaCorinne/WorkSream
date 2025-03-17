import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../commons/K_Input.dart';
import '../../commons/k_header.dart';
import '../../commons/k_listtile.dart';
import '../../theme/style.dart';

class Accueilc extends StatelessWidget {
  const Accueilc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            const KHeader(),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            const Text(
              "Que voulez vous faire aujourd'hui ?",
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            KInput(
              name: "Rechercher",
              suffixIcon: Icon(Iconsax.search_normal, color: KColors.primary),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Projets récents",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Tout",
                    ),
                )
              ],
            ),
            KListTile(
                path: "assets/images/management.jpg",
                title: "Application de recette de cuisines",
                subtitle: "Taches: 1 sur 10"),
            SizedBox(height: 10),
            KListTile(
                path: "assets/images/idee.png",
                title: "Système de gestion de bibliotheques",
                subtitle: "Taches: 1/12"),
            SizedBox(height: 10),
            KListTile(
                path: "assets/images/managers1.jpg",
                title: "Projet SIGES",
                subtitle: "Taches: 1/12"),
            SizedBox(height: 10),
            KListTile(
                path: "assets/images/groupe.jpg",
                title: "Conception d'un Système de Gestion de Stock",
                subtitle: "Taches: 1/12"),
            SizedBox(height: 10),
            KListTile(
                path: "assets/images/man.png",
                title: "Développement d'une Application de Réservation de Voyages",
                subtitle: "Taches: 1/12"),
            const SizedBox(height: 10),
            KListTile(
                path: "assets/images/setting.png",
                title: "Création d'une Plateforme de Streaming Vidéo",
                subtitle: "Taches: 1/12"),
            SizedBox(height: 10),
            KListTile(
                path: "assets/images/taches.jpg",
                title: "Développement d'une Application de Réalité Augmentée",
                subtitle: "Taches: 1/12"),
            SizedBox(height: 10),
            KListTile(
                path: "assets/images/commerce.jpg",
                title: "Conception d'un Système de Gestion de Projet",
                subtitle: "Taches: 1/12"),
            SizedBox(height: 10),
            KListTile(
                path: "assets/images/marketing.jpg",
                title: "Développement d'une Application de Fitness",
                subtitle: "Taches: 1/12"),
            SizedBox(height: 10),
            KListTile(
                path: "assets/images/stock.jpg",
                title: "Création d'un Réseau Social pour Entreprises",
                subtitle: "Taches: 1/12"),
          ],
        ),
      ),
    );
  }
}

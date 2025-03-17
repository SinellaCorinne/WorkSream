import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/Connexion/ecrans/connexionPage.dart';
import 'package:management/fonctionnalit%C3%A9s/ecrans/pEcrans/Termes.dart';
import 'package:management/fonctionnalit%C3%A9s/ecrans/pEcrans/confidentialit%C3%A9.dart';
import 'package:management/fonctionnalit%C3%A9s/ecrans/pEcrans/notif.dart';
import 'package:management/fonctionnalit%C3%A9s/ecrans/pEcrans/personnalisation.dart';

import '../../commons/kelevated_button.dart';
import '../../commons/profil.dart';
import '../../theme/style.dart';
import '../composants/setting_item.dart';
import 'pEcrans/help.dart';

class Parametres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compte', style: KTypography.h4(context)),
        backgroundColor: KColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Utilisation du composant Profil
              Profil(
                name: 'Sinella Dk',
              ),
              SizedBox(height: 20),

              // Titre de la section des paramètres
              Text(
                'Paramètres',
                style: KTypography.h5(context, color: KColors.secondary),
              ),
              SizedBox(height: 10),

              // Utilisation du composant SettingItem
              SettingItem(
                title: 'Personnaliser',
                leadingIcon:Iconsax.pen_add,
                  trailingIcon:Iconsax.arrow_right,
                onTap: () {
                  Get.to(() => PersonnaliserPage());
                },
              ),
              SizedBox(height: 10),
              SettingItem(
                title: 'Notifications',
                leadingIcon:Iconsax.notification,
                trailingIcon:Iconsax.arrow_right,
                onTap:  () {
                  Get.to(() => NotificationsPage());
                },
              ),
              SizedBox(height: 10),
              SettingItem(
                title: 'Confidentialité',
                leadingIcon:Iconsax.lock,
                trailingIcon:Iconsax.arrow_right,
                onTap:  () {
                  Get.to(() => ConfidentialitePage());
                },
              ),
              SizedBox(height: 10),
              SettingItem(
                title: 'Termes et Conditions',
                leadingIcon:Iconsax.document_text,
                trailingIcon:Iconsax.arrow_right,
                onTap:  () {
                  Get.to(() => TermesConditionsPage());
                },
              ),
              SizedBox(height: 10),
              SettingItem(
                title: 'Pages d\'aide',
                leadingIcon:Iconsax.info_circle,
                trailingIcon:Iconsax.arrow_right,
                onTap:  () {
                  Get.to(() => PagesAidePage());
                },
              ),
              SizedBox(height: 20),
              KElevatedButton(
                child: Text("Déconnexion"),
                onPressed: () {
                  Get.to(() => ConnexionPage()); // Utilisez Get.to pour la navigation
                },
                backgroundColor: KColors.primary,
                borderColor: KColors.primary,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
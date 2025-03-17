import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/fonctionnalités/ecrans/accueilC.dart';
import 'package:management/theme/style.dart';
import '../ecrans/Paramètres.dart';
import '../ecrans/discussion.dart';
import '../ecrans/tachesPage.dart';
import 'accueilController.dart';

class AccueilPage extends StatelessWidget {
  final AccueilController controller = Get.put(AccueilController.instance);

  AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => IndexedStack(
          index: controller.curentIndex,
          children: [
            Accueilc(),
            Tachespage(),
            DiscussionListPage(),
            Parametres(),
          ],
        )),
      ),
      bottomNavigationBar: Obx(() => NavigationBar(

        selectedIndex: controller.curentIndex,
        onDestinationSelected: (value) {
          controller.updateCurentIndex(value);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home_1), label: "Accueil"),
          NavigationDestination(icon: Icon(Iconsax.task), label: "Taches"),
          NavigationDestination(icon: Icon(Iconsax.messages), label: "Discussions"),
          NavigationDestination(icon: Icon(Iconsax.setting), label: "Paramètres"),
        ],
      )),
    );
  }
}

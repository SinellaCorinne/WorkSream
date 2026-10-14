import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/fonctionnalités/ecrans/accueilC.dart';
import '../ecrans/Paramètres.dart';
import '../ecrans/discussion.dart';
import '../ecrans/tachesPage.dart';
import 'accueilController.dart';

class AccueilPage extends StatelessWidget {
  AccueilPage({super.key});

  final AccueilController controller = Get.put(AccueilController.instance);

  static const _destinations = [
    (icon: Iconsax.home_2,     iconSelected: Iconsax.home,      label: 'Accueil'),
    (icon: Iconsax.task_square, iconSelected: Iconsax.task,      label: 'Tâches'),
    (icon: Iconsax.message,    iconSelected: Iconsax.messages_1, label: 'Messages'),
    (icon: Iconsax.setting_2,  iconSelected: Iconsax.setting,    label: 'Profil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.curentIndex,
        children: [
          const Accueilc(),
          const Tachespage(),
          const DiscussionListPage(),
          const Parametres(),
        ],
      )),
      bottomNavigationBar: _BottomNav(controller: controller),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final AccueilController controller;
  const _BottomNav({required this.controller});

  static const _items = [
    (icon: Iconsax.home_2,      activeIcon: Iconsax.home,       label: 'Accueil'),
    (icon: Iconsax.task_square, activeIcon: Iconsax.task,        label: 'Tâches'),
    (icon: Iconsax.message,     activeIcon: Iconsax.messages_1,  label: 'Messages'),
    (icon: Iconsax.setting_2,   activeIcon: Iconsax.setting,     label: 'Profil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selected = controller.curentIndex as int;
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 64,
            child: Row(
              children: List.generate(_items.length, (i) {
                final item = _items[i];
                final isSelected = i == selected;
                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => controller.updateCurentIndex(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            width: isSelected ? 48 : 0,
                            height: isSelected ? 32 : 0,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF2D6A8F).withOpacity(0.12)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              isSelected ? item.activeIcon : item.icon,
                              size: 22,
                              color: isSelected
                                  ? const Color(0xFF2D6A8F)
                                  : const Color(0xFF8A94A6),
                            ),
                          ),
                          if (!isSelected) ...[
                            Icon(
                              item.icon,
                              size: 22,
                              color: const Color(0xFF8A94A6),
                            ),
                          ],
                          const SizedBox(height: 3),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isSelected
                                  ? const Color(0xFF2D6A8F)
                                  : const Color(0xFF8A94A6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      );
    });
  }
}

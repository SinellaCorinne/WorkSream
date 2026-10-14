import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/style.dart';
import '../../Connexion/ecrans/connexionPage.dart';
import 'pEcrans/notif.dart';
import 'pEcrans/personnalisation.dart';
import 'pEcrans/confidentialité.dart';
import 'pEcrans/Termes.dart';
import 'pEcrans/help.dart';

class Parametres extends StatelessWidget {
  const Parametres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      body: CustomScrollView(
        slivers: [
          // ── Header profil ──────────────────────────────────────────────
          const SliverToBoxAdapter(child: _ProfileHeader()),

          // ── Section Compte ─────────────────────────────────────────────
          SliverToBoxAdapter(
            child: _SectionLabel('Mon compte'),
          ),
          SliverToBoxAdapter(
            child: _SettingsGroup(
              items: [
                _SettingsItem(
                  icon: Iconsax.brush_1,
                  label: 'Personnalisation',
                  subtitle: 'Thème, langue, taille du texte',
                  color: KColors.accent,
                  onTap: () => Get.to(() => const PersonnaliserPage()),
                ),
                _SettingsItem(
                  icon: Iconsax.notification,
                  label: 'Notifications',
                  subtitle: 'Sons, alertes et rappels',
                  color: KColors.warning,
                  onTap: () => Get.to(() => const NotificationsPage()),
                ),
              ],
            ),
          ),

          // ── Section Sécurité & Légal ───────────────────────────────────
          SliverToBoxAdapter(child: _SectionLabel('Sécurité & Légal')),
          SliverToBoxAdapter(
            child: _SettingsGroup(
              items: [
                _SettingsItem(
                  icon: Iconsax.lock,
                  label: 'Confidentialité',
                  subtitle: 'Données, localisation, partage',
                  color: KColors.info,
                  onTap: () => Get.to(() => const ConfidentialitePage()),
                ),
                _SettingsItem(
                  icon: Iconsax.document_text,
                  label: 'Termes et Conditions',
                  subtitle: 'CGU et politique d\'utilisation',
                  color: KColors.grey,
                  onTap: () => Get.to(() => const TermesConditionsPage()),
                ),
                _SettingsItem(
                  icon: Iconsax.info_circle,
                  label: 'Aide & Support',
                  subtitle: 'FAQ, contacter le support',
                  color: KColors.secondary,
                  onTap: () => Get.to(() => const PagesAidePage()),
                ),
              ],
            ),
          ),

          // ── Version ────────────────────────────────────────────────────
          const SliverToBoxAdapter(child: _VersionInfo()),

          // ── Déconnexion ────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              child: _LogoutButton(),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Header profil ─────────────────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: KGradients.cardGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20,
        left: 20,
        right: 20,
        bottom: 28,
      ),
      child: Column(
        children: [
          // Avatar
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: KColors.secondary, width: 3),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Profil.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: KColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Iconsax.edit, size: 14, color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Nom
          const Text(
            'Sinella Dk',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'sinella.dk@workstream.app',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              color: Colors.white.withOpacity(0.60),
            ),
          ),

          const SizedBox(height: 20),

          // Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ProfileStat(value: '11', label: 'Projets'),
              _Divider(),
              _ProfileStat(value: '5', label: 'Équipes'),
              _Divider(),
              _ProfileStat(value: '89', label: 'Tâches'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String value;
  final String label;
  const _ProfileStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Colors.white.withOpacity(0.60),
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 28),
      color: Colors.white.withOpacity(0.20),
    );
  }
}

// ── Section label ─────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: KColors.grey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

// ── Groupe de settings ────────────────────────────────────────────────────────

class _SettingsGroup extends StatelessWidget {
  final List<_SettingsItem> items;
  const _SettingsGroup({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: KShadows.soft,
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          return Column(
            children: [
              items[i],
              if (i < items.length - 1)
                const Divider(
                    height: 1, indent: 56, endIndent: 16,
                    color: Color(0xFFEFF2F7)),
            ],
          );
        }),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // Icône
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 20, color: color),
            ),
            const SizedBox(width: 14),
            // Texte
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: KColors.dark,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      color: KColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Iconsax.arrow_right_3,
                size: 16, color: KColors.grey),
          ],
        ),
      ),
    );
  }
}

// ── Version ───────────────────────────────────────────────────────────────────

class _VersionInfo extends StatelessWidget {
  const _VersionInfo();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Text(
          'WorkStream v1.0.0',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: KColors.grey,
          ),
        ),
      ),
    );
  }
}

// ── Bouton déconnexion ────────────────────────────────────────────────────────

class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offAll(() => const ConnexionPage()),
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: KColors.error.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: KColors.error.withOpacity(0.25), width: 1.5),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.logout, color: KColors.error, size: 18),
            SizedBox(width: 8),
            Text(
              'Se déconnecter',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: KColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

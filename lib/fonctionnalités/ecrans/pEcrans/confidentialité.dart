import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import 'notif.dart' show _SectionTitle, _SettingsCard, _Divider, _SwitchRow;

class ConfidentialitePage extends StatefulWidget {
  const ConfidentialitePage({super.key});

  @override
  State<ConfidentialitePage> createState() => _ConfidentialitePageState();
}

class _ConfidentialitePageState extends State<ConfidentialitePage> {
  bool _location = false;
  bool _analytics = true;
  bool _targetedAds = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      appBar: AppBar(title: const Text('Confidentialité')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Info banner
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: KColors.info.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              border:
                  Border.all(color: KColors.info.withOpacity(0.20), width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Iconsax.shield_tick,
                    color: KColors.info, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Vos données sont protégées et ne sont jamais partagées avec des tiers sans votre consentement explicite.',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: KColors.info,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          _SectionTitle('Paramètres de confidentialité'),
          _SettingsCard(children: [
            _SwitchRow(
              icon: Iconsax.location,
              color: KColors.success,
              title: 'Partage de localisation',
              subtitle: 'Autoriser l\'accès à votre position',
              value: _location,
              onChanged: (v) => setState(() => _location = v),
            ),
            const _Divider(),
            _SwitchRow(
              icon: Iconsax.chart,
              color: KColors.primary,
              title: 'Données analytiques',
              subtitle: 'Aider à améliorer l\'application',
              value: _analytics,
              onChanged: (v) => setState(() => _analytics = v),
            ),
            const _Divider(),
            _SwitchRow(
              icon: Iconsax.tag,
              color: KColors.warning,
              title: 'Publicités ciblées',
              subtitle: 'Personnaliser les publicités',
              value: _targetedAds,
              onChanged: (v) => setState(() => _targetedAds = v),
            ),
          ]),

          _SectionTitle('Actions sur les données'),
          _SettingsCard(children: [
            _ActionTile(
              icon: Iconsax.document_download,
              color: KColors.secondary,
              title: 'Télécharger mes données',
              subtitle: 'Exporter toutes vos informations',
              onTap: () => _showSnack(context, 'Téléchargement en cours…'),
            ),
            const _Divider(),
            _ActionTile(
              icon: Iconsax.trash,
              color: KColors.error,
              title: 'Supprimer mon compte',
              subtitle: 'Action irréversible',
              onTap: () => _showDeleteDialog(context),
              isDestructive: true,
            ),
          ]),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg,
            style: const TextStyle(fontFamily: 'Poppins', fontSize: 13)),
        backgroundColor: KColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Supprimer le compte',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                color: KColors.dark)),
        content: const Text(
          'Cette action est irréversible. Toutes vos données seront définitivement supprimées.',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 13, color: KColors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KColors.grey,
                    fontWeight: FontWeight.w600)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Supprimer',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KColors.error,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ActionTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color:
                                isDestructive ? KColors.error : KColors.dark)),
                    Text(subtitle,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            color: KColors.grey)),
                  ],
                ),
              ),
              Icon(Iconsax.arrow_right_3,
                  size: 16, color: isDestructive ? KColors.error : KColors.grey),
            ],
          ),
        ),
      );
}

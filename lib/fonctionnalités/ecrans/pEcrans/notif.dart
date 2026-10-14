import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _allEnabled = true;
  bool _sound = true;
  bool _messages = true;
  bool _reminders = true;
  bool _updates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _SectionTitle('Paramètres généraux'),
          _SettingsCard(children: [
            _SwitchRow(
              icon: Iconsax.notification,
              color: KColors.primary,
              title: 'Activer les notifications',
              subtitle: 'Contrôle général de toutes les alertes',
              value: _allEnabled,
              onChanged: (v) => setState(() {
                _allEnabled = v;
                if (!v) {
                  _sound = _messages = _reminders = _updates = false;
                }
              }),
            ),
            const _Divider(),
            _SwitchRow(
              icon: Iconsax.volume_high,
              color: KColors.warning,
              title: 'Sons',
              subtitle: 'Jouer un son pour les alertes',
              value: _sound && _allEnabled,
              enabled: _allEnabled,
              onChanged: (v) => setState(() => _sound = v),
            ),
          ]),

          _SectionTitle('Types de notifications'),
          _SettingsCard(children: [
            _SwitchRow(
              icon: Iconsax.message,
              color: KColors.secondary,
              title: 'Messages',
              subtitle: 'Nouveaux messages et mentions',
              value: _messages && _allEnabled,
              enabled: _allEnabled,
              onChanged: (v) => setState(() => _messages = v),
            ),
            const _Divider(),
            _SwitchRow(
              icon: Iconsax.timer_1,
              color: KColors.accent,
              title: 'Rappels',
              subtitle: 'Rappels de tâches et d\'échéances',
              value: _reminders && _allEnabled,
              enabled: _allEnabled,
              onChanged: (v) => setState(() => _reminders = v),
            ),
            const _Divider(),
            _SwitchRow(
              icon: Iconsax.refresh,
              color: KColors.info,
              title: 'Mises à jour',
              subtitle: 'Nouvelles fonctionnalités et correctifs',
              value: _updates && _allEnabled,
              enabled: _allEnabled,
              onChanged: (v) => setState(() => _updates = v),
            ),
          ]),
        ],
      ),
    );
  }
}

// ── Widgets ───────────────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 20),
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

class _SettingsCard extends StatelessWidget {
  final List<Widget> children;
  const _SettingsCard({required this.children});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: KShadows.soft,
        ),
        child: Column(children: children),
      );
}

class _Divider extends StatelessWidget {
  const _Divider();
  @override
  Widget build(BuildContext context) => const Divider(
        height: 1,
        indent: 56,
        endIndent: 16,
        color: Color(0xFFEFF2F7),
      );
}

class _SwitchRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final bool value;
  final bool enabled;
  final ValueChanged<bool> onChanged;

  const _SwitchRow({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.value,
    this.enabled = true,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: enabled ? 1.0 : 0.45,
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
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: KColors.dark)),
                    Text(subtitle,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            color: KColors.grey)),
                  ],
                ),
              ),
              Switch.adaptive(
                value: value,
                onChanged: enabled ? onChanged : null,
                activeColor: KColors.primary,
              ),
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import 'settings_widgets.dart';

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
          SettingsSectionTitle('Paramètres généraux'),
          SettingsCard(children: [
            SettingsSwitchRow(
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
            const SettingsDivider(),
            SettingsSwitchRow(
              icon: Iconsax.volume_high,
              color: KColors.warning,
              title: 'Sons',
              subtitle: 'Jouer un son pour les alertes',
              value: _sound && _allEnabled,
              enabled: _allEnabled,
              onChanged: (v) => setState(() => _sound = v),
            ),
          ]),
          SettingsSectionTitle('Types de notifications'),
          SettingsCard(children: [
            SettingsSwitchRow(
              icon: Iconsax.message,
              color: KColors.secondary,
              title: 'Messages',
              subtitle: 'Nouveaux messages et mentions',
              value: _messages && _allEnabled,
              enabled: _allEnabled,
              onChanged: (v) => setState(() => _messages = v),
            ),
            const SettingsDivider(),
            SettingsSwitchRow(
              icon: Iconsax.timer_1,
              color: KColors.accent,
              title: 'Rappels',
              subtitle: 'Rappels de tâches et d\'échéances',
              value: _reminders && _allEnabled,
              enabled: _allEnabled,
              onChanged: (v) => setState(() => _reminders = v),
            ),
            const SettingsDivider(),
            SettingsSwitchRow(
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

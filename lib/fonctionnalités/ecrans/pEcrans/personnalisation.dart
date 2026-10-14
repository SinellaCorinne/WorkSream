import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import 'settings_widgets.dart';

class PersonnaliserPage extends StatefulWidget {
  const PersonnaliserPage({super.key});

  @override
  State<PersonnaliserPage> createState() => _PersonnaliserPageState();
}

class _PersonnaliserPageState extends State<PersonnaliserPage> {
  bool _darkMode = false;
  String _langue = 'Français';
  double _fontSize = 14;

  static const _langues = ['Français', 'English', 'Español', 'Deutsch'];
  static const _themeColors = [
    Color(0xFF2D6A8F),
    Color(0xFF7C5CBF),
    Color(0xFF00C9A7),
    Color(0xFFFF4D6D),
    Color(0xFFFFB84C),
  ];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      appBar: AppBar(title: const Text('Personnalisation')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SettingsSectionTitle('Apparence'),
          SettingsCard(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: KColors.dark.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Iconsax.moon, size: 20, color: KColors.dark),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mode sombre',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: KColors.dark)),
                        Text('Thème foncé pour l\'interface',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                color: KColors.grey)),
                      ],
                    ),
                  ),
                  Switch.adaptive(
                    value: _darkMode,
                    onChanged: (v) => setState(() => _darkMode = v),
                    activeColor: KColors.primary,
                  ),
                ],
              ),
            ),
          ]),

          SettingsSectionTitle('Couleur d\'accentuation'),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: KShadows.soft,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_themeColors.length, (i) {
                final selected = _selectedColor == i;
                return GestureDetector(
                  onTap: () => setState(() => _selectedColor = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _themeColors[i],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected ? KColors.dark : Colors.transparent,
                        width: 3,
                      ),
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: _themeColors[i].withOpacity(0.40),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: selected
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),
                );
              }),
            ),
          ),

          SettingsSectionTitle('Langue'),
          SettingsCard(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: KColors.info.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Iconsax.global, size: 20, color: KColors.info),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Text('Langue',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: KColors.dark)),
                  ),
                  DropdownButton<String>(
                    value: _langue,
                    underline: const SizedBox(),
                    icon: const Icon(Iconsax.arrow_down_2,
                        size: 14, color: KColors.grey),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: KColors.dark,
                    ),
                    onChanged: (v) => setState(() => _langue = v!),
                    items: _langues
                        .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                        .toList(),
                  ),
                ],
              ),
            ),
          ]),

          SettingsSectionTitle('Taille du texte'),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: KShadows.soft,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('A',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: KColors.grey)),
                    Expanded(
                      child: Slider(
                        value: _fontSize,
                        min: 12,
                        max: 22,
                        divisions: 5,
                        activeColor: KColors.primary,
                        inactiveColor: KColors.greyLight,
                        onChanged: (v) => setState(() => _fontSize = v),
                      ),
                    ),
                    const Text('A',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: KColors.dark)),
                  ],
                ),
                Center(
                  child: Text(
                    'Aperçu: ${_fontSize.round()}px',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: _fontSize,
                      color: KColors.dark,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

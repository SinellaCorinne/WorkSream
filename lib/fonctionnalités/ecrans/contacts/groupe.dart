import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import '../discussion.dart';
import '../discussion_page.dart';
import 'contact.dart';

class SelectContactsPage extends StatefulWidget {
  final List<Contact> contacts;
  const SelectContactsPage({super.key, required this.contacts});

  @override
  State<SelectContactsPage> createState() => _SelectContactsPageState();
}

class _SelectContactsPageState extends State<SelectContactsPage> {
  final Set<int> _selected = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      appBar: AppBar(
        title: const Text('Nouveau groupe'),
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (_selected.isNotEmpty)
            TextButton(
              onPressed: _createGroup,
              child: Text(
                'Créer (${_selected.length})',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: KColors.primary,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chips sélectionnés
          if (_selected.isNotEmpty)
            _SelectedChips(
              contacts: _selected.map((i) => widget.contacts[i]).toList(),
            ),

          // Instruction
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Text(
              'Sélectionnez les membres du groupe',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: KColors.grey,
              ),
            ),
          ),

          // Liste
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              itemCount: widget.contacts.length,
              itemBuilder: (_, i) {
                final contact = widget.contacts[i];
                final isSelected = _selected.contains(i);
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? KColors.primary.withOpacity(0.06)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected
                          ? KColors.primary.withOpacity(0.30)
                          : Colors.transparent,
                      width: 1.5,
                    ),
                    boxShadow: KShadows.soft,
                  ),
                  child: InkWell(
                    onTap: () => setState(() {
                      isSelected ? _selected.remove(i) : _selected.add(i);
                    }),
                    borderRadius: BorderRadius.circular(14),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 11),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage: AssetImage(contact.avatarUrl),
                            backgroundColor:
                                KColors.primary.withOpacity(0.10),
                            onBackgroundImageError: (_, __) {},
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact.name,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: KColors.dark,
                                  ),
                                ),
                                Text(
                                  contact.role,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: KColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? KColors.primary
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? KColors.primary
                                    : const Color(0xFFD0D8E4),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: isSelected
                                ? const Icon(Icons.check,
                                    size: 13, color: Colors.white)
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // FAB créer groupe
      floatingActionButton: _selected.length >= 2
          ? FloatingActionButton.extended(
              onPressed: _createGroup,
              backgroundColor: KColors.primary,
              icon: const Icon(Iconsax.people, color: Colors.white, size: 18),
              label: Text(
                'Créer le groupe (${_selected.length})',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            )
          : null,
    );
  }

  void _createGroup() {
    if (_selected.isEmpty) return;
    final names =
        _selected.map((i) => widget.contacts[i].name.split(' ').first).join(', ');
    final groupDiscussion = Discussion(
      title: 'Groupe: $names',
      lastMessage: 'Groupe créé',
      time: '',
      isOnline: false,
      avatar: 'assets/images/groupe.jpg',
    );
    Get.to(() => DiscussionPage(discussion: groupDiscussion));
  }
}

class _SelectedChips extends StatelessWidget {
  final List<Contact> contacts;
  const _SelectedChips({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: contacts.length,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(contacts[i].avatarUrl),
                backgroundColor: KColors.primary.withOpacity(0.10),
                onBackgroundImageError: (_, __) {},
              ),
              const SizedBox(height: 2),
              Text(
                contacts[i].name.split(' ').first,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 9,
                  color: KColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import '../discussion.dart';
import '../discussion_page.dart';
import 'new_contact.dart';

class Contact {
  final String name;
  final String avatarUrl;
  final String role;

  Contact({
    required this.name,
    required this.avatarUrl,
    this.role = 'Membre',
  });
}

final List<Contact> sampleContacts = [
  Contact(name: 'Alice Martin',   avatarUrl: 'assets/images/Profil.jpg',    role: 'Designer UX'),
  Contact(name: 'Bob Dupont',     avatarUrl: 'assets/images/man.png',        role: 'Développeur'),
  Contact(name: 'Clara Nkosi',    avatarUrl: 'assets/images/Profil.jpg',    role: 'Chef de projet'),
  Contact(name: 'David Huang',    avatarUrl: 'assets/images/man.png',        role: 'Développeur'),
  Contact(name: 'Emilie Renard',  avatarUrl: 'assets/images/Profil.jpg',    role: 'QA Engineer'),
  Contact(name: 'François Bah',   avatarUrl: 'assets/images/man.png',        role: 'DevOps'),
  Contact(name: 'Grace Diallo',   avatarUrl: 'assets/images/Profil.jpg',    role: 'Marketing'),
  Contact(name: 'Hugo Lemaire',   avatarUrl: 'assets/images/man.png',        role: 'Développeur'),
  Contact(name: 'Inès Coulibaly', avatarUrl: 'assets/images/Profil.jpg',    role: 'Designer UI'),
  Contact(name: 'Jean Mbeki',     avatarUrl: 'assets/images/man.png',        role: 'Product Owner'),
];

// ── Page liste des contacts (pour nouveau message) ────────────────────────────

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  String _search = '';

  List<Contact> get _filtered => sampleContacts
      .where(
          (c) => c.name.toLowerCase().contains(_search.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      appBar: AppBar(
        title: const Text('Nouveau message'),
        backgroundColor: KColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left, color: KColors.dark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Barre recherche
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: _SearchField(
              hint: 'Rechercher un contact…',
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          const SizedBox(height: 8),

          // Liste
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              itemCount: _filtered.length,
              itemBuilder: (_, i) => _ContactTile(
                contact: _filtered[i],
                onTap: () {
                  final discussion = Discussion(
                    title: _filtered[i].name,
                    lastMessage: '',
                    time: '',
                    isOnline: true,
                    avatar: _filtered[i].avatarUrl,
                  );
                  Get.to(() => DiscussionPage(discussion: discussion));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Widgets partagés ──────────────────────────────────────────────────────────

class _SearchField extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;

  const _SearchField({required this.hint, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: KShadows.soft,
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: KColors.dark,
        ),
        decoration: const InputDecoration(
          hintText: 'Rechercher…',
          hintStyle:
              TextStyle(fontFamily: 'Poppins', fontSize: 14, color: KColors.grey),
          prefixIcon:
              Icon(Iconsax.search_normal, color: KColors.grey, size: 18),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const _ContactTile({required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: KShadows.soft,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(contact.avatarUrl),
                backgroundColor: KColors.primary.withOpacity(0.10),
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
              const Icon(Iconsax.message, color: KColors.primary, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

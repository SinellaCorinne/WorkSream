import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import 'contact.dart';
import 'new_contact.dart';
import 'groupe.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  List<Contact> _contacts = List.from(sampleContacts);
  String _search = '';

  List<Contact> get _filtered => _contacts
      .where((c) => c.name.toLowerCase().contains(_search.toLowerCase()) ||
          c.role.toLowerCase().contains(_search.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      body: Column(
        children: [
          // ── Header ────────────────────────────────────────────────────
          _ContactsHeader(
            count: _contacts.length,
            onSearch: (v) => setState(() => _search = v),
          ),

          // ── Liste ─────────────────────────────────────────────────────
          Expanded(
            child: _filtered.isEmpty
                ? _EmptyContacts(onAdd: _openAddContact)
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                    itemCount: _filtered.length,
                    itemBuilder: (_, i) => _ContactCard(
                      contact: _filtered[i],
                    ),
                  ),
          ),
        ],
      ),

      // ── FABs ──────────────────────────────────────────────────────────
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Créer un groupe
          FloatingActionButton.small(
            heroTag: 'group_fab',
            onPressed: () => Get.to(() => SelectContactsPage(contacts: _contacts)),
            backgroundColor: KColors.secondary,
            child: const Icon(Iconsax.people, color: Colors.white, size: 18),
          ),
          const SizedBox(height: 10),
          // Ajouter contact
          FloatingActionButton.extended(
            heroTag: 'add_fab',
            onPressed: _openAddContact,
            backgroundColor: KColors.primary,
            icon: const Icon(Iconsax.user_add, color: Colors.white, size: 18),
            label: const Text(
              'Ajouter',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openAddContact() async {
    final newContact = await Get.to<Contact>(() => const AddContactPage());
    if (newContact != null) {
      setState(() => _contacts.add(newContact));
    }
  }
}

// ── Header ────────────────────────────────────────────────────────────────────

class _ContactsHeader extends StatelessWidget {
  final int count;
  final ValueChanged<String> onSearch;

  const _ContactsHeader({required this.count, required this.onSearch});

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
        top: MediaQuery.of(context).padding.top + 16,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Iconsax.arrow_left, color: Colors.white, size: 22),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$count membres',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              onChanged: onSearch,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Rechercher un contact…',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.50),
                ),
                prefixIcon: Icon(
                  Iconsax.search_normal,
                  color: Colors.white.withOpacity(0.60),
                  size: 18,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Carte contact ─────────────────────────────────────────────────────────────

class _ContactCard extends StatelessWidget {
  final Contact contact;
  const _ContactCard({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: KShadows.soft,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(contact.avatarUrl),
              backgroundColor: KColors.primary.withOpacity(0.10),
              onBackgroundImageError: (_, __) {},
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: KColors.dark,
                    ),
                  ),
                  const SizedBox(height: 2),
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
            // Actions
            Row(
              children: [
                _ActionBtn(
                  icon: Iconsax.call,
                  color: KColors.success,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _ActionBtn(
                  icon: Iconsax.message,
                  color: KColors.primary,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionBtn(
      {required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: color.withOpacity(0.10),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }
}

class _EmptyContacts extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyContacts({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: KColors.primary.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(Iconsax.people, size: 36, color: KColors.primary),
          ),
          const SizedBox(height: 16),
          const Text(
            'Aucun contact',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: KColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onAdd,
            child: const Text(
              'Ajouter un contact',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: KColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

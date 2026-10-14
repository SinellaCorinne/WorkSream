import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/style.dart';
import 'contacts/contact.dart';
import 'discussion_page.dart';

class Discussion {
  final String title;
  final String lastMessage;
  final String time;
  final bool isOnline;
  final int unread;
  final String avatar;

  Discussion({
    required this.title,
    required this.lastMessage,
    required this.time,
    this.isOnline = false,
    this.unread = 0,
    this.avatar = 'assets/images/Profil.jpg',
  });
}

final List<Discussion> discussions = [
  Discussion(
    title: 'Équipe Design',
    lastMessage: 'La maquette est prête pour review 🎨',
    time: '09:42',
    isOnline: true,
    unread: 3,
    avatar: 'assets/images/groupe.jpg',
  ),
  Discussion(
    title: 'Alice Martin',
    lastMessage: 'J\'ai mis à jour le rapport de sprint',
    time: '08:15',
    isOnline: true,
    unread: 1,
    avatar: 'assets/images/Profil.jpg',
  ),
  Discussion(
    title: 'Projet SIGES',
    lastMessage: 'Réunion de suivi demain à 10h',
    time: 'Hier',
    isOnline: false,
    unread: 0,
    avatar: 'assets/images/managers1.jpg',
  ),
  Discussion(
    title: 'Bob Dupont',
    lastMessage: 'Les tests unitaires passent ✅',
    time: 'Hier',
    isOnline: false,
    unread: 0,
    avatar: 'assets/images/man.png',
  ),
  Discussion(
    title: 'Équipe Dev',
    lastMessage: 'Merge request approuvée 🚀',
    time: 'Lun',
    isOnline: false,
    unread: 0,
    avatar: 'assets/images/managers2.jpg',
  ),
  Discussion(
    title: 'Marketing',
    lastMessage: 'Le brief est dans le drive',
    time: 'Lun',
    isOnline: true,
    unread: 2,
    avatar: 'assets/images/marketing.jpg',
  ),
  Discussion(
    title: 'Chef de projet',
    lastMessage: 'Bien reçu, je valide ce soir',
    time: 'Dim',
    isOnline: false,
    unread: 0,
    avatar: 'assets/images/gestion.jpg',
  ),
  Discussion(
    title: 'Support Tech',
    lastMessage: 'Ticket #402 résolu ✓',
    time: '12/10',
    isOnline: false,
    unread: 0,
    avatar: 'assets/images/setting.png',
  ),
];

class DiscussionListPage extends StatefulWidget {
  const DiscussionListPage({super.key});

  @override
  State<DiscussionListPage> createState() => _DiscussionListPageState();
}

class _DiscussionListPageState extends State<DiscussionListPage> {
  String _search = '';

  List<Discussion> get _filtered => discussions
      .where((d) => d.title.toLowerCase().contains(_search.toLowerCase()) ||
          d.lastMessage.toLowerCase().contains(_search.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      body: Column(
        children: [
          // ── Header ────────────────────────────────────────────────────
          _MessagesHeader(
            totalUnread: discussions.fold(0, (s, d) => s + d.unread),
            onSearch: (v) => setState(() => _search = v),
          ),

          // ── Liste ─────────────────────────────────────────────────────
          Expanded(
            child: _filtered.isEmpty
                ? const _NoResults()
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                    itemCount: _filtered.length,
                    itemBuilder: (_, i) => _DiscussionTile(
                      discussion: _filtered[i],
                      onTap: () => Get.to(
                        () => DiscussionPage(discussion: _filtered[i]),
                      ),
                    ),
                  ),
          ),
        ],
      ),

      // FAB "Nouveau message"
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => const ContactListPage()),
        backgroundColor: KColors.primary,
        elevation: 4,
        icon: const Icon(Iconsax.edit, color: Colors.white, size: 18),
        label: const Text(
          'Nouveau',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ── Header ────────────────────────────────────────────────────────────────────

class _MessagesHeader extends StatelessWidget {
  final int totalUnread;
  final ValueChanged<String> onSearch;
  const _MessagesHeader(
      {required this.totalUnread, required this.onSearch});

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
              const Expanded(
                child: Text(
                  'Messages',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              if (totalUnread > 0)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: KColors.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$totalUnread non lus',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          // Barre de recherche
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
                hintText: 'Rechercher une conversation…',
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

// ── Tuile discussion ──────────────────────────────────────────────────────────

class _DiscussionTile extends StatelessWidget {
  final Discussion discussion;
  final VoidCallback onTap;

  const _DiscussionTile({required this.discussion, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: KShadows.soft,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          child: Row(
            children: [
              // Avatar
              Stack(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage:
                        AssetImage(discussion.avatar),
                    onBackgroundImageError: (_, __) {},
                    backgroundColor: KColors.primary.withOpacity(0.12),
                    child: discussion.avatar.isEmpty
                        ? Text(
                            discussion.title[0],
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              color: KColors.primary,
                            ),
                          )
                        : null,
                  ),
                  if (discussion.isOnline)
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: KColors.success,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),

              // Texte
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      discussion.title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: discussion.unread > 0
                            ? FontWeight.w700
                            : FontWeight.w600,
                        color: KColors.dark,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      discussion.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: discussion.unread > 0
                            ? KColors.dark
                            : KColors.grey,
                        fontWeight: discussion.unread > 0
                            ? FontWeight.w500
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // Temps + badge
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    discussion.time,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      color: discussion.unread > 0
                          ? KColors.primary
                          : KColors.grey,
                      fontWeight: discussion.unread > 0
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (discussion.unread > 0)
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: KColors.primary,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${discussion.unread}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    )
                  else
                    const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoResults extends StatelessWidget {
  const _NoResults();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Aucun résultat',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15,
          color: KColors.grey,
        ),
      ),
    );
  }
}

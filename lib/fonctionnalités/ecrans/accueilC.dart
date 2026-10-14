import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/style.dart';
import '../composants/project_data.dart';
import 'contacts/contacts.dart';

class Accueilc extends StatelessWidget {
  const Accueilc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      body: CustomScrollView(
        slivers: [
          // ── App Bar flottant ───────────────────────────────────────────
          SliverToBoxAdapter(child: _HomeHeader()),

          // ── Stats rapides ──────────────────────────────────────────────
          const SliverToBoxAdapter(child: _StatsRow()),

          // ── Barre de recherche ─────────────────────────────────────────
          const SliverToBoxAdapter(child: _SearchBar()),

          // ── Section "Projets récents" ──────────────────────────────────
          SliverToBoxAdapter(child: _SectionHeader(
            title: 'Projets récents',
            onTap: () {},
          )),

          // ── Liste projets ──────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _ProjectCard(project: projects[i]),
                ),
                childCount: projects.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

// ── Header ──────────────────────────────────────────────────────────────────

class _HomeHeader extends StatelessWidget {
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
        bottom: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar
              GestureDetector(
                onTap: () => Get.to(() => const ContactsListPage()),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: KColors.secondary, width: 2),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Profil.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bonjour, Sinella 👋',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.70),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text(
                      'Que faisons-nous aujourd\'hui ?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Notif
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Iconsax.notification, color: Colors.white, size: 20),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: KColors.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Stats row ────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
      child: Row(
        children: [
          _StatCard(
            icon: Iconsax.task_square,
            value: '${projects.length}',
            label: 'Projets',
            color: KColors.primary,
          ),
          const SizedBox(width: 12),
          _StatCard(
            icon: Iconsax.check,
            value: '${projects.fold<int>(0, (s, p) => s + p.tasks.where((t) => t.isCompleted).length)}',
            label: 'Terminées',
            color: KColors.success,
          ),
          const SizedBox(width: 12),
          _StatCard(
            icon: Iconsax.timer_1,
            value: '${projects.fold<int>(0, (s, p) => s + p.tasks.where((t) => !t.isCompleted).length)}',
            label: 'En cours',
            color: KColors.warning,
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: KShadows.soft,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 16, color: color),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: KColors.dark,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                color: KColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Search bar ───────────────────────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: KShadows.soft,
        ),
        child: TextField(
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: KColors.dark,
          ),
          decoration: InputDecoration(
            hintText: 'Rechercher un projet…',
            hintStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: KColors.grey,
            ),
            prefixIcon: const Icon(Iconsax.search_normal, color: KColors.grey, size: 20),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }
}

// ── Section header ───────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const _SectionHeader({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: KColors.dark,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: KColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Voir tout',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: KColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Project Card ──────────────────────────────────────────────────────────────

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({required this.project});

  static const _projectImages = [
    'assets/images/management.jpg',
    'assets/images/idee.png',
    'assets/images/managers1.jpg',
    'assets/images/groupe.jpg',
    'assets/images/man.png',
    'assets/images/setting.png',
    'assets/images/taches.jpg',
    'assets/images/commerce.jpg',
    'assets/images/marketing.jpg',
    'assets/images/stock.jpg',
    'assets/images/gestion.jpg',
  ];

  static const _tagColors = [
    KColors.primary,
    KColors.secondary,
    KColors.accent,
    KColors.warning,
    KColors.info,
  ];

  static const _tags = [
    'Design', 'Dev', 'Marketing', 'Data', 'UX',
    'Mobile', 'Web', 'IA', 'Cloud', 'DevOps',
  ];

  @override
  Widget build(BuildContext context) {
    final idx = projects.indexOf(project);
    final total = project.tasks.length;
    final done = project.tasks.where((t) => t.isCompleted).length;
    final progress = total == 0 ? 0.0 : done / total;
    final imgPath = _projectImages[idx % _projectImages.length];
    final tagColor = _tagColors[idx % _tagColors.length];
    final tag = _tags[idx % _tags.length];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: KShadows.soft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image bannière
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Stack(
              children: [
                Image.asset(
                  imgPath,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: double.infinity,
                    height: 120,
                    color: tagColor.withOpacity(0.15),
                    child: Icon(Iconsax.task_square, color: tagColor, size: 36),
                  ),
                ),
                // Overlay dégradé
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black.withOpacity(0.35)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                // Badge tag
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Tâches restantes
                Positioned(
                  bottom: 10,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$done/$total tâches',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Infos
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: KColors.dark,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Barre de progression
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: KColors.greyLight,
                          valueColor: AlwaysStoppedAnimation<Color>(tagColor),
                          minHeight: 6,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${(progress * 100).round()}%',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: tagColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/style.dart';
import '../composants/project_data.dart';

class Tachespage extends StatefulWidget {
  const Tachespage({super.key});

  @override
  State<Tachespage> createState() => _TachespageState();
}

class _TachespageState extends State<Tachespage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _expandedIndex = 0;

  static const _filters = ['Tous', 'En cours', 'Terminés'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _filters.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Project> _filtered(int tab) {
    if (tab == 1) {
      return projects
          .where((p) => p.tasks.any((t) => !t.isCompleted))
          .toList();
    } else if (tab == 2) {
      return projects
          .where((p) => p.tasks.every((t) => t.isCompleted))
          .toList();
    }
    return projects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      body: Column(
        children: [
          // ── Header ────────────────────────────────────────────────────
          _TasksHeader(tabController: _tabController, filters: _filters),

          // ── Contenu ───────────────────────────────────────────────────
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(_filters.length, (tabIdx) {
                return AnimatedBuilder(
                  animation: _tabController,
                  builder: (_, __) {
                    final list = _filtered(tabIdx);
                    if (list.isEmpty) return const _EmptyState();
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                      itemCount: list.length,
                      itemBuilder: (_, i) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _ProjectTaskCard(
                          project: list[i],
                          isExpanded: _expandedIndex ==
                              projects.indexOf(list[i]),
                          onToggle: () => setState(() {
                            final realIdx = projects.indexOf(list[i]);
                            _expandedIndex =
                                _expandedIndex == realIdx ? -1 : realIdx;
                          }),
                          onTaskToggle: (task) =>
                              setState(() => task.isCompleted = !task.isCompleted),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Header avec onglets ──────────────────────────────────────────────────────

class _TasksHeader extends StatelessWidget {
  final TabController tabController;
  final List<String> filters;
  const _TasksHeader(
      {required this.tabController, required this.filters});

  @override
  Widget build(BuildContext context) {
    final total = projects.fold<int>(0, (s, p) => s + p.tasks.length);
    final done  = projects.fold<int>(
        0, (s, p) => s + p.tasks.where((t) => t.isCompleted).length);
    final progress = total == 0 ? 0.0 : done / total;

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
          // Titre + icône
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Mes Tâches',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Iconsax.task_square,
                    color: Colors.white, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Progression globale
          Row(
            children: [
              Text(
                '$done/$total tâches terminées',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.70),
                ),
              ),
              const Spacer(),
              Text(
                '${(progress * 100).round()}%',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: KColors.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withOpacity(0.15),
              valueColor:
                  const AlwaysStoppedAnimation<Color>(KColors.secondary),
              minHeight: 8,
            ),
          ),

          const SizedBox(height: 20),

          // Onglets filtres
          Container(
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              labelColor: KColors.primary,
              unselectedLabelColor: Colors.white,
              padding: const EdgeInsets.all(3),
              tabs: filters.map((f) => Tab(text: f)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Carte projet avec tâches extensibles ─────────────────────────────────────

class _ProjectTaskCard extends StatelessWidget {
  final Project project;
  final bool isExpanded;
  final VoidCallback onToggle;
  final ValueChanged<Task> onTaskToggle;

  const _ProjectTaskCard({
    required this.project,
    required this.isExpanded,
    required this.onToggle,
    required this.onTaskToggle,
  });

  @override
  Widget build(BuildContext context) {
    final total = project.tasks.length;
    final done  = project.tasks.where((t) => t.isCompleted).length;
    final progress = total == 0 ? 0.0 : done / total;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: KShadows.soft,
      ),
      child: Column(
        children: [
          // ── En-tête de la carte ──────────────────────────────────────
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Icône statut
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: progress == 1.0
                              ? KColors.success.withOpacity(0.12)
                              : KColors.primary.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          progress == 1.0
                              ? Iconsax.tick_circle
                              : Iconsax.task_square,
                          size: 20,
                          color: progress == 1.0
                              ? KColors.success
                              : KColors.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.title,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: KColors.dark,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$done sur $total tâches',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                color: KColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Badge %
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: progress == 1.0
                              ? KColors.success.withOpacity(0.10)
                              : KColors.primary.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${(progress * 100).round()}%',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: progress == 1.0
                                ? KColors.success
                                : KColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        isExpanded
                            ? Iconsax.arrow_up_2
                            : Iconsax.arrow_down_2,
                        size: 16,
                        color: KColors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: KColors.greyLight,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        progress == 1.0
                            ? KColors.success
                            : KColors.primary,
                      ),
                      minHeight: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Tâches (expandable) ──────────────────────────────────────
          if (isExpanded) ...[
            const Divider(height: 1, color: Color(0xFFE4E9F0)),
            ...project.tasks.asMap().entries.map((entry) {
              final i = entry.key;
              final task = entry.value;
              return _TaskRow(
                task: task,
                index: i,
                onToggle: () => onTaskToggle(task),
                isLast: i == project.tasks.length - 1,
              );
            }),
          ],
        ],
      ),
    );
  }
}

class _TaskRow extends StatelessWidget {
  final Task task;
  final int index;
  final VoidCallback onToggle;
  final bool isLast;

  const _TaskRow({
    required this.task,
    required this.index,
    required this.onToggle,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(
                  bottom: BorderSide(color: Color(0xFFF0F4F8), width: 1),
                ),
          borderRadius: isLast
              ? const BorderRadius.vertical(bottom: Radius.circular(20))
              : null,
        ),
        child: Row(
          children: [
            // Checkbox custom
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: task.isCompleted
                    ? KColors.success
                    : Colors.transparent,
                border: Border.all(
                  color: task.isCompleted
                      ? KColors.success
                      : const Color(0xFFD0D8E4),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: task.isCompleted
                  ? const Icon(Icons.check, size: 13, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            // Numéro
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: KColors.greyLight,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: KColors.grey,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                task.description,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: task.isCompleted
                      ? KColors.grey
                      : KColors.dark,
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : null,
                  decorationColor: KColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

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
            child: const Icon(
              Iconsax.task_square,
              size: 36,
              color: KColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Aucune tâche ici',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: KColors.dark,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Modifiez les filtres pour voir\nd\'autres tâches',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              color: KColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';

class PagesAidePage extends StatefulWidget {
  const PagesAidePage({super.key});

  @override
  State<PagesAidePage> createState() => _PagesAidePageState();
}

class _PagesAidePageState extends State<PagesAidePage> {
  final List<bool> _expanded = List.filled(5, false);
  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  static const _faqs = [
    (
      q: 'Comment créer un nouveau projet ?',
      a: 'Sur la page d\'accueil, faites défiler vers le bas pour voir la liste des projets. Appuyez sur "Voir tout" puis sur le bouton + pour ajouter un projet.',
    ),
    (
      q: 'Comment ajouter des membres à mon équipe ?',
      a: 'Allez dans l\'onglet "Messages", appuyez sur "Nouveau" puis sélectionnez des contacts. Vous pouvez créer un groupe en sélectionnant plusieurs membres.',
    ),
    (
      q: 'Comment marquer une tâche comme terminée ?',
      a: 'Dans l\'onglet "Tâches", développez un projet en appuyant dessus, puis cochez les tâches que vous avez terminées.',
    ),
    (
      q: 'Comment modifier mon profil ?',
      a: 'Allez dans l\'onglet "Profil", appuyez sur l\'icône de modification à côté de votre photo. Vous pouvez changer votre nom et votre photo.',
    ),
    (
      q: 'Comment réinitialiser mon mot de passe ?',
      a: 'Sur la page de connexion, appuyez sur "Mot de passe oublié ?" et suivez les instructions pour réinitialiser votre mot de passe.',
    ),
  ];

  @override
  void dispose() {
    _subjectCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      appBar: AppBar(title: const Text('Aide & Support')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Support card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: KGradients.primaryGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Iconsax.headphone, color: Colors.white, size: 28),
                const SizedBox(height: 12),
                const Text(
                  'Besoin d\'aide ?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Notre équipe est disponible 24h/7j pour vous aider.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.75),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => _showContactDialog(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Contacter le support',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: KColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // FAQ
          const Text(
            'QUESTIONS FRÉQUENTES',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: KColors.grey,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),

          ...List.generate(_faqs.length, (i) {
            final faq = _faqs[i];
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: KShadows.soft,
              ),
              child: InkWell(
                onTap: () => setState(() => _expanded[i] = !_expanded[i]),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              faq.q,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: KColors.dark,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          AnimatedRotation(
                            duration: const Duration(milliseconds: 200),
                            turns: _expanded[i] ? 0.5 : 0,
                            child: const Icon(Iconsax.arrow_down_2,
                                size: 16, color: KColors.grey),
                          ),
                        ],
                      ),
                      if (_expanded[i]) ...[
                        const SizedBox(height: 10),
                        const Divider(color: Color(0xFFEFF2F7), height: 1),
                        const SizedBox(height: 10),
                        Text(
                          faq.a,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: KColors.grey,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _showContactDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poignée
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: KColors.greyLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contacter le support',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: KColors.dark,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _subjectCtrl,
              style: const TextStyle(
                  fontFamily: 'Poppins', fontSize: 14, color: KColors.dark),
              decoration: const InputDecoration(
                labelText: 'Sujet',
                prefixIcon: Icon(Iconsax.tag, size: 18, color: KColors.grey),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _messageCtrl,
              maxLines: 4,
              style: const TextStyle(
                  fontFamily: 'Poppins', fontSize: 14, color: KColors.dark),
              decoration: const InputDecoration(
                labelText: 'Message',
                alignLabelWithHint: true,
                prefixIcon:
                    Icon(Iconsax.message_text, size: 18, color: KColors.grey),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Message envoyé ! Nous vous répondrons sous 24h.',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 13)),
                      backgroundColor: KColors.success,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                },
                child: const Text('Envoyer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

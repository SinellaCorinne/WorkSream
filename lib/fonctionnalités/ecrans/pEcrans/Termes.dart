import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';

class TermesConditionsPage extends StatelessWidget {
  const TermesConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      appBar: AppBar(
        title: const Text('Termes et Conditions'),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.document_download,
                size: 16, color: KColors.primary),
            label: const Text('PDF',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: KColors.primary,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Header card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: KGradients.cardGradient,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Conditions d\'utilisation',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Dernière mise à jour : 12 mars 2025',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.65),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          _Section(
            title: '1. Introduction',
            content:
                'Bienvenue sur WorkStream. En accédant à et en utilisant notre application, vous acceptez d\'être lié par les présentes conditions d\'utilisation. Veuillez les lire attentivement avant d\'utiliser nos services.',
          ),
          _Section(
            title: '2. Définitions',
            content:
                '"Application" désigne WorkStream et tous ses services associés. "Utilisateur" désigne toute personne accédant à l\'application. "Contenu" désigne toutes les informations, données et fichiers partagés via l\'application.',
          ),
          _Section(
            title: '3. Conditions d\'utilisation',
            content:
                'Vous vous engagez à utiliser WorkStream uniquement à des fins légales et conformément aux présentes conditions. Il est interdit de partager du contenu illégal, offensant ou portant atteinte aux droits d\'autrui.',
          ),
          _Section(
            title: '4. Propriété intellectuelle',
            content:
                'Tous les droits de propriété intellectuelle relatifs à WorkStream, y compris les marques, logos et code source, restent la propriété exclusive de l\'équipe WorkStream.',
          ),
          _Section(
            title: '5. Limitation de responsabilité',
            content:
                'WorkStream est fourni "tel quel", sans garantie d\'aucune sorte. Nous ne saurions être tenus responsables des dommages indirects résultant de l\'utilisation ou de l\'impossibilité d\'utiliser l\'application.',
          ),
          _Section(
            title: '6. Modifications',
            content:
                'Nous nous réservons le droit de modifier ces conditions à tout moment. Les modifications prennent effet dès leur publication. Votre utilisation continue de l\'application vaut acceptation des nouvelles conditions.',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String content;
  const _Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: KShadows.soft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: KColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              color: KColors.grey,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

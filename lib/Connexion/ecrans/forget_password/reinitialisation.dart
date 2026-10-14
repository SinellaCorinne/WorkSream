import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import '../inscrire/telephone.dart' show _AuthStepScaffold, _DarkTextField, _GradientButton;
import 'verification.dart';

class Reinitialisation extends StatelessWidget {
  const Reinitialisation({super.key});

  @override
  Widget build(BuildContext context) {
    return _AuthStepScaffold(
      stepIndex: 0,
      title: 'Mot de\npasse oublié ?',
      subtitle: 'Réinitialisation — Renseignez votre identifiant',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entrez votre e-mail ou numéro de téléphone pour recevoir un code de réinitialisation.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              color: Colors.white.withOpacity(0.65),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          const _AuthLabel('E-mail ou téléphone'),
          const SizedBox(height: 8),
          _DarkTextField(
            hint: 'votre@email.com ou +221 77…',
            icon: Iconsax.user,
          ),
          const SizedBox(height: 28),
          _GradientButton(
            label: 'Envoyer le code',
            onTap: () => Get.to(() => const Verification()),
          ),
        ],
      ),
    );
  }
}

class _AuthLabel extends StatelessWidget {
  final String text;
  const _AuthLabel(this.text);
  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
}

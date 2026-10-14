import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import '../../widgets/auth_widgets.dart';
import 'verification.dart';

class Reinitialisation extends StatelessWidget {
  const Reinitialisation({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthStepScaffold(
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
          const AuthLabel('E-mail ou téléphone'),
          const SizedBox(height: 8),
          AuthDarkTextField(
            hint: 'votre@email.com ou +221 77…',
            icon: Iconsax.user,
          ),
          const SizedBox(height: 28),
          AuthGradientButton(
            label: 'Envoyer le code',
            onTap: () => Get.to(() => const Verification()),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import '../../widgets/auth_widgets.dart';
import 'email_verif.dart';

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthStepScaffold(
      stepIndex: 3,
      title: 'Votre\nEmail',
      subtitle: 'Étape 4 sur 5 — Vérification de l\'email',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthLabel('Adresse e-mail'),
          const SizedBox(height: 8),
          AuthDarkTextField(
            hint: 'votre@email.com',
            icon: Iconsax.sms,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          const AuthInfoBox(
            text: 'Un code de confirmation sera envoyé dans votre boîte mail.',
          ),
          const SizedBox(height: 28),
          AuthGradientButton(
            label: 'Envoyer le code',
            onTap: () => Get.to(() => const EmailVerification()),
          ),
        ],
      ),
    );
  }
}

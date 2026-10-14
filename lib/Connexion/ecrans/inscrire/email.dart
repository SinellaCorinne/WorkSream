import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import 'telephone.dart' show _AuthStepScaffold, _DarkTextField, _GradientButton;
import 'email_verif.dart';

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return _AuthStepScaffold(
      stepIndex: 3,
      title: 'Votre\nEmail',
      subtitle: 'Étape 4 sur 5 — Vérification de l\'email',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _AuthLabel('Adresse e-mail'),
          const SizedBox(height: 8),
          _DarkTextField(
            hint: 'votre@email.com',
            icon: Iconsax.sms,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: KColors.secondary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: KColors.secondary.withOpacity(0.25), width: 1),
            ),
            child: Row(
              children: [
                const Icon(Iconsax.info_circle,
                    color: KColors.secondary, size: 16),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Un code de confirmation sera envoyé dans votre boîte mail.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          _GradientButton(
            label: 'Envoyer le code',
            onTap: () => Get.to(() => const EmailVerification()),
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

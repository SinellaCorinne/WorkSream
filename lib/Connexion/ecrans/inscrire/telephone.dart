import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import '../../widgets/auth_widgets.dart';
import '../inscriptionPage.dart';
import 'telephone_verif.dart';

class Phone extends StatelessWidget {
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthStepScaffold(
      stepIndex: 1,
      title: 'Votre\nNuméro',
      subtitle: 'Étape 2 sur 5 — Vérification téléphonique',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthLabel('Numéro de téléphone'),
          const SizedBox(height: 8),
          AuthDarkTextField(
            hint: '+221 77 000 00 00',
            icon: Iconsax.call,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          const AuthInfoBox(
            text: 'Un code de vérification vous sera envoyé par WhatsApp ou SMS.',
          ),
          const SizedBox(height: 28),
          AuthGradientButton(
            label: 'Envoyer le code',
            onTap: () => Get.to(() => const PhoneVerification()),
          ),
        ],
      ),
    );
  }
}

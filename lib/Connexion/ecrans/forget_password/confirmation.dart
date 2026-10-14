import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/style.dart';
import '../../widgets/auth_widgets.dart';
import '../connexionPage.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  Widget build(BuildContext context) {
    return AuthStepScaffold(
      stepIndex: 2,
      title: 'Nouveau\nmot de passe',
      subtitle: 'Réinitialisation — Définissez votre nouveau mot de passe',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthLabel('Nouveau mot de passe'),
          const SizedBox(height: 8),
          AuthPasswordField(
            hint: 'Minimum 8 caractères',
            obscure: _obscure1,
            onToggle: () => setState(() => _obscure1 = !_obscure1),
          ),
          const SizedBox(height: 20),
          const AuthLabel('Confirmer'),
          const SizedBox(height: 8),
          AuthPasswordField(
            hint: 'Répétez votre mot de passe',
            obscure: _obscure2,
            onToggle: () => setState(() => _obscure2 = !_obscure2),
          ),
          const SizedBox(height: 12),
          const AuthStrengthIndicator(),
          const SizedBox(height: 28),
          AuthGradientButton(
            label: 'Réinitialiser',
            onTap: () => Get.offAll(() => const ConnexionPage()),
          ),
        ],
      ),
    );
  }
}

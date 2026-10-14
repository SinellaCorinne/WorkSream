import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/style.dart';
import '../inscrire/telephone.dart' show _AuthStepScaffold, _GradientButton;
import '../inscrire/password_define.dart' show _PasswordField, _StrengthIndicator;
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
    return _AuthStepScaffold(
      stepIndex: 2,
      title: 'Nouveau\nmot de passe',
      subtitle: 'Réinitialisation — Définissez votre nouveau mot de passe',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _AuthLabel('Nouveau mot de passe'),
          const SizedBox(height: 8),
          _PasswordField(
            hint: 'Minimum 8 caractères',
            obscure: _obscure1,
            onToggle: () => setState(() => _obscure1 = !_obscure1),
          ),

          const SizedBox(height: 20),

          const _AuthLabel('Confirmer'),
          const SizedBox(height: 8),
          _PasswordField(
            hint: 'Répétez votre mot de passe',
            obscure: _obscure2,
            onToggle: () => setState(() => _obscure2 = !_obscure2),
          ),

          const SizedBox(height: 12),
          _StrengthIndicator(),
          const SizedBox(height: 28),

          _GradientButton(
            label: 'Réinitialiser',
            onTap: () => Get.offAll(() => const ConnexionPage()),
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

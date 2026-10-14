import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/style.dart';
import '../../widgets/auth_widgets.dart';
import '../welcomePage.dart';

class PasswordDefine extends StatefulWidget {
  const PasswordDefine({super.key});

  @override
  State<PasswordDefine> createState() => _PasswordDefineState();
}

class _PasswordDefineState extends State<PasswordDefine> {
  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  Widget build(BuildContext context) {
    return AuthStepScaffold(
      stepIndex: 4,
      title: 'Mot de\npasse',
      subtitle: 'Étape 5 sur 5 — Définissez votre mot de passe',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthLabel('Choisir un mot de passe'),
          const SizedBox(height: 8),
          AuthPasswordField(
            hint: 'Minimum 8 caractères',
            obscure: _obscure1,
            onToggle: () => setState(() => _obscure1 = !_obscure1),
          ),
          const SizedBox(height: 20),
          const AuthLabel('Confirmer le mot de passe'),
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
            label: 'Créer mon compte',
            onTap: () => Get.offAll(() => const Welcomepage()),
          ),
        ],
      ),
    );
  }
}

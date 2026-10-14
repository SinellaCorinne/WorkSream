import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import 'telephone.dart' show _AuthStepScaffold, _GradientButton;
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
    return _AuthStepScaffold(
      stepIndex: 4,
      title: 'Mot de\npasse',
      subtitle: 'Étape 5 sur 5 — Définissez votre mot de passe',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _AuthLabel('Choisir un mot de passe'),
          const SizedBox(height: 8),
          _PasswordField(
            hint: 'Minimum 8 caractères',
            obscure: _obscure1,
            onToggle: () => setState(() => _obscure1 = !_obscure1),
          ),

          const SizedBox(height: 20),

          const _AuthLabel('Confirmer le mot de passe'),
          const SizedBox(height: 8),
          _PasswordField(
            hint: 'Répétez votre mot de passe',
            obscure: _obscure2,
            onToggle: () => setState(() => _obscure2 = !_obscure2),
          ),

          const SizedBox(height: 12),

          // Indicateur force (décoratif)
          _StrengthIndicator(),

          const SizedBox(height: 28),
          _GradientButton(
            label: 'Créer mon compte',
            onTap: () => Get.offAll(() => const Welcomepage()),
          ),
        ],
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final VoidCallback onToggle;

  const _PasswordField(
      {required this.hint, required this.obscure, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white.withOpacity(0.35),
          fontSize: 14,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.08),
        prefixIcon: Icon(Iconsax.lock,
            color: Colors.white.withOpacity(0.50), size: 20),
        suffixIcon: GestureDetector(
          onTap: onToggle,
          child: Icon(
            obscure ? Iconsax.eye_slash : Iconsax.eye,
            color: Colors.white.withOpacity(0.50),
            size: 20,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: Colors.white.withOpacity(0.12), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: Colors.white.withOpacity(0.12), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: KColors.secondary, width: 1.5),
        ),
      ),
    );
  }
}

class _StrengthIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.white.withOpacity(0.10),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(KColors.warning),
                  minHeight: 5,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Moyen',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                color: Colors.white.withOpacity(0.60),
              ),
            ),
          ],
        ),
      ],
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import '../inscriptionPage.dart';
import 'telephone_verif.dart';

class Phone extends StatelessWidget {
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return _AuthStepScaffold(
      stepIndex: 1,
      title: 'Votre\nNuméro',
      subtitle: 'Étape 2 sur 5 — Vérification téléphonique',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _AuthLabel('Numéro de téléphone'),
          const SizedBox(height: 8),
          _DarkTextField(
            hint: '+221 77 000 00 00',
            icon: Iconsax.call,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          _InfoBox(
            text: 'Un code de vérification vous sera envoyé par WhatsApp ou SMS.',
          ),
          const SizedBox(height: 28),
          _GradientButton(
            label: 'Envoyer le code',
            onTap: () => Get.to(() => const PhoneVerification()),
          ),
        ],
      ),
    );
  }
}

// ── Scaffold commun pour toutes les étapes ────────────────────────────────────

class _AuthStepScaffold extends StatelessWidget {
  final int stepIndex;
  final String title;
  final String subtitle;
  final Widget child;

  const _AuthStepScaffold({
    required this.stepIndex,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.dark,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -80,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: KColors.secondary.withOpacity(0.15),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Iconsax.arrow_left,
                          color: Colors.white, size: 20),
                    ),
                  ),
                  const SizedBox(height: 36),
                  _StepIndicator(current: stepIndex, total: 5),
                  const SizedBox(height: 28),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.2,
                      letterSpacing: -0.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.55),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.12), width: 1),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: child,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String text;
  const _InfoBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Réexporter les widgets communs pour les étapes suivantes
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

class _DarkTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextInputType? keyboardType;

  const _DarkTextField({
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      keyboardType: keyboardType,
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
        prefixIcon:
            Icon(icon, color: Colors.white.withOpacity(0.50), size: 20),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.white.withOpacity(0.12), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.white.withOpacity(0.12), width: 1),
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

class _GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _GradientButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          gradient: KGradients.primaryGradient,
          borderRadius: BorderRadius.circular(14),
          boxShadow: KShadows.primary,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Iconsax.arrow_right_3,
                color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}

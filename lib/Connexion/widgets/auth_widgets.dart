/// Widgets partagés entre tous les écrans d'authentification.
/// Noms publics (sans underscore) pour pouvoir être importés.
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/style.dart';

// ── Step indicator ─────────────────────────────────────────────────────────

class AuthStepIndicator extends StatelessWidget {
  final int current;
  final int total;
  const AuthStepIndicator({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (i) {
        final done   = i < current;
        final active = i == current;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i < total - 1 ? 6 : 0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              decoration: BoxDecoration(
                color: done
                    ? KColors.secondary
                    : active
                        ? Colors.white
                        : Colors.white.withOpacity(0.20),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// ── Scaffold commun ────────────────────────────────────────────────────────

class AuthStepScaffold extends StatelessWidget {
  final int stepIndex;
  final String title;
  final String subtitle;
  final Widget child;

  const AuthStepScaffold({
    super.key,
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
                  AuthStepIndicator(current: stepIndex, total: 5),
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

// ── Label ──────────────────────────────────────────────────────────────────

class AuthLabel extends StatelessWidget {
  final String text;
  const AuthLabel(this.text, {super.key});

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

// ── Input sombre ───────────────────────────────────────────────────────────

class AuthDarkTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextInputType? keyboardType;

  const AuthDarkTextField({
    super.key,
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
          fontFamily: 'Poppins', color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white.withOpacity(0.35),
            fontSize: 14),
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

// ── Password field ─────────────────────────────────────────────────────────

class AuthPasswordField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final VoidCallback onToggle;

  const AuthPasswordField({
    super.key,
    required this.hint,
    required this.obscure,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(
          fontFamily: 'Poppins', color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white.withOpacity(0.35),
            fontSize: 14),
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

// ── Gradient button ────────────────────────────────────────────────────────

class AuthGradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AuthGradientButton(
      {super.key, required this.label, required this.onTap});

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

// ── OTP box ────────────────────────────────────────────────────────────────

class AuthOtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const AuthOtpBox({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 64,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white.withOpacity(0.10),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
                color: Colors.white.withOpacity(0.15), width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
                color: Colors.white.withOpacity(0.15), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide:
                const BorderSide(color: KColors.secondary, width: 2),
          ),
        ),
      ),
    );
  }
}

// ── Resend row ─────────────────────────────────────────────────────────────

class AuthResendRow extends StatelessWidget {
  const AuthResendRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontFamily: 'Poppins', fontSize: 13),
            children: [
              TextSpan(
                text: 'Pas reçu le code ? ',
                style:
                    TextStyle(color: Colors.white.withOpacity(0.55)),
              ),
              const TextSpan(
                text: 'Renvoyer',
                style: TextStyle(
                    color: KColors.secondary,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Strength indicator ─────────────────────────────────────────────────────

class AuthStrengthIndicator extends StatelessWidget {
  const AuthStrengthIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

// ── Info box ───────────────────────────────────────────────────────────────

class AuthInfoBox extends StatelessWidget {
  final String text;
  const AuthInfoBox({super.key, required this.text});

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

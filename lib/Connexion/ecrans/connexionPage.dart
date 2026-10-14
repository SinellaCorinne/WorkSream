import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:management/Connexion/ecrans/forget_password/reinitialisation.dart';
import 'package:management/Connexion/ecrans/inscriptionPage.dart';
import 'package:management/Connexion/ecrans/welcomePage.dart';
import '../../theme/style.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage>
    with SingleTickerProviderStateMixin {
  bool _obscurePassword = true;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: KColors.dark,
      body: Stack(
        children: [
          // ── Background décoratif ──────────────────────────────────────
          Positioned(
            top: -size.height * 0.12,
            right: -size.width * 0.25,
            child: _Circle(size: size.width * 0.8, color: KColors.primary.withOpacity(0.25)),
          ),
          Positioned(
            bottom: -size.height * 0.08,
            left: -size.width * 0.2,
            child: _Circle(size: size.width * 0.65, color: KColors.secondary.withOpacity(0.18)),
          ),
          Positioned(
            top: size.height * 0.35,
            left: -size.width * 0.15,
            child: _Circle(size: size.width * 0.4, color: KColors.accent.withOpacity(0.15)),
          ),

          // ── Contenu ───────────────────────────────────────────────────
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 48),

                      // Logo + Brand
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              gradient: KGradients.primaryGradient,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: KShadows.primary,
                            ),
                            child: const Icon(Iconsax.task_square, color: Colors.white, size: 22),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'WorkStream',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 52),

                      // Headline
                      const Text(
                        'Bon retour\nparmi nous 👋',
                        style: TextStyle(
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
                        'Connectez-vous à votre espace de travail',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.60),
                        ),
                      ),

                      const SizedBox(height: 44),

                      // ── Carte formulaire ─────────────────────────────
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.12),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Email / Username
                            _AuthLabel('Identifiant'),
                            const SizedBox(height: 8),
                            _DarkInput(
                              hint: 'votre@email.com',
                              prefixIcon: Iconsax.user,
                              keyboardType: TextInputType.emailAddress,
                            ),

                            const SizedBox(height: 20),

                            // Password
                            _AuthLabel('Mot de passe'),
                            const SizedBox(height: 8),
                            _DarkInput(
                              hint: '••••••••',
                              prefixIcon: Iconsax.lock,
                              obscure: _obscurePassword,
                              suffixIcon: _obscurePassword
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                              onSuffixTap: () => setState(
                                  () => _obscurePassword = !_obscurePassword),
                            ),

                            const SizedBox(height: 12),

                            // Mot de passe oublié
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () => Get.to(() => const Reinitialisation()),
                                child: Text(
                                  'Mot de passe oublié ?',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: KColors.secondary,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 28),

                            // Bouton connexion
                            _GradientButton(
                              label: 'Se connecter',
                              onTap: () => Get.to(() => const Welcomepage()),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // ── Séparateur ────────────────────────────────────
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.white.withOpacity(0.15))),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'ou',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white.withOpacity(0.45),
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.white.withOpacity(0.15))),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // Bouton inscription
                      _OutlineButton(
                        label: "Créer un compte",
                        onTap: () => Get.to(() => const Inscriptionpage()),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Widgets locaux ─────────────────────────────────────────────────────────

class _Circle extends StatelessWidget {
  final double size;
  final Color color;
  const _Circle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      );
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

class _DarkInput extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final bool obscure;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextInputType? keyboardType;

  const _DarkInput({
    required this.hint,
    required this.prefixIcon,
    this.obscure = false,
    this.suffixIcon,
    this.onSuffixTap,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        prefixIcon: Icon(prefixIcon, color: Colors.white.withOpacity(0.50), size: 20),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Icon(suffixIcon, color: Colors.white.withOpacity(0.50), size: 20),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.12), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.12), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: KColors.secondary, width: 1.5),
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
        child: const Text(
          'Se connecter',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Colors.white,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _OutlineButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

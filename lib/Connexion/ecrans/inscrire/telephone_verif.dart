import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import 'telephone.dart' show _AuthStepScaffold, _GradientButton;
import 'email.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final List<TextEditingController> _ctrls =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _nodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _ctrls) c.dispose();
    for (final n in _nodes) n.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AuthStepScaffold(
      stepIndex: 2,
      title: 'Code de\nvérification',
      subtitle: 'Étape 3 sur 5 — Code reçu par WhatsApp/SMS',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entrez le code à 4 chiffres envoyé au\n+221 77 *** **00',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              color: Colors.white.withOpacity(0.65),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 28),

          // OTP inputs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (i) => _OtpBox(
              controller: _ctrls[i],
              focusNode: _nodes[i],
              onChanged: (v) {
                if (v.length == 1 && i < 3) {
                  _nodes[i + 1].requestFocus();
                } else if (v.isEmpty && i > 0) {
                  _nodes[i - 1].requestFocus();
                }
              },
            )),
          ),

          const SizedBox(height: 20),

          // Renvoyer
          Center(
            child: GestureDetector(
              onTap: () {},
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 13),
                  children: [
                    TextSpan(
                      text: 'Pas reçu le code ? ',
                      style: TextStyle(color: Colors.white.withOpacity(0.55)),
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
          ),

          const SizedBox(height: 28),
          _GradientButton(
            label: 'Vérifier',
            onTap: () => Get.to(() => const Email()),
          ),
        ],
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const _OtpBox({
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

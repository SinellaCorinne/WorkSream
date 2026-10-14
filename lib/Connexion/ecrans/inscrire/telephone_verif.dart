import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/style.dart';
import '../../widgets/auth_widgets.dart';
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
    return AuthStepScaffold(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (i) => AuthOtpBox(
                controller: _ctrls[i],
                focusNode: _nodes[i],
                onChanged: (v) {
                  if (v.length == 1 && i < 3) {
                    _nodes[i + 1].requestFocus();
                  } else if (v.isEmpty && i > 0) {
                    _nodes[i - 1].requestFocus();
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const AuthResendRow(),
          const SizedBox(height: 28),
          AuthGradientButton(
            label: 'Vérifier',
            onTap: () => Get.to(() => const Email()),
          ),
        ],
      ),
    );
  }
}

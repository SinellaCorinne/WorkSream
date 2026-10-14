import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/style.dart';
import '../../widgets/auth_widgets.dart';
import 'password_define.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
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
      stepIndex: 3,
      title: 'Code\ne-mail',
      subtitle: 'Étape 4 sur 5 — Code reçu par e-mail',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entrez le code à 4 chiffres envoyé à\nvotre@email.com',
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
            onTap: () => Get.to(() => const PasswordDefine()),
          ),
        ],
      ),
    );
  }
}

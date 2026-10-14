import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/style.dart';
import 'contact.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _nameCtrl = TextEditingController();
  final _roleCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _roleCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final contact = Contact(
        name: _nameCtrl.text.trim(),
        avatarUrl: 'assets/images/Profil.jpg',
        role: _roleCtrl.text.trim().isEmpty ? 'Membre' : _roleCtrl.text.trim(),
      );
      Navigator.pop(context, contact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      appBar: AppBar(
        title: const Text('Ajouter un contact'),
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar placeholder
              Center(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: KColors.primary.withOpacity(0.10),
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: KColors.primary.withOpacity(0.30), width: 2),
                  ),
                  child: const Icon(Iconsax.user, size: 40, color: KColors.primary),
                ),
              ),
              const SizedBox(height: 32),

              _Label('Nom complet'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameCtrl,
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: KColors.dark,
                ),
                decoration: const InputDecoration(
                  hintText: 'Ex: Alice Martin',
                  prefixIcon: Icon(Iconsax.user, size: 18, color: KColors.grey),
                ),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Nom requis' : null,
              ),

              const SizedBox(height: 20),

              _Label('Rôle / Poste'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _roleCtrl,
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: KColors.dark,
                ),
                decoration: const InputDecoration(
                  hintText: 'Ex: Développeur, Designer…',
                  prefixIcon: Icon(Iconsax.briefcase, size: 18, color: KColors.grey),
                ),
              ),

              const SizedBox(height: 40),

              // Bouton
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Ajouter le contact'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: KColors.dark,
      ),
    );
  }
}

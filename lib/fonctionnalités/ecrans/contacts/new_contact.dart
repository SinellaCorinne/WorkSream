import 'package:flutter/material.dart';

import '../../../commons/K_Input.dart';
import '../../../commons/kelevated_button.dart';
import '../../../theme/style.dart';
import 'contact.dart';
 // Assurez-vous que le chemin est correct

class AddContactPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _avatarUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Contact', style: KTypography.h4(context, color: KColors.primary)),
        backgroundColor: KColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            KInput(name: "Nom", controller: _nameController),
            SizedBox(height: 20),
            KInput(name: "URL de l'avatar", controller: _avatarUrlController),
            SizedBox(height: 20),
            KElevatedButton(
              child: Text("Ajouter"),
              onPressed: () {
                final newContact = Contact(
                  name: _nameController.text,
                  avatarUrl: _avatarUrlController.text,
                );
                Navigator.pop(context, newContact);
              },
              backgroundColor: KColors.primary,
              borderColor: KColors.primary,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

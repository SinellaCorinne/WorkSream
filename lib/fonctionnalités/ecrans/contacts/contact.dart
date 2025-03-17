import 'package:flutter/material.dart';

import '../../../theme/style.dart';
import 'messagePage.dart';


class Contact {
  final String name;
  final String avatarUrl;

  Contact({required this.name, required this.avatarUrl});
}

class ContactListPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    // Ajoutez d'autres contacts ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts', style: KTypography.h4(context, color: KColors.primary)),
        backgroundColor: KColors.primary,
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            var contact = contacts[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: KColors.secondary.withOpacity(0.1), // Utilisez une couleur secondaire avec opacité
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(contact.avatarUrl),
                ),
                title: Text(contact.name, style: KTypography.h5(context, color: KColors.secondary)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discussion1Page(contact: contact)),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

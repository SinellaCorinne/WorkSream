import 'package:flutter/material.dart';
 // Assurez-vous que le chemin est correct
import '../../../theme/style.dart';

import 'contact.dart';
import 'groupe.dart';
import 'new_contact.dart';



class ContactsListPage extends StatefulWidget {
  @override
  _ContactsListPageState createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  final List<Contact> _contacts = [
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
     Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
     Contact(name: "Alice", avatarUrl: "assets/images/profil.jpg"),
    Contact(name: "Bob", avatarUrl: "assets/images/profil.jpg"),
    // Ajoutez d'autres contacts ici
  ];

  void _addContact(Contact contact) {
    setState(() {
      _contacts.add(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts', style: KTypography.h4(context, color: KColors.primary)),
        backgroundColor: KColors.primary,
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            var contact = _contacts[index];
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
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () async {
              final newContact = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContactPage()),
              );
              if (newContact != null) {
                _addContact(newContact);
              }
            },
            child: Icon(Icons.add),
            backgroundColor: KColors.tertiary,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectContactsPage(contacts:_contacts,)),
              );
            },
            child: Icon(Icons.group_add),
            backgroundColor: KColors.secondary,
          ),
        ],
      ),

    );
  }
}

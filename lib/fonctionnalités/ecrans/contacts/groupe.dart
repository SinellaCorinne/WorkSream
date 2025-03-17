import 'package:flutter/material.dart';
// Assurez-vous que le chemin est correct
import 'package:management/fonctionnalit%C3%A9s/ecrans/contacts/message_groupe.dart';
import 'package:management/fonctionnalit%C3%A9s/ecrans/discussion_page.dart';
import '../../../theme/style.dart';

import 'contact.dart';


class SelectContactsPage extends StatefulWidget {
  final List<Contact> contacts;

  SelectContactsPage({required this.contacts});

  @override
  _SelectContactsPageState createState() => _SelectContactsPageState();
}

class _SelectContactsPageState extends State<SelectContactsPage> {
  final List<Contact> _selectedContacts = [];

  void _toggleSelection(Contact contact) {
    setState(() {
      if (_selectedContacts.contains(contact)) {
        _selectedContacts.remove(contact);
      } else {
        _selectedContacts.add(contact);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélectionner des Contacts', style: KTypography.h4(context, color: KColors.primary)),
        backgroundColor: KColors.primary,
      ),
      body: ListView.builder(
        itemCount: widget.contacts.length,
        itemBuilder: (context, index) {
          var contact = widget.contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(contact.avatarUrl),
            ),
            title: Text(contact.name, style: KTypography.h5(context, color: KColors.secondary)),
            trailing: Checkbox(
              value: _selectedContacts.contains(contact),
              onChanged: (_) => _toggleSelection(contact),
            ),
            onTap: () => _toggleSelection(contact),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedContacts.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Discussion2Page(contacts: _selectedContacts)),
            );
          }
        },
        child: Icon(Icons.arrow_forward),
        backgroundColor: KColors.tertiary,
      ),
    );
  }
}

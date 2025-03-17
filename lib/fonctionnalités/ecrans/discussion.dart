import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/style.dart';
import '../../commons/k_header.dart';
import 'contacts/contact.dart';
import 'discussion_page.dart'; // Importez le fichier de la page de discussion individuelle

class Discussion {
  final String title;
  final String lastMessage;
  final String time;

  Discussion({required this.title, required this.lastMessage, required this.time});
}

class DiscussionListPage extends StatelessWidget {
  final List<Discussion> discussions = [
    Discussion(title: "Groupe de Projet", lastMessage: "Bonjour tout le monde!", time: "10:30 AM"),
    Discussion(title: "Amis", lastMessage: "On se retrouve où?", time: "09:45 AM"),
    Discussion(title: "Famille", lastMessage: "Comment ça va?", time: "08:20 AM"),Discussion(title: "Groupe de Projet", lastMessage: "Bonjour tout le monde!", time: "10:30 AM"),
    Discussion(title: "Amis", lastMessage: "On se retrouve où?", time: "09:45 AM"),
    Discussion(title: "Famille", lastMessage: "Comment ça va?", time: "08:20 AM"),Discussion(title: "Groupe de Projet", lastMessage: "Bonjour tout le monde!", time: "10:30 AM"),
    Discussion(title: "Amis", lastMessage: "On se retrouve où?", time: "09:45 AM"),
    Discussion(title: "Famille", lastMessage: "Comment ça va?", time: "08:20 AM"),Discussion(title: "Groupe de Projet", lastMessage: "Bonjour tout le monde!", time: "10:30 AM"),
    Discussion(title: "Amis", lastMessage: "On se retrouve où?", time: "09:45 AM"),
    Discussion(title: "Famille", lastMessage: "Comment ça va?", time: "08:20 AM"),Discussion(title: "Groupe de Projet", lastMessage: "Bonjour tout le monde!", time: "10:30 AM"),
    Discussion(title: "Amis", lastMessage: "On se retrouve où?", time: "09:45 AM"),
    Discussion(title: "Famille", lastMessage: "Comment ça va?", time: "08:20 AM"),Discussion(title: "Groupe de Projet", lastMessage: "Bonjour tout le monde!", time: "10:30 AM"),
    Discussion(title: "Amis", lastMessage: "On se retrouve où?", time: "09:45 AM"),
    Discussion(title: "Famille", lastMessage: "Comment ça va?", time: "08:20 AM"),Discussion(title: "Groupe de Projet", lastMessage: "Bonjour tout le monde!", time: "10:30 AM"),
    Discussion(title: "Amis", lastMessage: "On se retrouve où?", time: "09:45 AM"),
    Discussion(title: "Famille", lastMessage: "Comment ça va?", time: "08:20 AM"),Discussion(title: "Groupe de Projet", lastMessage: "Bonjour tout le monde!", time: "10:30 AM"),
    Discussion(title: "Amis", lastMessage: "On se retrouve où?", time: "09:45 AM"),
    Discussion(title: "Famille", lastMessage: "Comment ça va?", time: "08:20 AM"),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussions', style: KTypography.h4(context, color: KColors.primary)),
        backgroundColor: KColors.primary,
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: discussions.length,
              itemBuilder: (context, index) {
                var discussion = discussions[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: KColors.secondary.withOpacity(0.1), // Utilisez une couleur secondaire avec opacité
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(discussion.title, style: KTypography.h5(context, color: KColors.secondary)),
                    subtitle: Text(discussion.lastMessage),
                    trailing: Text(discussion.time),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DiscussionPage(discussion: discussion)),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactListPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
      ),

    );
  }
}

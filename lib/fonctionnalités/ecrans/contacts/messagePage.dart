import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;

import '../../../theme/style.dart';

import '../../../commons/K_Input.dart';
import '../../../commons/kelevated_button.dart';

import '../discussion.dart';
import 'contact.dart';

// Modèle représentant un message dans la discussion
class ChatMessage {
  final String content;
  final DateTime timestamp;
  final bool isFile;
  final String? filePath;
  final String sender; // Ajout du nom de l'expéditeur

  ChatMessage({
    required this.content,
    required this.timestamp,
    required this.sender,
    this.isFile = false,
    this.filePath
  });
}

// Page de discussion avec état
class Discussion1Page extends StatefulWidget {
  final Discussion? discussion;
  final Contact? contact;

  const Discussion1Page({
    Key? key,
    this.discussion,
    this.contact,
  }) : super(key: key);

  @override
  _Discussion1PageState createState() => _Discussion1PageState();
}

class _Discussion1PageState extends State<Discussion1Page> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  File? _selectedFile;
  List<ChatMessage> _messages = [];
  String? _backgroundImage;

  String _currentUser = "Moi"; // Nom de l'utilisateur actuel
  bool isNewMessage = false;

  @override
  void initState() {
    super.initState();
    // Vérifier si c'est un nouveau message ou une discussion existante
    isNewMessage = widget.contact != null && widget.discussion == null;
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Sélectionner un fichier depuis le système de fichiers
  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de la sélection du fichier: $e")),
      );
    }
  }

  // Envoyer un message ou un fichier
  void _sendMessage() {
    String messageText = _messageController.text.trim();

    if (messageText.isNotEmpty || _selectedFile != null) {
      setState(() {
        if (_selectedFile != null) {
          _messages.add(ChatMessage(
              content: path.basename(_selectedFile!.path),
              timestamp: DateTime.now(),
              sender: _currentUser,
              isFile: true,
              filePath: _selectedFile!.path));
        }
        if (messageText.isNotEmpty) {
          _messages.add(ChatMessage(
              content: messageText,
              timestamp: DateTime.now(),
              sender: _currentUser));
        }
        _messageController.clear();
        _selectedFile = null;

        // Si c'était un nouveau message, convertir en discussion normale après envoi
        if (isNewMessage) {
          isNewMessage = false;
        }
      });

      // Scroll to the bottom after sending a message
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0, // Because the list is reversed
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  // Changer l'image d'arrière-plan
  void _changeBackgroundImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _backgroundImage = result.files.single.path;
      });
    }
  }

  // Construire une bulle de message (texte ou fichier)
  Widget _buildMessageBubble(ChatMessage message) {
    bool isCurrentUser = message.sender == _currentUser;

    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isFile ? Colors.blue[50] : (isCurrentUser ? KColors.primary.withOpacity(0.1) : Colors.grey[300]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.sender,
              style: TextStyle(fontWeight: FontWeight.bold, color: isCurrentUser ? KColors.primary : Colors.black87),
            ),
            const SizedBox(height: 4),
            message.isFile
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Iconsax.document, size: 40, color: Colors.blue),
                Text(
                  message.content,
                  style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
                : Text(
              message.content,
              style: const TextStyle(color: Colors.black87),
              softWrap: true,
            ),
            const SizedBox(height: 4),
            Text(
              '${message.timestamp.hour.toString().padLeft(2, '0')}:${message.timestamp.minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 10, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  // Construire l'interface de nouveau message
  Widget _buildNewMessageUI() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'À: ${widget.contact!.name}',
              style: KTypography.h5(context, color: KColors.secondary)
          ),
          SizedBox(height: 20),
          KInput(
            name: "Message",
            controller: _messageController,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                icon: const Icon(Iconsax.paperclip),
                onPressed: _pickFile,
                color: KColors.primary,
              ),
              SizedBox(width: 10),
              Expanded(
                child: KElevatedButton(
                  child: Text("Envoyer"),
                  onPressed: _sendMessage,
                ),
              ),
            ],
          ),
          if (_selectedFile != null)
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Iconsax.document),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      path.basename(_selectedFile!.path),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => setState(() => _selectedFile = null),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Construire l'interface utilisateur principale
  @override
  Widget build(BuildContext context) {
    // Titre de l'app bar en fonction du contexte
    String appBarTitle = isNewMessage
        ? 'Nouveau Message'
        : (widget.discussion?.title ?? widget.contact?.name ?? 'Discussion');

    return Scaffold(
      appBar: AppBar(
        title: Text(
            appBarTitle,
            style: KTypography.h4(context, color: Colors.white)
        ),
        backgroundColor: KColors.primary,
        actions: [
          if (!isNewMessage)
            IconButton(
              icon: const Icon(Iconsax.gallery),
              onPressed: _changeBackgroundImage,
            ),
        ],
      ),
      body: Stack(
        children: [
          // Background image with opacity
          if (_backgroundImage != null && !isNewMessage)
            Positioned.fill(
              child: Opacity(
                opacity: 0.3, // Adjust opacity for better readability
                child: Image.file(
                  File(_backgroundImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),

          // Conditional UI based on whether it's a new message or existing discussion
          isNewMessage
              ? _buildNewMessageUI()
              : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) => _buildMessageBubble(_messages[_messages.length - 1 - index]),
                ),
              ),
              if (_selectedFile != null)
                Container(
                  color: Colors.grey[200],
                  child: ListTile(
                    leading: const Icon(Iconsax.document),
                    title: Text(
                      path.basename(_selectedFile!.path),
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => setState(() => _selectedFile = null),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Iconsax.paperclip),
                      onPressed: _pickFile,
                      color: KColors.primary,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Envoyer un message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: KColors.primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: KColors.primary, width: 2),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Iconsax.send),
                      onPressed: _sendMessage,
                      color: KColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
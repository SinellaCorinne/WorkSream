import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import '../../theme/style.dart';
import 'discussion.dart';

class ChatMessage {
  final String content;
  final DateTime timestamp;
  final bool isFile;
  final String? filePath;
  final bool isMe;

  ChatMessage({
    required this.content,
    required this.timestamp,
    required this.isMe,
    this.isFile = false,
    this.filePath,
  });
}

class DiscussionPage extends StatefulWidget {
  final Discussion discussion;
  const DiscussionPage({super.key, required this.discussion});

  @override
  State<DiscussionPage> createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  final TextEditingController _msgCtrl = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();
  File? _selectedFile;

  // Messages démo
  late List<ChatMessage> _messages = [
    ChatMessage(
      content: 'Salut ! Comment avance le projet ?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 35)),
      isMe: false,
    ),
    ChatMessage(
      content: 'Ça avance bien ! La maquette est quasi terminée 🎨',
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      isMe: true,
    ),
    ChatMessage(
      content: 'Super ! Tu peux me partager une preview ?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 28)),
      isMe: false,
    ),
    ChatMessage(
      content: 'Oui je t\'envoie ça tout de suite',
      timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
      isMe: true,
    ),
    ChatMessage(
      content: 'On a une réunion de review demain à 10h, ça te va ?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      isMe: false,
    ),
  ];

  @override
  void dispose() {
    _msgCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      setState(() => _selectedFile = File(result.files.single.path!));
    }
  }

  void _sendMessage() {
    final text = _msgCtrl.text.trim();
    if (text.isEmpty && _selectedFile == null) return;

    setState(() {
      if (_selectedFile != null) {
        _messages.add(ChatMessage(
          content: p.basename(_selectedFile!.path),
          timestamp: DateTime.now(),
          isMe: true,
          isFile: true,
          filePath: _selectedFile!.path,
        ));
        _selectedFile = null;
      }
      if (text.isNotEmpty) {
        _messages.add(ChatMessage(
          content: text,
          timestamp: DateTime.now(),
          isMe: true,
        ));
      }
      _msgCtrl.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greyLight,
      appBar: _ChatAppBar(discussion: widget.discussion),
      body: Column(
        children: [
          // ── Messages ────────────────────────────────────────────────
          Expanded(
            child: ListView.builder(
              controller: _scrollCtrl,
              reverse: true,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final msg = _messages[_messages.length - 1 - i];
                final showDate = i == _messages.length - 1 ||
                    _messages[_messages.length - 1 - i - 1].timestamp.day !=
                        msg.timestamp.day;
                return Column(
                  children: [
                    if (showDate) _DateDivider(date: msg.timestamp),
                    _MessageBubble(
                        message: msg, formatTime: _formatTime),
                  ],
                );
              },
            ),
          ),

          // ── Aperçu fichier sélectionné ───────────────────────────────
          if (_selectedFile != null)
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 4),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: KColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: KColors.primary.withOpacity(0.20), width: 1),
              ),
              child: Row(
                children: [
                  const Icon(Iconsax.document, color: KColors.primary, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      p.basename(_selectedFile!.path),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: KColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _selectedFile = null),
                    child: const Icon(Icons.close, size: 16, color: KColors.grey),
                  ),
                ],
              ),
            ),

          // ── Input zone ───────────────────────────────────────────────
          _InputBar(
            controller: _msgCtrl,
            onAttach: _pickFile,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}

// ── AppBar ────────────────────────────────────────────────────────────────────

class _ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Discussion discussion;
  const _ChatAppBar({required this.discussion});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: KGradients.cardGradient,
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 4,
        right: 16,
      ),
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Iconsax.arrow_left, color: Colors.white, size: 22),
              onPressed: () => Navigator.pop(context),
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(discussion.avatar),
                  backgroundColor: KColors.primary.withOpacity(0.2),
                ),
                if (discussion.isOnline)
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: KColors.success,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discussion.title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    discussion.isOnline ? 'En ligne' : 'Hors ligne',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      color: discussion.isOnline
                          ? KColors.secondary
                          : Colors.white.withOpacity(0.50),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Iconsax.call, color: Colors.white, size: 20),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Iconsax.video, color: Colors.white, size: 20),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ── Date divider ──────────────────────────────────────────────────────────────

class _DateDivider extends StatelessWidget {
  final DateTime date;
  const _DateDivider({required this.date});

  String _label() {
    final now = DateTime.now();
    if (date.day == now.day) return "Aujourd'hui";
    if (date.day == now.day - 1) return 'Hier';
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Expanded(child: Divider(color: Color(0xFFDDE3EE))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              _label(),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                color: KColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(child: Divider(color: Color(0xFFDDE3EE))),
        ],
      ),
    );
  }
}

// ── Bulle de message ──────────────────────────────────────────────────────────

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final String Function(DateTime) formatTime;

  const _MessageBubble({required this.message, required this.formatTime});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Avatar (autres)
          if (!isMe) ...[
            const CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/images/Profil.jpg'),
              backgroundColor: Color(0xFFDDE3EE),
            ),
            const SizedBox(width: 6),
          ],

          // Bulle
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.72,
            ),
            child: Container(
              padding: message.isFile
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10)
                  : const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isMe ? KColors.primary : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isMe ? 18 : 4),
                  bottomRight: Radius.circular(isMe ? 4 : 18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  // Contenu
                  if (message.isFile)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Iconsax.document,
                          size: 16,
                          color: isMe
                              ? Colors.white.withOpacity(0.85)
                              : KColors.primary,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            message.content,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              color: isMe
                                  ? Colors.white
                                  : KColors.dark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      message.content,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: isMe ? Colors.white : KColors.dark,
                        height: 1.4,
                      ),
                    ),

                  const SizedBox(height: 4),

                  // Heure
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        formatTime(message.timestamp),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: isMe
                              ? Colors.white.withOpacity(0.60)
                              : KColors.grey,
                        ),
                      ),
                      if (isMe) ...[
                        const SizedBox(width: 3),
                        Icon(
                          Iconsax.tick_circle,
                          size: 11,
                          color: Colors.white.withOpacity(0.70),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),

          if (isMe) const SizedBox(width: 4),
        ],
      ),
    );
  }
}

// ── Barre d'input ─────────────────────────────────────────────────────────────

class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAttach;
  final VoidCallback onSend;

  const _InputBar({
    required this.controller,
    required this.onAttach,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 10,
      ),
      child: Row(
        children: [
          // Attach
          GestureDetector(
            onTap: onAttach,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: KColors.greyLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Iconsax.attach_circle,
                  color: KColors.grey, size: 20),
            ),
          ),
          const SizedBox(width: 10),

          // Champ texte
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              decoration: BoxDecoration(
                color: KColors.greyLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: controller,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: KColors.dark,
                ),
                decoration: const InputDecoration(
                  hintText: 'Écrire un message…',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: KColors.grey,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Envoyer
          GestureDetector(
            onTap: onSend,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: KGradients.primaryGradient,
                borderRadius: BorderRadius.circular(12),
                boxShadow: KShadows.primary,
              ),
              child: const Icon(Iconsax.send_1, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}

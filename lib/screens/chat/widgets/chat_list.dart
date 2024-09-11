import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:tunctexting/common/enums/message_enum.dart';
import 'package:tunctexting/common/providers/message_reply_provider.dart';
import 'package:tunctexting/common/widgets/loader.dart';
import 'package:tunctexting/config/chat_filter.dart';
import 'package:tunctexting/models/message.dart';
import 'package:tunctexting/models/report_model.dart';
import 'package:tunctexting/screens/chat/controller/chat_controller.dart';
import 'package:tunctexting/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatList extends ConsumerStatefulWidget {
  final String receiverUserId;
  const ChatList({
    required this.receiverUserId,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ChatList> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController _messageController = ScrollController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final ReportService _reportService;

  @override
  void initState() {
    _reportService = ReportService(firestore: _firestore, auth: _auth);
    super.initState();
  }

  void onMessageSwipe({
    required String message,
    required bool isMe,
    required MessageEnum messageEnum,
  }) {
    ref.read(messageReplyProvider.notifier).update(
          (state) => MessageReply(
            message,
            isMe,
            messageEnum,
          ),
        );
  }

  Future<void> _reportContent(Message messageData) async {
    try {
      await _reportService.reportContent(messageData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Content reported successfully.')),
      );
    } catch (e) {
      print('Error reporting content: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('An error occurred while reporting the content.')),
      );
    }
  }

  Future<void> _blockUser(String userId) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('User is not logged in');
      }

      await _firestore.collection('users').doc(currentUser.uid).update({
        'blockedUsers': FieldValue.arrayUnion([userId]),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User blocked successfully.')),
      );
    } catch (e) {
      print('Error blocking user: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred while blocking the user.')),
      );
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
      stream:
          ref.read(chatControllerProvider).chatStream(widget.receiverUserId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        SchedulerBinding.instance.addPostFrameCallback((_) {
          _messageController
              .jumpTo(_messageController.position.maxScrollExtent);
        });

        return ListView.builder(
          controller: _messageController,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final messageData = snapshot.data![index];
            var timeSent = DateFormat.Hm().format(messageData.timeSent);

            // Apply content filter
            String filteredMessage =
                ContentFilter.filterContent(messageData.text);

            if (!messageData.isSeen &&
                messageData.recieverid == _auth.currentUser!.uid) {
              ref.read(chatControllerProvider).setChatMessageSeen(
                    context: context,
                    recieverUserId: widget.receiverUserId,
                    messageId: messageData.messageId,
                  );
            }
            if (messageData.senderId == _auth.currentUser!.uid) {
              return MyMessageCardWithTranslation(
                isSeen: messageData.isSeen,
                repliedText: messageData.repliedMessage,
                repliedMessageType: messageData.repliedMessageType,
                username: messageData.repliedTo,
                onLeftSwipe: () => onMessageSwipe(
                  message: filteredMessage,
                  isMe: true,
                  messageEnum: messageData.type,
                ),
                message: filteredMessage,
                date: timeSent,
                type: messageData.type,
              );
            }
            return GestureDetector(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Actions'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.report),
                          title: Text('Report Content'),
                          onTap: () {
                            _reportContent(messageData);
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.block),
                          title: Text('Block User'),
                          onTap: () {
                            _blockUser(messageData.senderId);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: SenderMessageCardWithTranslation(
                repliedText: messageData.repliedMessage,
                repliedMessageType: messageData.repliedMessageType,
                username: messageData.repliedTo,
                onRightSwipe: () => onMessageSwipe(
                  message: filteredMessage,
                  isMe: false,
                  messageEnum: messageData.type,
                ),
                message: filteredMessage,
                date: timeSent,
                type: messageData.type,
              ),
            );
          },
        );
      },
    );
  }
}

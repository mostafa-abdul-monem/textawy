import 'package:flutter/material.dart';
import 'package:messageme_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messageme_app/widgets/message_item.dart';

final _fireStore = FirebaseFirestore.instance;

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          List<MessageItem> messagesWidgets = [];
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              color: greenColor,
            );
          }
          final messages = snapshot.data!.docs;
          for (var message in messages) {
            final messageText = message.get('text');
            final sender = message.get('sender');
            final messageWidget = MessageItem(
              sender: sender,
              text: messageText,
            );
            messagesWidgets.add(messageWidget);
          }

          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              children: messagesWidgets,
            ),
          );
        });
  }
}

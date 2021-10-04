import 'package:flutter/material.dart';
import 'package:messageme_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messageme_app/screens/registration_screen.dart';

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late User signedInUser;
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? message;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messagesStreams() async {
    await for (var snapShot in _fireStore.collection('messages').snapshots()) {
      for (var message in snapShot.docs) {
        print(message.data());
      }
    }
  }
//snapShot access the fireStore collection 'messages' and loop in docs of snapShot
//via message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              height: 20.0,
            ),
            SizedBox(width: 10.0),
            Text('messages'),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, RegistrationScreen.screenRoute);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //start of showing messages here
          StreamBuilder<QuerySnapshot>(
              stream: _fireStore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                List<Text> messagesWidgets = [];
                if (!snapshot.hasData) {
                  return CircularProgressIndicator(
                    color: greenColor,
                  );
                }
                final messages = snapshot.data!.docs;
                for (var message in messages) {
                  final messageText = message.get('text');
                  final sender = message.get('sender');
                  final messageWidget = Text('$messageText - $sender');
                  messagesWidgets.add(messageWidget);
                }

                return Column(
                  children: messagesWidgets,
                );
              }),
          //end of showing messages here
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: orangeColor, width: 2),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      message = value;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        hintText: 'Write your message here',
                        border: InputBorder.none),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _fireStore.collection('messages').add({
                      'text': message,
                      'sender': signedInUser.email,
                    });
                  },
                  child: Icon(Icons.send_rounded, color: Colors.blue[700]),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

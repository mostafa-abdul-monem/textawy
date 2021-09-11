import 'package:flutter/material.dart';
import 'package:messageme_app/constants.dart';

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close))],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(),
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
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        hintText: 'Write your message here',
                        border: InputBorder.none),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Icon(Icons.send_rounded, color: orangeColor),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

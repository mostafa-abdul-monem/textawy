import 'package:flutter/material.dart';
import 'package:messageme_app/constants.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key, this.text, this.sender}) : super(key: key);

  final String? text;
  final String? sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$sender',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w300,
                color: Colors.grey[500]),
          ),
          SizedBox(
            height: 3,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            color: greenColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

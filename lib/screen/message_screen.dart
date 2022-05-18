import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/model/friends.dart';

import '../widget/custom_textfield.dart';
import '../widget/message_bubble.dart';

class MessageScreen extends StatelessWidget {
  final Friends? friends;
  const MessageScreen({Key? key, this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(friends!.name!),
      ),
      body: Column(
        children: [
          MessageBubble(
            friends: friends,
          ),
          Container(
            height: 65,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Expanded(
                      child: CustomTextfield(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Write message here',
                  )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.send_outlined))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

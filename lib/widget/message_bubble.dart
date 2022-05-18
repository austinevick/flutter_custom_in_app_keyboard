import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/model/friends.dart';

import '../constant.dart';
import '../model/message.dart';

class MessageBubble extends StatelessWidget {
  final Friends? friends;
  const MessageBubble({Key? key, this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: friends!.message!.length,
          itemBuilder: (ctx, i) {
            final messages = friends!.message;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: !messages![i].isMe!
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: messages[i].isMe! ? 0 : 60,
                        left: !messages[i].isMe! ? 0 : 60),
                    child: Container(
                        decoration: BoxDecoration(
                            color: messages[i].isMe!
                                ? primaryColor
                                : primaryColor.withOpacity(0.4),
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(15),
                              topRight: const Radius.circular(15),
                              bottomLeft: messages[i].isMe!
                                  ? const Radius.circular(15)
                                  : const Radius.circular(2),
                              bottomRight: !messages[i].isMe!
                                  ? const Radius.circular(15)
                                  : const Radius.circular(2),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(messages[i].message!),
                        )),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';
import 'package:flutter_custom_keyboard/widget/custom_textfield.dart';
import 'package:flutter_custom_keyboard/widget/message_bubble.dart';

import '../model/friends.dart';
import 'message_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (ctx, i) => Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ListTile(
                          onTap: () =>
                              push(context, MessageScreen(friends: friends[i])),
                          subtitle: Text(friends[i].message!.last.message!,
                              maxLines: 1),
                          leading: const CircleAvatar(),
                          tileColor: friends[i].isSelected
                              ? primaryColor
                              : Colors.transparent,
                          title: Text(friends[i].name!,
                              style: style.copyWith(fontSize: 15)),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                        ),
                      ))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';
import 'package:flutter_custom_keyboard/screen/fund_transfer/amount_input_screen.dart';
import 'package:flutter_custom_keyboard/widget/Add_friend_bottom_sheet.dart';

import '../../model/friends.dart';
import '../chat/message_screen.dart';

class SendFundScreen extends StatefulWidget {
  const SendFundScreen({Key? key}) : super(key: key);

  @override
  State<SendFundScreen> createState() => _SendFundScreenState();
}

class _SendFundScreenState extends State<SendFundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send funds to a friend'),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (ctx, i) => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ListTile(
                      onTap: () {},
                      leading: const CircleAvatar(),
                      title: Text(friends[i].name!,
                          style: style.copyWith(fontSize: 15)),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

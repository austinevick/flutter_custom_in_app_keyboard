import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/screen/chat_screen.dart';
import 'package:flutter_custom_keyboard/screen/send_fund_screen.dart';
import 'package:flutter_custom_keyboard/widget/action_card.dart';

import '../constant.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Good evening,\nAugustine Victor',
                        style: style,
                      ),
                      CircleAvatar(radius: 28),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ActionCard(
                    title: 'CHAT WITH FRIENDS',
                    subtitle: 'Share ideas with friends.',
                    onTap: () => push(context, const ChatScreen()),
                    icon: Icons.chat,
                  ),
                  const SizedBox(height: 20),
                  ActionCard(
                    title: 'SEND FUNDS TO FRIENDS',
                    subtitle: 'Send money to some of favourites friends.',
                    icon: Icons.call_made,
                    onTap: () => push(context, const SendFundScreen()),
                  ),
                  // Text('Recent Activity', style: style),
                  // Column(
                  //   children:
                  //       List.generate(10, (i) => ListTile(title: Text('data'))),
                  // )
                ],
              ),
            )));
  }
}

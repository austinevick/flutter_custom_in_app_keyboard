import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';
import 'package:flutter_custom_keyboard/screen/amount_input_screen.dart';
import 'package:flutter_custom_keyboard/widget/Add_friend_bottom_sheet.dart';

import '../model/friends.dart';

class SendFundScreen extends StatefulWidget {
  const SendFundScreen({Key? key}) : super(key: key);

  @override
  State<SendFundScreen> createState() => _SendFundScreenState();
}

class _SendFundScreenState extends State<SendFundScreen> {
  final ctr = TextEditingController();

  List<Friends> selectedFriends = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'Send funds to friends',
            style: style,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: friends.length,
                      itemBuilder: (ctx, i) => Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  if (!friends[i].isSelected) {
                                    selectedFriends.add(friends[i]);
                                  } else if (friends[i].isSelected) {
                                    selectedFriends.removeLast();
                                  }
                                  friends[i].isSelected =
                                      !friends[i].isSelected;
                                });
                              },
                              leading: const CircleAvatar(),
                              tileColor: friends[i].isSelected
                                  ? primaryColor
                                  : Colors.transparent,
                              title: Text(friends[i].name!,
                                  style: style.copyWith(fontSize: 15)),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                            ),
                          )))
            ],
          ),
        ),
        bottomSheet: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: selectedFriends.isEmpty
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 70,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 1.8))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                  selectedFriends.length,
                                  (i) => const Align(
                                      widthFactor: .7,
                                      child: CircleAvatar(
                                          radius: 24,
                                          backgroundColor: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: CircleAvatar(),
                                          )))),
                            ),
                            IconButton(
                                onPressed: () => push(
                                    context,
                                    AmountInputScreen(
                                        selectedFriends: selectedFriends)),
                                icon: const Icon(
                                  Icons.send,
                                  color: primaryColor,
                                ))
                          ],
                        ),
                      ),
                    ),
                  )),
        floatingActionButton: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: selectedFriends.isNotEmpty
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (ctx) => AddFriendBottomSheet(
                              ctr: ctr,
                              onTap: () {
                                if (ctr.text.isEmpty) {
                                  return;
                                }
                                setState(() {
                                  friends.add(Friends(name: ctr.text));
                                });
                                ctr.clear();
                                Navigator.of(context).pop();
                              },
                            ));
                  },
                  backgroundColor: primaryColor,
                  child: const Icon(Icons.add),
                ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';
import 'package:flutter_custom_keyboard/widget/Add_friend_bottom_sheet.dart';
import 'package:flutter_custom_keyboard/widget/custom_button.dart';

import '../model/friends.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ctr = TextEditingController();

  List<Friends> selectedFriends = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Send money to friends',
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
                              if (!friends[i].isSelected) {
                                setState(() {
                                  selectedFriends.add(friends[i]);
                                  friends[i].isSelected =
                                      !friends[i].isSelected;
                                });
                              } else {
                                setState(() {
                                  selectedFriends.removeAt(i);
                                  friends[i].isSelected =
                                      !friends[i].isSelected;
                                });
                              }
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
      bottomSheet: SizedBox(
        height: 60,
        child: Row(
          children: List.generate(
              selectedFriends.length,
              (i) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedFriends[i].name!,
                      style: style.copyWith(fontSize: 15),
                    ),
                  )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
    );
  }
}

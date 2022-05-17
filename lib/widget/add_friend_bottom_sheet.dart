import 'package:flutter/material.dart';

import '../constant.dart';
import 'custom_button.dart';

class AddFriendBottomSheet extends StatelessWidget {
  final TextEditingController? ctr;
  final VoidCallback? onTap;
  const AddFriendBottomSheet({Key? key, this.ctr, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text('Add a friend', style: style),
              const SizedBox(height: 15),
              TextField(
                controller: ctr,
                decoration: const InputDecoration(
                  hintText: 'Enter full name',
                ),
              ),
              const SizedBox(height: 70),
              CustomButton(height: 50, onPressed: onTap, text: 'ADD')
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';
import 'package:flutter_custom_keyboard/model/friends.dart';
import 'package:flutter_custom_keyboard/screen/fund_transfer/transaction_pin_screen.dart';
import 'package:flutter_custom_keyboard/widget/custom_button.dart';
import 'package:flutter_custom_keyboard/widget/otp_keyboard_screen.dart';
import 'package:flutter_custom_keyboard/widget/keypad_button.dart';

import '../../widget/amount_container.dart';

class AmountInputScreen extends StatefulWidget {
  final List<Friends>? selectedFriends;
  const AmountInputScreen({Key? key, this.selectedFriends}) : super(key: key);

  @override
  State<AmountInputScreen> createState() => _AmountInputScreenState();
}

class _AmountInputScreenState extends State<AmountInputScreen> {
  List<String> amount = [r'$'];

  void addValueToAmount(String value) {
    int amountListLength = amount.length;

    if (amountListLength < 5 || (amount[amountListLength - 3] != '.')) {
      setState(() {
        amount.add(value);
      });
    }
  }

  bool isAmountLimitReached() {
    return amount.length >= 11;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter amount'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: List.generate(
                  widget.selectedFriends!.length,
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
          ),
          const Spacer(),
          AmountContainer(
            amount: amount,
            showCursor: true,
          ),
          const Spacer(),
          Row(
            children: [
              buildNumberButton('1'),
              buildNumberButton('2'),
              buildNumberButton('3')
            ],
          ),
          Row(
            children: [
              buildNumberButton('4'),
              buildNumberButton('5'),
              buildNumberButton('6')
            ],
          ),
          Row(
            children: [
              buildNumberButton('7'),
              buildNumberButton('8'),
              buildNumberButton('9')
            ],
          ),
          Row(
            children: [
              buildDotButton(),
              buildNumberButton('0'),
              buildDelButton()
            ],
          ),
          const SizedBox(height: 25),
          CustomButton(
            onPressed: () {
              print(amount.join().replaceAll(r'$', ''));
              push(context, const TransactionPinScreen());
            },
            text: 'Proceed',
          ),
          const SizedBox(height: 8),
        ],
      )),
    );
  }

  Widget buildDelButton() => KeypadButton(
        onPressed: () {
          if (amount.first != amount.last) {
            if (amount.length >= 3) {
              if (amount[1] == '0' && amount[2] == '.' && amount.length == 3) {
                amount.removeLast();
              }
            }
            amount.removeLast();
            setState(() {});
          }
        },
        child: const Icon(Icons.backspace),
      );

  Widget buildDotButton() => KeypadButton(
        onPressed: () {
          if (!amount.contains('.') && !isAmountLimitReached()) {
            if (amount.first != amount.last) {
              addValueToAmount(".");
            } else {
              addValueToAmount("0");
              addValueToAmount(".");
            }
          }
        },
        child: const Text('.', style: style),
      );

  Widget buildNumberButton(String text) => KeypadButton(
        onPressed: () {
          if (text.contains('0')) {
            if (amount.first != amount.last && !isAmountLimitReached()) {
              addValueToAmount("0");
            }
            return;
          }
          if (!isAmountLimitReached()) {
            addValueToAmount(text);
          }
        },
        child: Text(text,
            style: style.copyWith(color: Colors.white, fontSize: 28)),
      );
}

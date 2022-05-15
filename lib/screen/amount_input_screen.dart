import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/constant.dart';
import 'package:flutter_custom_keyboard/widget/custom_button.dart';

import '../widget/amount_container.dart';

class AmountInputScreen extends StatefulWidget {
  const AmountInputScreen({Key? key}) : super(key: key);

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
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Please enter amount',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 25),
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
          MaterialButton(
            onPressed: () {
              print(amount.join().replaceAll(r'$', ''));
            },
            shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)),
            minWidth: 300,
            height: 60,
            color: Colors.black,
            child: const Text(
              'SEND',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      )),
    );
  }

  Widget buildDelButton() => CustomButton(
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

  Widget buildDotButton() => CustomButton(
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

  Widget buildNumberButton(String text) => CustomButton(
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
        child: Text(text, style: style),
      );
}

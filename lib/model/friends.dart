import 'package:flutter_custom_keyboard/model/message.dart';

class Friends {
  String? name;
  final String? image;
  bool isSelected;
  final List<Message>? message;

  Friends({this.name, this.image, this.message, this.isSelected = false});
}

List<Friends> friends = [
  Friends(name: 'Janet Samuel', message: [
    Message(
        message:
            'Hello dear Flutter chat bubble widgets, similar to the Whatsapp and more shapes.',
        isMe: false),
    Message(
        message: 'Hello dear Flutter chat bubble widgets, similar', isMe: true),
  ]),
  Friends(name: 'Sanni Bako', message: [
    Message(message: 'Hi, Good morning', isMe: true),
    Message(message: 'How was your night?', isMe: false),
  ]),
  Friends(name: 'Kayode Peter', message: [
    Message(message: 'Hi, Good morning', isMe: true),
    Message(message: 'How was your night?', isMe: false),
  ])
];

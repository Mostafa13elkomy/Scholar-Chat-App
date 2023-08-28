
import 'package:flutter/material.dart';

import 'package:KomyChat/models/messages.dart';

import 'consts.dart';

class ChatPupple extends StatelessWidget {
  const ChatPupple({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Messages message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 24, right: 20, bottom: 24),
        margin: const  EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
            color: KPrimaryColor),
        child: (Text(message.message,
          
          style:const TextStyle(color: Colors.white, fontSize: 14),
        )),
      ),
    );
  }
}

class chatPuppleForfriend extends StatelessWidget {
  const chatPuppleForfriend({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Messages message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:const EdgeInsets.only(left: 20, top: 24, right: 20, bottom: 24),
        margin:const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            color: KFriendMessageColor),
        child: (Text(message.message,
          
          style:const TextStyle(color: Colors.white, fontSize: 14),
        )),
      ),
    );
  }
}

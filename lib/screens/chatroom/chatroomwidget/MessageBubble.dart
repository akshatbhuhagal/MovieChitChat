import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  final String text;
  final String time;
  final String username;
  final bool isCurrentUser;

  MessageBubble({required this.text, required this.isCurrentUser, required this.time, required this.username});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isCurrentUser ? const Color(0xFF1c2f47) : const Color(0xFF475873),
                  borderRadius: isCurrentUser
                      ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(20),
                  )
                      : const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5, right: 15, left: 15),
                    child: Text(
                      username.replaceAll("@gmail.com", ""),
                      style: TextStyle(
                        fontSize: 10,
                          color: isCurrentUser ? Colors.white : Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 10, right: 15, left: 15),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 14,
                          color: isCurrentUser ? Colors.white : Colors.white),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:6, right: 6, bottom: 6),
              child: Text(
                time,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black),
              )
            )
          ],
        ),
      ),
    );
  }
}
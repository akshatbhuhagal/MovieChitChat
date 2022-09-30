import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:moviechitchat/models/Message.dart';
import 'package:moviechitchat/models/Movie.dart';
import 'package:moviechitchat/screens/chatroom/chatroomwidget/MessageBox.dart';
import 'package:moviechitchat/screens/chatroom/chatroomwidget/MessageBubble.dart';

import 'chatroomwidget/MessageList.dart';


class ChatRoomScreen extends StatelessWidget {


  final Movie movieId;
  final String currentUserId;
  final String username;
  final Stream<QuerySnapshot<Message>> messageQuery;
  final Function sendMessage;
  var messages = [];

  ChatRoomScreen(this.movieId, this.currentUserId, this.messageQuery, this.sendMessage, this.username);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: MessageList(
            currentUserId,
            messageQuery,
            sendMessage,
            movieId.id,
            username,
            movieId
        ),
      ),
    );
  }




}


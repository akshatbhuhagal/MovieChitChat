import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:moviechitchat/models/Message.dart';
import 'package:moviechitchat/screens/chatroom/chatroomwidget/MessageBox.dart';
import 'package:moviechitchat/screens/chatroom/chatroomwidget/MessageBubble.dart';
import 'package:moviechitchat/screens/moviedetails/MovieDetailScreen.dart';

import '../../../models/Movie.dart';


class MessageList extends StatefulWidget {

  final String movieId;
  final String username;
  final String currentUserId;
  final Stream<QuerySnapshot<Message>> messageQuery;
  final Function sendMessage;
  final Movie movieDetails;
  var messages = [];

  MessageList(this.currentUserId, this.messageQuery, this.sendMessage, this.movieId, this.username, this.movieDetails);


  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {


    // scroll to bottom once chat list is built
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    widget.messageQuery.listen((event) {
      debugPrint("Items${event.items}");
      setState(() {
        widget.messages = event.items;
      });
    });

    return Container(
      color: const Color(0xFF1c2f47),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, icon: const Icon(Icons.chevron_left, size: 30,),)
                    ),
                    Expanded(
                        child: SizedBox(
                            height: 20,
                            child: FittedBox(
                                child: Text(widget.movieDetails.title.toString(), style: TextStyle(fontSize: 20, color: Colors.black),))
                        )
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(color: Colors.black,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailScreen(widget.movieDetails)));
                          }, icon: const Icon(Icons.more_vert),)
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(35),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ListView.builder(
                        itemCount: widget.messages.length,
                        scrollDirection: Axis.vertical,
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context,index) {
                          Message message = widget.messages[index];
                          bool isCurrentUser = message.fromId == widget.currentUserId;
                          return MessageBubble(text: message.message! , isCurrentUser: isCurrentUser, time: message.timestamp!, username: message.fromUsername!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: MessageBox((message) => {
                setState(() {
                  widget.sendMessage(message, widget.currentUserId, widget.movieId , widget.username);
                })
              },),
            )
          ]),
    );
  }
}
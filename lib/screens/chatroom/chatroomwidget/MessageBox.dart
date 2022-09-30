import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:moviechitchat/utils/CommonUtils.dart';

var message = "";

class MessageBox extends StatefulWidget {

  final Function sendMessage;

  MessageBox(this.sendMessage);

  @override
  _MessageBox createState() => _MessageBox();
}

class _MessageBox extends State<MessageBox> {


  @override
  void initState() {
    super.initState();
    emojiShowing = false;
  }

  bool emojiShowing = false;


  TextEditingController controller = TextEditingController();

  _onEmojiSelected(Emoji emoji) {
    controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
  }

  _onBackspacePressed() {
    controller
      ..text = controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
  }


  Future<bool> onBackPress() {
    if (emojiShowing) {
      setState(() {
        emojiShowing = false;
      });
    } else {
      Navigator.pop(context);
    }
    return Future.value(false);
  }


  @override
  Widget build(BuildContext context) {
    var message = "";

    controller.addListener(() {
      if (controller.text.length > 1) {
        message = controller.text.toString();
      }
    });

    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    void sendMessage() {
      if(message.isEmpty){
        CommonUtils.showSnackBar("Message is empty", context);
        return;
      }
      widget.sendMessage(message);
      controller.clear();
    }

    return WillPopScope(
      onWillPop: onBackPress,
      child: Container(
        color: const Color(0xFF1c2f47),
        child: Column(
          children: [
            Container(
                height: 45,
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff475873),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextField(
                  autofocus: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: controller,
                  onTap: () => {},
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                    hintText: "Say Something!",
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Color(0xFF1c2f47),),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.face, color: Colors.white,), onPressed: () {
                      setState(() {
                        emojiShowing = !emojiShowing;
                      });
                    },
                    ),
                    suffixIcon: IconButton(
                      icon: Image.asset("assets/icons/send_icon.png", width: 20, height: 20, color: Colors.white,), onPressed: () { sendMessage(); },
                    ),
                  ),

                )
            ),


            Offstage(
              offstage: !emojiShowing,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                    onEmojiSelected: (Category? category, Emoji emoji) {
                      _onEmojiSelected(emoji);
                    },
                    onBackspacePressed: _onBackspacePressed,
                    config: Config(
                        columns: 7,
                        emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        initCategory: Category.RECENT,
                        bgColor: const Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        backspaceColor: Colors.blue,
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL)),
              ),
            ),

          ],
        ),
      ),
    );
  }



}
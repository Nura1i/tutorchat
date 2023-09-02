
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/textStyle.dart';

class ChatMessage extends StatefulWidget {
  String text;
  String username;
  String imageName;
  bool pressBigText = false;

  ChatMessage(
      {super.key,
        required this.username,
        required this.imageName,
        required this.text,
        required this.pressBigText,
      }
      );

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 10, right: 30),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            width: 40.86,
            height: 40,
            child: CircleAvatar(
              child: Image(
                image: AssetImage(widget.imageName),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 23,
                  child: Text(
                    widget.username,
                    style: textStyle(
                        FontWeight.w600, 17, Colors.black, 'Open Sans'),
                  )),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.text.length > 50) {
                      widget.pressBigText = !widget.pressBigText;
                    }
                  });
                },
                child: Container(
                  width: 244,
                  height: widget.pressBigText
                      ? (widget.text.length * 80) / 120
                      : 55,
                  color: Colors.white,
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Open Sans',
                        color: Colors.black),
                    overflow: TextOverflow.clip,
                    maxLines: widget.pressBigText
                        ? (widget.text.length / 29 + 2).ceil()
                        : 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/textStyle.dart';
import 'chatScreen.dart';

class ReplyMessage extends StatefulWidget {
  String username;
  String text;
  String imageName;
  bool pressBigText = false;

  ReplyMessage(this.username, this.text, this.imageName,this.pressBigText);

  @override
  State<ReplyMessage> createState() => _ReplyMessageState();
}

class _ReplyMessageState extends State<ReplyMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 10, right: 10),
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
          padding: const EdgeInsets.only(left: 50.0, right: 10, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Replay to username', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10, color: Color(0xff9A9A9A), fontFamily: 'Open Sans'),),
              Text(widget.username, style: textStyle(FontWeight.w600, 17, Colors.black, 'Open Sans'),),
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
    ) ;
  }
}

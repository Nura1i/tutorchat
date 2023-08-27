

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tutorchat/widgets/textStyle.dart';

List<ChatMessage> _messages = [];

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  /// Controllers
  var _textEditingController;
  final _scrollController = ScrollController();

  @override
  void initState(){
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back, size: 25,color: Color(0xff130F26),), onPressed: (){Navigator.pop(context);},),
          centerTitle: true,
          title: Text('Comment', style: textStyle(FontWeight.w500, 20, Colors.black, 'Open Sans'),),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-150,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              ),
            ),
          ]
            ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height-80, left: 20),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onTap: (){
                    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                  },
                  scrollPadding: EdgeInsets.only(left: 10),
                  textAlign: TextAlign.left,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                     suffixIcon: IconButton(
                       onPressed: (){
                         if(_textEditingController!.text!='')
                         _sendMessage(_textEditingController!.text);
                         _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

                       },
                       icon: const  Icon(Icons.send, size: 20, color: Colors.black,),
                     ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20, top: 10),
                      hintText: 'Add comment',
                      hintStyle: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xff4E4A4A))
                  ),
                  onSubmitted: (text){
                    text.isNotEmpty ? _sendMessage(text) : null;
                    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                  },
                ),
              ),
          ),
        ),
      ),
    );
  }

  void _sendMessage(String text) {
    setState(() {
      _messages.add(
        ChatMessage(
          username: "Shahbozbek",
          imageName: "assets/png/userpicture.png",
          text: text,
          pressBigText: false,
        ),
      );
      _textEditingController!.clear();
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }
}

class ChatMessage extends StatefulWidget {
  final String text;
  final String username;
  final String imageName;
  bool pressBigText = false;

  ChatMessage({required this.username,required this.imageName, required this.text, required this.pressBigText});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 10, right: 30),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: 40.86,
              height: 40,
              child: CircleAvatar(
                child: Image(image: AssetImage(widget.imageName),),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 50.0, right: 50,top: 20 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 23,
                    child: Text(widget.username,style: textStyle(FontWeight.w600, 17, Colors.black, 'Open Sans'),)),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(widget.text.length>50){
                      widget.pressBigText = !widget.pressBigText;}
                    });
                  },
                  child: Container(
                    width: 244,
                    height:  widget.pressBigText ? (widget.text.length*80)/120 : 55,
                    color: Colors.white,
                    child: Text(widget.text,
                       textAlign: TextAlign.left,
                       style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300, fontFamily: 'Open Sans', color: Colors.black),
                      overflow: TextOverflow.clip,
                      maxLines:  widget.pressBigText ? (widget.text.length/29+2).ceil() : 4,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Reply',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.w400, fontSize: 15,color: Color(0xff9A9A9A)),),
                      const Divider(height: 5,thickness: 1,color: Color(0xff9A9A9A),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}
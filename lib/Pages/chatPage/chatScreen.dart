import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/chatPage/reply.dart';
import 'package:tutorchat/widgets/textStyle.dart';

import 'chat.dart';

List<Widget> _messages = [];
List<Widget> _replydividers = [];

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  FocusNode focusNode = FocusNode();
  /// Controllers
  int indexlist = -1;
  bool controllerreplyortext = false;
  final _scrollController = ScrollController();
  TextEditingController _textEditingControllertext = TextEditingController();


  @override
  void initState() {
    _textEditingControllertext = TextEditingController();
    super.initState();
  }
  @override
  void dispose(){
    focusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardsize = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Color(0xff130F26),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Comment',
            style: textStyle(FontWeight.w500, 20, Colors.black, 'Open Sans'),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
                children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-MediaQuery.of(context).viewInsets.bottom - 150,
                color: Colors.white,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _messages[index],
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(focusNode);
                            controllerreplyortext = true;
                            indexlist = index;
                          },
                          child: _replydividers[index],
                        ),
                       // index==_messages.length ? Container(height: keyboardsize,) : Container(height: keyboardsize,),
                        ],
                    );
                  },
                ),
              ),
              keyboardsize!=0 ? Container(height: keyboardsize + 20 ,) : Container(),
            ]),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height - 80, left: 20),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                focusNode: focusNode,
                onTap: () {
                 setState(() {
                   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                 });
                  },
                onEditingComplete: (){
                  _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                },
                scrollPadding: const EdgeInsets.only(left: 10),
                textAlign: TextAlign.left,
                controller: _textEditingControllertext,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (_textEditingControllertext.text != '') {
                            _sendMessage(_textEditingControllertext.text,indexlist);
                          }
                          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                        });
                         },
                      icon: const Icon(Icons.send, size: 20, color: Colors.black,),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 20, top: 10),
                    hintText: 'Add comment',
                    hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff4E4A4A))),
                onSubmitted: (text) {
                  setState(() {
                    text.isNotEmpty ? _sendMessage(text, indexlist) : null;
                    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                  });
                  },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _sendMessage(String text,int indexlist) {
    setState(() {
      controllerreplyortext ?
      _messages.insert(indexlist+1, ReplyMessage('Shahbozbek', text, 'assets/png/userpicture.png', false)):
      _messages.add(ChatMessage(username: "Shahbozbek", imageName: "assets/png/userpicture.png", text: text, pressBigText: false,),) ;
      if(controllerreplyortext){_replydividers[indexlist] = Padding(
        padding:  EdgeInsets.only(top: 10, left: 63, right: 63),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            Text(
              'Reply',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xff9A9A9A)),
            ),
          ],
        ),
      );}
      _replydividers.add(Padding(
        padding:  EdgeInsets.only(top: 10, left: 63, right: 63),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            Text(
              'Reply',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xff9A9A9A)),
            ),
            Divider(
              height: 5,
              thickness: 1,
              color: Color(0xff9A9A9A),
            ),
          ],
        ),
      ));
       _textEditingControllertext.clear();
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      controllerreplyortext = false;
    });
    focusNode.unfocus();
  }
}

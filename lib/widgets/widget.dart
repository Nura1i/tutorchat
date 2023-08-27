import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/chatPage/chatScreen.dart';
import 'package:tutorchat/extentions.dart';

/**
    Fanlar ketma ketligi uchun yaratilgan widget.
 **/


class Fans extends StatefulWidget {
  String image;
  String text;
  Fans({required this.image,required this.text });

  @override
  State<Fans> createState() => _FansState();
}

class _FansState extends State<Fans> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 8.0, top: 10.0, right: 8.0, bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
          color: '#F4F4F4'.toColor(),
        ),
        height: 35,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(widget.image),
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  color: '#5F5F5F'.toColor(),
                  fontSize: 14,
                  fontFamily: 'OpenSans'),
            ),
          ],
        ),
      ),
    );
  }
}


class PostSubjects extends StatefulWidget {
  String username;
   String userimage;
   String imagename;
   String coursename;
   int commentcount;
   bool locksubject;
   double ratingcounter;
   int newcostcourse;
   int oldcostcourse;
  PostSubjects( {required this.username,
    required String this.userimage,
    required String this.imagename,
    required String this.coursename,
    required int this.commentcount,
    required bool this.locksubject,
    required double this.ratingcounter,
    required int this.newcostcourse,
    required int this.oldcostcourse});

  @override
  State<PostSubjects> createState() => _PostSubjectsState();
}

class _PostSubjectsState extends State<PostSubjects> {
  var addcommentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 10),
            child: Row(
              children: [
                Image(
                  image: AssetImage(widget.userimage),
                  width: 36,
                  height: 36,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.username,
                  style: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Stack(children: [
            widget.locksubject
                ? Container(
              height: 229,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imagename), fit: BoxFit.cover),
              ),
            )
                : Container(
              height: 229,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  colorFilter:
                  ColorFilter.mode(Colors.white54, BlendMode.lighten),
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/png/chemistry.jpeg',
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 36,
                      height: 45,
                      child: Icon(
                        Icons.lock_outline,
                        color: '#0B2B57'.toColor(),
                        size: 36,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Container(
                            width: 103,
                            height: 24,
                            decoration: BoxDecoration(
                              color: '#5790DF'.toColor(),
                            ),
                            child: const Center(
                                child: Text(
                                  'Sotib olish',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400),
                                ))))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 209),
              child: InkWell(
                  child: Container(
                      height: 34,
                      width: double.infinity,
                      color: '#4586D6'.toColor(),
                      child: const Center(
                          child: Text(
                            'Send message',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 24),
                          )))),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 20),
            child: Text(
              widget.coursename,
              style: const TextStyle(
                  fontSize: 16, fontFamily: 'Rubik', fontWeight: FontWeight.w400),
            ),
          ),
          widget.locksubject
              ? Container()
              : Container(
            child: const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'Teacher name',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                    color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              height: 20,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: SizedBox(
                      width: 110,
                      height: 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.ratingcounter.ceil() + 2,
                          itemBuilder: (_, index) {
                            return Icon(
                              Icons.star,
                              color: '#FAA307'.toColor(),
                              size: 20,
                            );
                          }),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      child: Image(
                        image: AssetImage('assets/png/saveicon.png'),
                        width: 17,
                        height: 21,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          widget.locksubject
              ? GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return ChatScreen();
              }));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 10),
                  child: Text(
                    'View all ${widget.commentcount} comments',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: '#CFCFCF'.toColor(),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: TextField(
                    controller: addcommentController,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return ChatScreen();
                      }));
                    },
                    onSubmitted: (text){
                      ChatMessage(username: widget.username, imageName: widget.imagename, text: text, pressBigText: false,);
                      addcommentController.clear();
                    },
                    decoration: InputDecoration(
                      hintText: '    Add comment...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          color: '#CFCFCF'.toColor()),
                    ),
                  ),
                )
              ],
            ),
          )
              : Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          widget.oldcostcourse.toString() + r'$',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          widget.newcostcourse.toString() + r'$',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Premium',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


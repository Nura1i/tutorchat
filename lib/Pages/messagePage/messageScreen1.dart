import 'package:flutter/material.dart';

class MessageScreen1 extends StatefulWidget {
  const MessageScreen1({Key? key}) : super(key: key);

  @override
  State<MessageScreen1> createState() => _MessageScreen1State();
}

class _MessageScreen1State extends State<MessageScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 24.23, color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text('Message', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontFamily: 'Inter', fontSize: 20, ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 82.0, left: 50, right: 50),
        child: Container(
          child : SingleChildScrollView(
            child: Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Container(
                   width: 330,
                   height: 188,
                   // width: MediaQuery.of(context).size.width * 0.8,
                   // height: MediaQuery.of(context).size.height * 0.4,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(10),
                       topRight: Radius.circular(10),
                     ),
                     image: DecorationImage(
                       fit: BoxFit.cover,
                       image: AssetImage('assets/png/chemistry.jpeg'),
                     ),
                   ),
                   child: Center(
                     child: SizedBox(
                       width: 76.2,
                       height: 76.2,
                       child: CircleAvatar(
                         backgroundColor: Colors.blue,
                         child: Icon(Icons.play_arrow, color: Colors.white, size: 36,),),
                     ),
                   ),
                 ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 10, right: 10),
                    child: Text('My name is Catherine. I like dancing in the rain and travelling ', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 13.12, color: Color(0xff323232)),),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10),
                    child: Text('My name is Catherine. I like dancing in the rain and travelling all around the world. My name is Catherine. I like dancing in the rain and travelling all around the world.My name is Catherine. I like dancing in the rain and travelling all around the world.///////My name is Catherine. I like dancing in the rain and travelling all around the world. My name is Catherine. I like dancing in the rain and travelling all around the world.My name is Catherine. I like dancing in the rain and travelling all around the world. ///My name is Catherine. I like dancing in the rain and travelling all around the world. My name is Catherine. I like dancing in the rain and travelling all around the world.My name is Catherine. I like dancing in the rain and travelling all around the world.My name is Catherine. I like dancing in the rain and travelling all around the world. My name is Catherine. I like dancing in the rain and travelling all around the world.My name is Catherine. I like dancing in the rain and travelling all around the world.My name is Catherine. I like dancing in the rain and travelling all around the world. My name is Catherine. I like dancing in the rain and travelling all around the world.My name is Catherine. I like dancing in the rain and travelling all around the world.',
                      softWrap: true,
                      maxLines: 1000,
                      style: TextStyle(fontSize: 13.12,color: Color(0xff0A0A0A),fontWeight: FontWeight.w400, fontFamily: 'Open Sans' ),),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('26.05.2023', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.12, color: Color(0xff9A9A9A), fontFamily: 'Open Sans'),),
                      SizedBox(width: 20,),

                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

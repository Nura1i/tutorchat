import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/messagePage/messageScreen.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back, size: 24.23,color: Colors.black,)),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Likes', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: 'Inter'),),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 45,
              itemBuilder: (_, index){
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return MessageScreen();
                  }));
                },
                child: ListTile(
                  leading:  Container(
                    height: 61.41,
                    width: 60,
                    child: Stack(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 20.0,right: 20),
                               child: CircleAvatar(
                                 child: Image(image: AssetImage('assets/png/userpicture.png'),width: 40,height: 40,),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(bottom: 20, right: 20),
                               child: CircleAvatar(
                                 child: Image(image: AssetImage('assets/png/userPicture2.png'),width: 40,height: 40,),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 10.0, left: 20),
                               child: CircleAvatar(
                                 child: Image(image: AssetImage('assets/png/userPicture1.png'),width: 40,height: 40,),
                               ),
                             ),
                           ],
                         ),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('username, username ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'Open Sans', color: Colors.black, overflow: TextOverflow.ellipsis),),
                          Text('and others', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'Inter', color: Color(0xff9A9A9A)),),
                        ],
                      ),
                      Text('liked your post', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'Inter', color: Color(0xff9A9A9A)),),
                    ],
                  ),
                  trailing: Container(
                    width: 45,
                    height: 41,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/png/chemistry.jpeg')),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

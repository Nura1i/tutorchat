import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/messagePage/messageScreen1.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index){
            return index!=9 ? Container(
              child: Column(
                children: [
                  Text('May 7, 19:07', style: TextStyle(color: Color(0xff8C8C8C), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return MessageScreen1();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 35.0, left: 35),
                      child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Column(
                        children: [
                          Text('My name is Caterina. I like dancing', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.12, color: Color(0xff323232), fontFamily: 'Poppins'),),
                          SizedBox(height: 5,),
                          Text('Lorem Ipsum is simply dummy text of the.... ', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Colors.black, fontFamily: 'Open Sans', overflow: TextOverflow.ellipsis),),
                        ],
                      )),
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ) : InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  child: Center(child: Text('Mark as read', style: TextStyle(color: Color(0xff347AE2), fontSize: 18, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)),
                ),
              ),
            )
            ;
          }),
        ),
      ),
    );
  }
}

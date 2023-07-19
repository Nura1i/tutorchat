import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tutorchat/Pages/HomePage/homeScreen.dart';
import 'package:tutorchat/extentions.dart';

class CreatePost1 extends StatefulWidget {
  const CreatePost1({Key? key}) : super(key: key);

  @override
  State<CreatePost1> createState() => _CreatePost1State();
}

class _CreatePost1State extends State<CreatePost1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: (){

          }, icon: const Icon(Icons.keyboard_backspace, color: Color(0xff130F26),size: 24,),),
          centerTitle: true,
          title: const Text('Post yaratish', style: TextStyle(fontFamily: 'Poppins', fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black),),
        ),
        body:   SingleChildScrollView(
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18.0, right: 18.0),
                child: Column(
                  children: [
                   TextField(
                      decoration: InputDecoration(
                        hintText: 'Content nomi',
                        hintStyle: TextStyle(color: Color(0xff757575),fontWeight: FontWeight.w500,fontSize: 15, fontFamily: 'Inter')
                      ),
                    ),
                   TextField(
                      decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(color: Color(0xff757575),fontWeight: FontWeight.w500,fontSize: 15, fontFamily: 'Inter')
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text('img upload', style: TextStyle(color: Color(0xff757575),fontWeight: FontWeight.w500,fontSize: 15, fontFamily: 'Inter'),),
                            SizedBox(height: 10,),
                            Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text('word, ppt, exel, png, svg, jpeg, video ',style: TextStyle(color: Color(0xff757575),fontWeight: FontWeight.w500,fontSize: 9, fontFamily: 'Inter'),),
                            ),
                          ],
                        ),
                        Image(image: AssetImage('icon/imgupload.png'),width: 15,height: 14,),
                      ],
                    ),
                    Divider(height: 0,thickness: 2,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 289.0, left: 21,right: 21),
                child: TextButton(onPressed: (){}, child: Container(
                    width: 388,
                    height: 56,
                    color: Color(0xff5790DF),
                    child: Center(child: Text('To`plamga biriktirish',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20, fontFamily: 'Inter'),)))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 359.0, left: 21,right: 21),
                child: TextButton(onPressed: (){}, child: Container(
                    width: 388,
                    height: 56,
                    color: Color(0xff5790DF),
                    child: Center(child: Text('To`plamsiz yuklash',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20, fontFamily: 'Inter'),)))),
              ),
            ],
          ),
        ),
      )
    );
  }
}

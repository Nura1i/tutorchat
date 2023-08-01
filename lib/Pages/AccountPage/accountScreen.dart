import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';
import 'package:tutorchat/widgets/textStyle.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool followPress = true;
  bool portfolioPress = false;
  bool messagePrees = false;
  void pressResult(int index){
    setState(() {
      switch(index){
        case 1 :{
          // Follow Press
          followPress = true;
          portfolioPress = false;
          messagePrees = false;
        break;
        }
        case 2 : {
          // Portfolio Press
          followPress = false;
          portfolioPress = true;
          messagePrees = false;
          break;
        }
        case 3 : {
          // Message Press
          followPress = false;
          portfolioPress = false;
          messagePrees = true;
          break;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_backspace_outlined, color: Color(0xff000000), size: 24,)),
                  Text('@Catherina', style: textStyle(FontWeight.w700, 19, Colors.black, 'Poppins'),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.black,size: 24,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffFCFCFC),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 11.0, left: 162, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Column(
                        children: [
                          Text('${1}K', style: textStyle(FontWeight.w700, 15.14, Colors.black, 'Poppins'),),
                          SizedBox(height: 5,),
                          Text('Followers', style: textStyle(FontWeight.w400, 13, Colors.black, 'Poppins'),)
                        ],
                      ),
                        Column(
                          children: [
                            Text('${342}', style: textStyle(FontWeight.w700, 15.14, Colors.black, 'Poppins'),),
                            SizedBox(height: 5,),
                            Text('Following', style: textStyle(FontWeight.w400, 13, Colors.black, 'Poppins'),)
                          ],
                        ),
                        Column(
                          children: [
                            Text('${105}', style: textStyle(FontWeight.w700, 15.14, Colors.black, 'Poppins'),),
                            SizedBox(height: 5,),
                            Text('Lessons', style: textStyle(FontWeight.w400, 13, Colors.black, 'Poppins'),)
                          ],),
                        ],),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 97, left: 30),
              child: Image(
                  width: 100.94,
                  height: 100.94,
                  image: AssetImage('assets/png/accountuserimage.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 201.0,left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Teacher ', style: textStyle(FontWeight.w500, 10.12, Color(0xff9A9A9A), 'Poppins'),),
                  Text('Catherine Ellise ajjajsajhsjdf', style: textStyle(FontWeight.w700, 13.12, Color(0xff000000), 'Poppins'),),
                  Text('Lorem ipsum dolor sit amet consectetur. Sed curabitur sollicitudin arcu.',maxLines: 2, style: textStyle(FontWeight.w400, 13.12, Color(0xff6C7A9C), 'Poppins'),),
                  SizedBox(
                    height: 23,
                    width: 243,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(onTap: (){},
                          child: Text('Telegram', style: textStyle(FontWeight.w500, 13.13, Color(0xff347AE2), 'Poppins'),),
                        ),
                        InkWell(onTap: (){},
                          child: Text('Instagram', style: textStyle(FontWeight.w500, 13.13, Color(0xff347AE2), 'Poppins'),),
                        ),
                        InkWell(onTap: (){},
                          child: Text('Facebook', style: textStyle(FontWeight.w500, 13.13, Color(0xff347AE2), 'Poppins'),),
                        ),
                      ],),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 334.0, left: 45),
              child: SizedBox(
                width: 338,
                height: 41,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  InkWell(
                    onTap: (){
                      pressResult(1);
                    },
                    child: Container(
                      width: 106,
                      height: 35,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0,6),
                            color: Colors.grey.shade400
                          ),
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0,3),
                              color: followPress ? Colors.blue.shade100 : Colors.white,
                          ),
                        ],
                        color: followPress ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: Text('Follow', style: textStyle(FontWeight.w500, 13.12,followPress ? Colors.white:Colors.black, 'Poppins'),)),
                    ),
                  ),
                    InkWell(
                      onTap: (){
                        pressResult(2);
                      },
                      child: Container(
                        width: 106,
                        height: 35,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(0,6),
                                color: Colors.grey.shade400
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0,3),
                              color: portfolioPress ? Colors.blue.shade100 : Colors.white,
                            ),
                          ],
                          color: portfolioPress ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(child: Text('Portfolio', style: textStyle(FontWeight.w500, 13.12,portfolioPress ? Colors.white : Colors.black, 'Poppins'),)),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        pressResult(3);
                      },
                      child: Container(
                        width: 106,
                        height: 35,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(0,6),
                                color: Colors.grey.shade400
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0,3),
                              color: messagePrees ? Colors.blue.shade100 : Colors.white,
                            ),
                          ],
                          color: messagePrees ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(child: Text('Message', style: textStyle(FontWeight.w500, 13.12,messagePrees ? Colors.white:Colors.black, 'Poppins'),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [

              ],
            ),
          ],

        ),
      ),
    );
  }
}

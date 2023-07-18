import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/**
    Fanlar ketma ketligi uchun yaratilgan widget.
 **/
Widget fans(String image, String text) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 8.0, top: 10.0, right: 8.0, bottom: 10),
    child: Container(
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
            image: AssetImage(image),
            width: 20,
            height: 20,
          ),
          Text(
            text,
            style: TextStyle(
                color: '#5F5F5F'.toColor(),
                fontSize: 20,
                fontFamily: 'OpenSans'),
          ),
        ],
      ),
    ),
  );
}

Widget postsubjects({required username,required String userimage,required String imagename, required String coursename, required int commentcount, required bool locksubject, required double ratingcounter, required int newcostcourse, required int oldcostcourse}) {
  return Padding(
    padding: const EdgeInsets.only(top: 2.0),
    child: SizedBox(
      width: double.infinity,
      height: 423,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children:  [
              Image(
                image: AssetImage(userimage),
                width: 36,
                height: 36,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                username,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Stack(children: [
            locksubject ?
            Container(
              height: 229,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagename), fit: BoxFit.cover),
              ),
            ): Container(
              height: 229,
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.white54, BlendMode.lighten),
                    fit: BoxFit.cover,
                    image: AssetImage('assets/png/chemistry.jpeg',),
              ),),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 36,
                      height: 45,
                      child: Icon(Icons.lock_outline, color: '#0B2B57'.toColor(),size: 36,),
                    ),
                    TextButton(onPressed: (){}, child: Container(
                       width: 103,
                        height: 24,
                        decoration: BoxDecoration(
                         color: '#5790DF'.toColor(),
                        ),
                        child: Center(child: Text('Sotib olish',style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.w400),))))
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
              coursename,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w400),
            ),
          ),
          locksubject ? Container() : Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text('Teacher name', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,fontFamily: 'OpenSans',color: Colors.black),),
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
                    padding: const EdgeInsets.only(left:18.0),
                    child: Container(
                      width: 110,
                      height: 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ratingcounter.ceil()+2,
                          itemBuilder: (_,index){
                        return Icon(Icons.star, color: '#FAA307'.toColor(), size: 20,);
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
          locksubject ?
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10),
                child: Text(
                  'View all $commentcount comments',
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
          ) : Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(oldcostcourse.toString()+r'$', style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(newcostcourse.toString()+r'$', style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text('Premium', style: TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w300),),
                ),
                ],
              ),
            ),
          ),

        ],
      ),
    ),
  );
}

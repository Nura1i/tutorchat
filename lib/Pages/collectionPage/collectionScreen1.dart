import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/collectionPage/collectionDeleteScreen.dart';
import 'package:tutorchat/Pages/collectionPage/collectionItem.dart';
import 'package:tutorchat/Pages/collectionPage/collectionSearchScreen.dart';

class CollectionScreen1 extends StatefulWidget {
  const CollectionScreen1({Key? key}) : super(key: key);

  @override
  State<CollectionScreen1> createState() => _CollectionScreen1State();
}

class _CollectionScreen1State extends State<CollectionScreen1> {
  String selectdropdownitem = '';



  String likeView(int likeCounter){
    if(likeCounter~/1000>=1 && likeCounter~/1000<1000){
      return (likeCounter~/1000).toString()+'K+';
    }else
    if(likeCounter~/1000000>=1 && likeCounter~/1000000<1000){
      return (likeCounter~/1000000).toString()+'M+';
    }
    return likeCounter.toString()+'+';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding:  EdgeInsets.only(top: 4.5, right: 15),
              child: Container(
                width: 24,
                height: 24,
                child: PopupMenuButton(
                  onSelected: (v){
                    switch(v){
                      case 'Video qo`shish' : {
                        break;
                      }
                      case 'Qidirish' : {
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return CollectionSearchPage();
                        }));
                        break;
                      }
                      case 'O`chirish' : {
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return CollectionDeletePage();
                        }));
                        break;
                      }
                      case 'Tahrirlash' : {
                        break;
                      }

                    }

                  },
                  icon: Icon(Icons.more_vert, color: Colors.black,),
                  itemBuilder: (context)=>[
                    PopupMenuItem(
                        value: 'Video qo`shish',
                        enabled: true,
                        child: Row(
                          children: [
                            Icon(Icons.add_circle_outline, color: Colors.black, size: 11,),
                            Text('Video qo`shish', style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.24, fontFamily: 'Poppins', fontWeight: FontWeight.w500),),
                          ],
                        )),
                    PopupMenuItem(
                        value: 'Qidirish',
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.black, size: 11,),
                            Text('Qidirish', style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.24, fontFamily: 'Poppins', fontWeight: FontWeight.w500),),
                          ],
                        )),
                    PopupMenuItem(
                        value: 'O`chirish',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.black, size: 11,),
                            Text('O`chirish', style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.24, fontFamily: 'Poppins', fontWeight: FontWeight.w500),),
                          ],
                        )),
                    PopupMenuItem(
                        value: 'Tahrirlash',
                        child: Row(
                          children: [
                            Icon(Icons.mode, color: Colors.black, size: 11,),
                            Text('Tahrirlash', style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.24, fontFamily: 'Poppins', fontWeight: FontWeight.w500),),
                          ],
                        )),
                  ],
                ),
              ),
            )
          ],
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 4.5),
            child: Column(
              children: [
               const Text('To`plamlar', style: TextStyle(fontSize: 20, fontFamily: 'Open Sans', fontWeight: FontWeight.w600, color: Colors.black),),
               Text(' To`plam ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, fontFamily: 'NotoSans', color: Color(0xff9A9A9A)),),
              ],
            ),
          ),
          leading: Container(
            width: 44.42,
            height: 44.42,
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 24.23, color: Color(0xff130F26),),
              onPressed: (){
              Navigator.pop(context);
            },),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: collectionItem.length,
              itemBuilder: (_, index){
            return Padding(
              padding: const EdgeInsets.only(top: 9.0, left: 22, right: 22),
              child: ListTile(
                leading: Container(
                  width: 90,
                  height: 83.24,
                  decoration:   BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          image: AssetImage(collectionItem[index].image))
                  ),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return CollectionScreen1();
                              }));
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.3,
                                child: Text(collectionItem[index].subjectname, style:const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black, fontFamily: 'NotoSans'),)),),
                        Text('${collectionItem[index].videoscounter} Videos ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xff9A9A9A),fontFamily: 'NotoSans'),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                     Image(image: AssetImage('icon/video.png'), width: 10, height: 11.02,),
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      InkWell(child: Row(
                        children: [
                          Image(image: AssetImage('icon/likeicon.png'), width: 24,height: 24,),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text('${likeView(collectionItem[index].likecounter)}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff468CE7), fontFamily: 'Open Sans'),),
                          )
                        ],
                      )),
                      Text('${likeView(collectionItem[index].likecounter)}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff9A9A9A), fontFamily: 'Open Sans'),),
                      Text('${likeView(collectionItem[index].viewscounter)}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff9A9A9A), fontFamily: 'Open Sans'),),
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(width: 14, height: 18.2,),
                        InkWell(
                            onTap: (){},
                            child: Image(image: AssetImage('icon/commenticon.png'), width: 13, height: 14.31,)),
                      ],
                    )
                  ],
                ),
                trailing:  Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomRight,
                    width: 10,
                    height: 17.34,
                    child: IconButton(onPressed: (){
                    }, icon: Icon(Icons.arrow_forward_ios, color: Colors.black,size: 15,)))

              ),
            );
          }),
        ),
      ),
    );
  }
}

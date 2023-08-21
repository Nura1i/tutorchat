import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'collectionItem.dart';

class CollectionSearchPage extends StatefulWidget {
  const CollectionSearchPage({Key? key}) : super(key: key);

  @override
  State<CollectionSearchPage> createState() => _CollectionSearchPageState();
}

class _CollectionSearchPageState extends State<CollectionSearchPage> {
  String selectdropdownitem = '';
  var searchtextEditingController = TextEditingController();

  String likeView(int likeCounter){
    if(likeCounter~/1000>=1 && likeCounter~/1000<1000){
      return (likeCounter~/1000).toString()+'K+';
    }else
    if(likeCounter~/1000000>=1 && likeCounter~/1000000<1000){
      return (likeCounter~/1000000).toString()+'M+';
    }
    return likeCounter.toString()+'+';
  }
  List<CollectionItem> searchList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // actions: [
          //   Padding(
          //     padding:  EdgeInsets.only(top: 4.5, right: 15),
          //     child: Container(
          //       width: 24,
          //       height: 24,
          //       child: PopupMenuButton(
          //         onSelected: (value){
          //           setState(() {
          //             selectdropdownitem = value;
          //             pressDelete = !pressDelete;
          //           });
          //         },
          //         icon: Icon(Icons.more_vert, color: Colors.black,),
          //         itemBuilder: (context)=>[
          //
          //           !pressDelete ?
          //           PopupMenuItem(
          //               value: 'O`chirish',
          //               child: Row(
          //                 children: [
          //                   Icon(Icons.delete, color: Colors.black, size: 11,),
          //                   Text('O`chirish', style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 8.24, fontFamily: 'Poppins', fontWeight: FontWeight.w500),),
          //                 ],
          //               )) : PopupMenuItem(
          //               value: 'Bekor qilish',
          //               child: Text('Bekor qilish', style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 8.24, fontFamily: 'Poppins', fontWeight: FontWeight.w500),)),
          //         ],
          //       ),
          //     ),
          //   )
          // ],
          centerTitle: true,
          title: Card(
            elevation: 0.0,
            shadowColor: Colors.black,
            child: TextField(
              onSubmitted: (v){
                setState(() {
                  searchtextEditingController.clear();
                });
              },
              onChanged: (text){
                searchList.clear();
                setState(() {
                  collectionItem.forEach((element) {
                    if(element.subjectname.toLowerCase().indexOf(searchtextEditingController.text.toLowerCase())!=-1 || element.subjectname.toUpperCase().indexOf(searchtextEditingController.text.toUpperCase())!=-1){
                    searchList.add(element);
                    }
                  });
                });

              },
              controller: searchtextEditingController,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusColor: Colors.blue,
                prefixIcon: Icon(Icons.search),
                hintText: 'what you want to learn?',
                hintStyle: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
              ),
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
              itemCount: searchList.length,
              itemBuilder: (_, index){
                return Padding(
                  padding:  EdgeInsets.only(top: 9.0, left: 22, right: 22, bottom: index!=collectionItem.length-1 ? 0 : 80),
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
                              onTap: (){},
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.3,
                                child: Text(searchList[index].subjectname, style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black, fontFamily: 'NotoSans'),),
                              ),
                            ),
                            Text('${searchList[index].videoscounter} Videos ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xff9A9A9A),fontFamily: 'NotoSans'),),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(child: Row(
                              children: [
                                Image(image: AssetImage('icon/likeicon.png'), width: 24,height: 24,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text('${likeView(searchList[index].likecounter)}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff468CE7), fontFamily: 'Open Sans'),),
                                )
                              ],
                            )),
                            Row(
                              children: [
                                InkWell(
                                    onTap: (){},
                                    child: Image(image: AssetImage('icon/lighticon.png'), width: 24,height: 24,)),
                                Text('${likeView(searchList[index].likecounter)}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff9A9A9A), fontFamily: 'Open Sans'),),
                              ],
                            ),
                            Text('${likeView(searchList[index].viewscounter)}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff9A9A9A), fontFamily: 'Open Sans'),),
                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 14, height: 18.2,),
                            InkWell(
                                onTap: (){},
                                child: Image(image: AssetImage('icon/commenticon.png'), width: 13, height: 14.31,)),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

}

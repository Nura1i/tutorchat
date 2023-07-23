import 'package:flutter/material.dart';
import 'package:tutorchat/widgets/usersearchwidget.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Color colorOne = Color(0xffDCEAFE);
  Color colorTwo = Color(0xffF3F3F3);
  Color colorThree = Color(0xffF3F3F3);
  // Tanlanganni ranglab beradi
  selectButton(int index){
    setState(() {
      switch(index){
        case 0 : {
          colorOne = Color(0xffDCEAFE);
          colorTwo = Color(0xffF3F3F3);
          colorThree = Color(0xffF3F3F3);
          break;
        }
        case 1 : {
          colorTwo = Color(0xffDCEAFE);
          colorOne = Color(0xffF3F3F3);
          colorThree = Color(0xffF3F3F3);
          break;
        }
        case 2 : {
          colorThree = Color(0xffDCEAFE);
          colorOne = Color(0xffF3F3F3);
          colorTwo = Color(0xffF3F3F3);
          break;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 30, right: 30),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.shade200,
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.white,
                    offset: Offset(-5, -5),
                  ),
                ]),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 15,
                      ),
                      hintText: 'username',
                      hintStyle: TextStyle(
                        color: Color(0xff9A9A9A),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 118.0, left: 30, right: 30),
              child: Row(
                children: [
                InkWell(
                  onTap: (){
                    selectButton(0);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorOne,
                    ),
                  width: 100,
                  height: 37,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('icon/user.png'), width: 16,height: 16,),
                      SizedBox(width: 5,),
                      Text('User', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w400,fontSize: 20, color: Color(0xff5F5F5F)),)
                    ],
                  ),
              ),
                ),
                  InkWell(
                    onTap: (){
                      selectButton(1);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorTwo,
                      ),
                      width: 100,
                      height: 37,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('icon/video.png'), width: 16,height: 16,),
                          SizedBox(width: 5,),
                          Text('Video', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w400,fontSize: 20, color: Color(0xff5F5F5F)),)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      selectButton(2);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorThree,
                      ),
                      width: 100,
                      height: 37,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('icon/twousers.png'), width: 22,height: 16,),
                          SizedBox(width: 5,),
                          Text('Group', style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w400,fontSize: 20, color: Color(0xff5F5F5F)),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 185.0,left: 30,right: 30),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.8,
                child: ListView.builder(
                    itemCount: 35,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_,index){
                  return UserSearchWidget(userimage: 'assets/png/userpicture.png',username: 'Jane Cooper',);
                }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

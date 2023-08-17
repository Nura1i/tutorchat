import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';

import '../../models/item.dart';
import '../../widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? searchtextEditingController = TextEditingController();
  int informations = 13;
  int sendcounter = 223;

  @override
  Widget build(BuildContext context) {
    EdgeInsets paddingLeft = const EdgeInsets.only(left: 27);
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: paddingLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tutor Chat',
                      style: TextStyle(
                          fontSize: 25,
                          color: '#000000'.toColor(),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: SizedBox(
                            width: 24,
                            height: 29,
                            child: Badge(
                                backgroundColor: 'F8361B'.toColor(),
                                label: Text(
                                  informations.toString(),
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8),
                                ),
                                child: const Image(
                                  image: AssetImage('icon/bellicon.png'),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Badge(
                                backgroundColor: 'F8361B'.toColor(),
                                //  alignment: const AlignmentDirectional(11, -7),
                                label: Text(
                                  sendcounter.toString(),
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8),
                                ),
                                child: const Image(
                                  image: AssetImage('icon/sendicon.png'),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: paddingLeft,
                child: const Text(
                  'Start Learning',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 27),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(6.0, 6.0),
                        blurRadius: 15,
                        spreadRadius: 1.0,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-6.0, -6.0),
                        blurRadius: 15,
                        spreadRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Card(
                    elevation: 0.0,
                    shadowColor: Colors.black,
                    child: TextField(
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: fanslist.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 30.0 : 0),
                        child: Fans(image :fanslist[index].imagename,text: fanslist[index].name),
                      );
                    }),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (_, index) {
                return PostSubjects(
                    username: 'Username',
                    userimage: 'assets/png/userpicture.png',
                    imagename: 'assets/png/math.png',
                    coursename: 'Matematika Bo`yicha Video Kurs(Lar)',
                    commentcount: 50,
                    locksubject: index == 2 ? false : true,
                    ratingcounter: 3,
                    newcostcourse: 435,
                    oldcostcourse: 640);
              }),
        )
      ]),
    );
  }
}

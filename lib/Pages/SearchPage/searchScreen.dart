import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tutorchat/Repositories/services/service.dart';
import 'package:tutorchat/models/searchUserModel.dart';
import 'package:tutorchat/widgets/usersearchwidget.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Color colorOne = const Color(0xffDCEAFE);
  Color colorTwo = const Color(0xffF3F3F3);
  Color colorThree = const Color(0xffF3F3F3);
  // Tanlanganni ranglab beradi
  selectButton(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            colorOne = const Color(0xffDCEAFE);
            colorTwo = const Color(0xffF3F3F3);
            colorThree = const Color(0xffF3F3F3);
            break;
          }
        case 1:
          {
            colorTwo = const Color(0xffDCEAFE);
            colorOne = const Color(0xffF3F3F3);
            colorThree = const Color(0xffF3F3F3);
            break;
          }
        case 2:
          {
            colorThree = const Color(0xffDCEAFE);
            colorOne = const Color(0xffF3F3F3);
            colorTwo = const Color(0xffF3F3F3);
            break;
          }
      }
    });
  }

  List<SerachUserData> listOfDatas = [];
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 30, right: 30),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade200,
                      offset: const Offset(4, 4),
                    ),
                    const BoxShadow(
                      blurRadius: 10,
                      color: Colors.white,
                      offset: Offset(-5, -5),
                    ),
                  ]),
                  child: TextField(
                    controller: searchController,
                    onChanged: (result) async {
                      if (result.isNotEmpty) {
                        Response response = await Network.searchUser(result);
                        if (response.statusCode == 200) {
                          setState(() {
                            listOfDatas = serachUserDataFromJson(response.body);
                          });
                        }
                      } else {
                        setState(() {
                          listOfDatas = [];
                        });
                      }
                    },
                    decoration: const InputDecoration(
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 118.0, left: 30, right: 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      selectButton(0);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorOne,
                      ),
                      height: 37,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('icon/user.png'),
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'User',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff5F5F5F)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectButton(1);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorTwo,
                      ),
                      height: 37,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('icon/video.png'),
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Video',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff5F5F5F)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectButton(2);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorThree,
                      ),
                      height: 37,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('icon/twousers.png'),
                              width: 22,
                              height: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Group',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff5F5F5F)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 185.0, left: 30, right: 30),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    itemCount: listOfDatas.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return FutureBuilder(
                        future: getPhoto(listOfDatas[index].image),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.blue),
                                backgroundColor: Colors.grey[200],
                                value: null,
                              ),
                            );
                          }
                          if (snapshot.hasData) {}
                          return UserSearchWidget(
                            userId: listOfDatas[index].id,
                            userimage: snapshot.data,
                            name: listOfDatas[index].fullName,
                            username: listOfDatas[index].userName,
                          );
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Future<Uint8List> getPhoto(imageId) async {
  http.Response responsee = await http.get(
    Uri.parse(imageId),
    headers: {
      'Content-Type': 'image/jpeg',
      'Authorization': 'Bearer $userToken'
    },
  );

  return responsee.bodyBytes;
}

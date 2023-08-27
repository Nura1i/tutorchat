import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/AccountPage/userDataScreen.dart';
import 'package:tutorchat/Pages/HomePage/homeScreen.dart';
import 'package:tutorchat/Pages/SearchPage/searchScreen.dart';
import 'package:tutorchat/models/profileModel.dart';

import '../Pages/createPostPage/createPostScreen1.dart';

class ControllerPage extends StatefulWidget {
  final userData;
  const ControllerPage({Key? key, required this.userData}) : super(key: key);

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  Widget? meanHome = const HomeScreen();
  ProfileModel? profileData;
  @override
  //GET USER DATA FOR PORIFLE
  void initState() {
    // final response =
    //     Network.GETUSERDATA('/api/profile/view_own_profile', widget.userToken);
    profileData = widget.userData;
    super.initState();
  }

  void controllerPage(int index) {
    // profileData != null
    //     ? const HomeScreen()
    //     : const Center(
    //         child: CircularProgressIndicator(),
    //       );
    setState(() {
      switch (index) {
        case 0:
          {
            // HomePagedagi asosiy qismi.
            meanHome = const HomeScreen();
            break;
          }
        case 1:
          {
            meanHome = const SearchScreen();
            break;
          }
        case 2:
          {
            meanHome = const CreatePost1();
            break;
          }
        case 3:
          {
            break;
          }
        case 4:
          {
            //meanHome = UserDataScreen(profileData: profileData!);
            meanHome = UserDataScreen(
              profileData: profileData!,
            );
            // meanHome = profileData != null
            //     ? UserDataScreen(
            //         profileData: profileData!,
            //       )
            //     : const Center(
            //         child: CircularProgressIndicator(
            //           color: Color.fromARGB(255, 90, 113, 132),
            //         ),
            //       );

            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: meanHome,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: 0,
          onTap: (index) {
            controllerPage(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
                label: 'Add Post'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_border,
                  color: Colors.black,
                ),
                label: 'Star'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                ),
                label: 'Account'),
          ]),
    );
  }
}

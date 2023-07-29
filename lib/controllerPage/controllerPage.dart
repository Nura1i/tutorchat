import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/HomePage/homeScreen.dart';
import 'package:tutorchat/Pages/SearchPage/searchScreen.dart';

import '../Pages/CreatePost/createPostScreen1.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({Key? key}) : super(key: key);

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  Widget? meanHome = const HomeScreen();

  void controllerPage(int index) {
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
            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}

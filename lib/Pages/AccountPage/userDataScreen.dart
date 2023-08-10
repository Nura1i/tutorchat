import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:tutorchat/Pages/AccountPage/profile.dart';
import 'package:tutorchat/extentions.dart';

import '../../widgets/textStyle.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  List<String> posts = [
    'assets/png/passordScreen.png',
    'assets/png/accountuserimage.png',
    'assets/png/accountuserimage.png'
  ];
  final items = ['English', 'Русский', "O'zbekcha"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 1,
        shadowColor: const Color.fromARGB(255, 232, 230, 230),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              onMenuStateChange: (isOpen) {},
              iconStyleData: const IconStyleData(
                  icon: Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 24,
              )),
              isExpanded: false,

              items: items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              // value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  //    selectedValue = value;
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          '@Catherina',
          style: textStyle(FontWeight.w700, 16, Colors.black, 'Poppins'),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScolled) {
            return [
              SliverStickyHeader(
                sticky: false,
                header: const ProfileScreen(),
              ),
              SliverPersistentHeader(
                delegate: MyDelegate(
                  TabBar(
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    overlayColor: const MaterialStatePropertyAll(Colors.white),
                    indicatorColor: '6C7A9C'.toColor(),
                    indicatorWeight: 3,
                    isScrollable: true,
                    padding: const EdgeInsets.only(left: 20),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(
                          child: Text(
                        'All',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.15),
                      )),
                      Tab(
                          child: Text(
                        'Bepul darslar',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.15),
                      )),
                      Tab(
                          child: Text(
                        'Premium darslar',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.15),
                      )),
                      Tab(
                          child: Text(
                        'Saved',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.15),
                      )),
                    ],
                  ),
                ),
                floating: true,
                pinned: true,
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [1, 2, 3, 4]
                  .map((tab) => GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                        children: posts
                            .map((e) => Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(e),
                                          fit: BoxFit.fill)),
                                ))
                            .toList(),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.3,
            color: Color.fromARGB(255, 232, 230, 230),
          ),
        ),
      ),
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

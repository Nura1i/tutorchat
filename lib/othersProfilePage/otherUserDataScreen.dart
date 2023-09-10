import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:tutorchat/extentions.dart';
import 'package:tutorchat/models/profileModel.dart';
import 'package:tutorchat/othersProfilePage/otherProfile.dart';

import '../Pages/AccountPage/components.dart';
import '../Pages/collectionPage/collectionScreen1.dart';

class OtherUserDataScreen extends StatefulWidget {
  final ProfileModel profileData;

  const OtherUserDataScreen({super.key, required this.profileData});

  @override
  State<OtherUserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<OtherUserDataScreen> {
  List<String> posts = [
    'assets/png/passordScreen.png',
    'assets/png/accountuserimage.png',
    'assets/png/accountuserimage.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 1,
          shadowColor: const Color.fromARGB(255, 232, 230, 230),
          automaticallyImplyLeading: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: const [],
          centerTitle: true,
          title: Text(widget.profileData.username,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, isScolled) {
              return [
                SliverStickyHeader(
                  sticky: false,
                  header: OtherProfile(profileData: widget.profileData),
                ),
                SliverPersistentHeader(
                  delegate: MyDelegate(
                    TabBar(
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.white),
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
                              .map((e) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return const CollectionScreen1();
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(e),
                                              fit: BoxFit.fill)),
                                    ),
                                  ))
                              .toList(),
                        ))
                    .toList(),
              ),
            ),
          ),
        ));
  }
}

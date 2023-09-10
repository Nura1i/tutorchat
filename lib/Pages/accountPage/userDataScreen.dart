import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:tutorchat/Pages/AccountPage/profile.dart';
import 'package:tutorchat/blocs/profile%20cubit/profile_cubit.dart';
import 'package:tutorchat/blocs/profile%20cubit/profile_state.dart';

import 'package:tutorchat/extentions.dart';
import 'package:tutorchat/models/profileModel.dart';

import '../../models/userFollowingListModel.dart';
import '../collectionPage/collectionScreen1.dart';
import 'components.dart';

class UserDataScreen extends StatefulWidget {
  final ProfileModel profileData;

  const UserDataScreen({super.key, required this.profileData});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  List<String> posts = [
    'assets/png/passordScreen.png',
    'assets/png/accountuserimage.png',
    'assets/png/accountuserimage.png'
  ];
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getUserFollowingListFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool load = false;
    List<UserFollowingListModel> followingLs = [];
    return BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, profileState) {
      if (profileState is ProfileLoading) {
        load = profileState.loading;
        log(load.toString());
      }
      if (profileState is ProfileFollowingList) {
        followingLs = profileState.followingList;
      }

      return load == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                scrolledUnderElevation: 1,
                shadowColor: const Color.fromARGB(255, 232, 230, 230),
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      customButton: const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.more_vert,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      items: [
                        ...MenuItems.firstItems.map(
                          (item) => DropdownMenuItem<MenuItem>(
                            value: item,
                            child: MenuItems.buildItem(item),
                          ),
                        ),
                        const DropdownMenuItem<Divider>(
                            enabled: false, child: Divider()),
                      ],
                      onChanged: (value) {},
                      dropdownStyleData: DropdownStyleData(
                        width: 160,
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        offset: const Offset(0, 8),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        customHeights: [
                          ...List<double>.filled(
                              MenuItems.firstItems.length, 48),
                          8,
                        ],
                        padding: const EdgeInsets.only(left: 16, right: 16),
                      ),
                    ),
                  ),
                ],
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
                        header: ProfileScreen(
                          profileData: widget.profileData,
                        ),
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
    });
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';

class FollowingSceen extends StatefulWidget {
  const FollowingSceen({super.key});

  @override
  State<FollowingSceen> createState() => _FollowersScreenState();
}

bool follow = true;

class _FollowersScreenState extends State<FollowingSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: const Text(
          'Following users',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                    color: '#F3FBFF'.toColor(),
                    borderRadius: BorderRadius.circular(13)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: 'Search followers',
                        hintStyle: TextStyle(color: '96A0B5'.toColor())),
                  ),
                ),
              ),
            )),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 30,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    maxRadius: 28,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          'Jane cooper',
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 15,
                              color: '292C38'.toColor(),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 13,
                            color: '96A0B5'.toColor(),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    follow = !follow;
                    log('wors');
                  });
                },
                child: follow == false
                    ? Padding(
                        padding: const EdgeInsets.only(right: 25, bottom: 10),
                        child: Text(
                          'Unfollow',
                          style: TextStyle(
                              color: '292C38'.toColor(), fontSize: 13),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 25),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                              fontSize: 14, color: '347AE2'.toColor()),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

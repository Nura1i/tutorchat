import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/accountPage/folllowingPage/followingScreen.dart';
import 'package:tutorchat/extentions.dart';
import 'package:tutorchat/othersProfilePage/response.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../const.dart';
import '../../models/profileModel.dart';
import '../../widgets/textStyle.dart';

class OtherProfile extends StatefulWidget {
  final ProfileModel profileData;
  const OtherProfile({super.key, required this.profileData});

  @override
  State<OtherProfile> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<OtherProfile> {
  String? userPhoto;

  @override
  // void initState() {
  //     fetchData(widget.profileData.image);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: ClipOval(
                  child: Image.memory(
                    constOtherUserPhoto!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const FollowersScreen(),
                    // ));
                  },
                  child: Column(
                    children: [
                      const Text(
                        '${1}k',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Followers',
                        style: textStyle(
                            FontWeight.w600, 13, Colors.black, 'Poppins'),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FollowingSceen(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        '${342}',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Following',
                        style: textStyle(
                            FontWeight.w600, 13, Colors.black, 'Poppins'),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      '${105}',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Lessons',
                      style: textStyle(
                          FontWeight.w600, 13, Colors.black, 'Poppins'),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.profileData.type,
            style: textStyle(
                FontWeight.w500, 11, const Color(0xff9A9A9A), 'Poppins'),
          ),
          Text(
            widget.profileData.fullName,
            style: textStyle(
                FontWeight.w700, 14, const Color(0xff000000), 'Poppins'),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.profileData.description,
            maxLines: 2,
            style: textStyle(
                FontWeight.w400, 14, const Color(0xff6C7A9C), 'Poppins'),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 23,
            width: 243,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    final telegram = Uri.parse(widget.profileData.telegram);
                    if (await canLaunchUrl(telegram)) {
                      launchUrl(telegram, mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Text(
                    'Telegram',
                    style: textStyle(
                        FontWeight.w500, 13.13, '347AE2'.toColor(), 'Poppins'),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final instagram = Uri.parse(widget.profileData.instagram);
                    if (await canLaunchUrl(instagram)) {
                      launchUrl(instagram,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Text(
                    'Instagram',
                    style: textStyle(
                        FontWeight.w500, 13.13, '347AE2'.toColor(), 'Poppins'),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final facebook = Uri.parse(widget.profileData.facebook);
                    if (await canLaunchUrl(facebook)) {
                      launchUrl(facebook, mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Text(
                    'Facebook',
                    style: textStyle(
                        FontWeight.w500, 13.13, '347AE2'.toColor(), 'Poppins'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 41,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    await followProfile(widget.profileData.username);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 35,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                            color: Colors.grey.shade400),
                        const BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 3),
                          color: Colors.white,
                        ),
                      ],
                      color: '5790DF'.toColor(),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                        child: Text('Follow',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 35,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                            color: Colors.grey.shade400),
                        const BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 3),
                          color: Colors.white,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                        child: Text('Portfolio',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const PortfolioScreen(),
                    // ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 35,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                            color: Colors.grey.shade400),
                        const BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 3),
                          color: Colors.white,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                        child: Text('Message',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

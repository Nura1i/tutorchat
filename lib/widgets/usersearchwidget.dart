import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../othersProfilePage/response.dart';

class UserSearchWidget extends StatefulWidget {
  final String userId;
  final Uint8List? userimage;
  final String name;
  final String username;
  const UserSearchWidget(
      {super.key,
      required this.userId,
      required this.userimage,
      required this.name,
      required this.username});

  @override
  State<UserSearchWidget> createState() => _UserSearchWidgetState();
}

class _UserSearchWidgetState extends State<UserSearchWidget> {
  Uint8List? userPhoto;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await fetchDataUser(context, widget.userId);
        //await getOtherProfileDataFunc(context, userToken, widget.userId);
      },
      child: ListTile(
        leading: SizedBox(
            width: 50,
            height: 50,
            child: ClipOval(
                child: widget.userimage != null
                    ? Image.memory(
                        widget.userimage!,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox())),
        title: Text(
          widget.name,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade900,
              fontFamily: 'OpenSans'),
        ),
        subtitle: Text(
          widget.username,
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xff96A0B5)),
        ),
      ),
    );
  }
}

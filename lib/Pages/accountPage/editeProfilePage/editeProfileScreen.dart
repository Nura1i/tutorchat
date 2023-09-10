import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/accountPage/editeProfilePage/commponents.dart';
import 'package:tutorchat/extentions.dart';

import '../../../const.dart';

class EditeProfileScreen extends StatefulWidget {
  const EditeProfileScreen({super.key});

  @override
  State<EditeProfileScreen> createState() => EditeProfileScreenState();
}

class EditeProfileScreenState extends State<EditeProfileScreen> {
  TextEditingController nameController =
      TextEditingController(text: profileDataConst!.fullName);
  TextEditingController usernameController =
      TextEditingController(text: profileDataConst!.username);
  TextEditingController desController =
      TextEditingController(text: profileDataConst!.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.check,
              color: '1877F2'.toColor(),
              size: 33,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Transform.rotate(
            angle: 0.785398,
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 40,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Edite profile',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: SizedBox(
                width: 90,
                height: 90,
                child: ClipOval(
                  child: Image.memory(
                    constUserPhoto!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Change profile photo',
                style: TextStyle(color: '1877F2'.toColor(), fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            const Divider(
              height: 15,
              indent: 20,
              endIndent: 20,
              thickness: 1,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                  hintStyle: TextStyle(color: '757575'.toColor()),
                  contentPadding: const EdgeInsets.only(left: 20)),
            ),
            const Divider(
              height: 10,
              indent: 20,
              endIndent: 20,
              thickness: 1,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username',
                  hintStyle: TextStyle(color: '757575'.toColor()),
                  contentPadding: const EdgeInsets.only(left: 20)),
            ),
            const Divider(
              height: 15,
              indent: 20,
              endIndent: 20,
              thickness: 1,
            ),
            TextField(
              controller: desController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Bio',
                  hintStyle: TextStyle(color: '757575'.toColor()),
                  contentPadding: const EdgeInsets.only(left: 20)),
            ),
            const Divider(
              height: 15,
              indent: 20,
              endIndent: 20,
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                alertForLinks(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Add Links',
                  style: TextStyle(color: Color(0xFF757575), fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

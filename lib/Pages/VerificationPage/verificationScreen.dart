import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';

import '../PhoneVerificationPage/phoneVerifScreen.dart';
import '../mailVerifPage/mailVerifScreen.dart';

class verifyScreen extends StatefulWidget {
  const verifyScreen({super.key});

  @override
  State<verifyScreen> createState() => _verifyScreenState();
}

class _verifyScreenState extends State<verifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 110,
                ),
                Image.asset(
                  'assets/png/verification.png',
                  height: 99,
                  width: 107,
                ),
                const SizedBox(
                  height: 150,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const phoneVerifScreen(),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: 'F5F5F5'.toColor()),
                    child: Text(
                      'Continue with phone',
                      style: TextStyle(
                          color: '969696'.toColor(),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'or',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const mailVerifScreen(),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: 'F5F5F5'.toColor()),
                    child: Text(
                      'Continue with Email',
                      style: TextStyle(
                          color: '969696'.toColor(),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 39,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(color: '#9FC9EF'.toColor()),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

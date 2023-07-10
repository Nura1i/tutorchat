import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';

import '../VerificationPage/verificationScreen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                'assets/png/Logo.png',
                width: 73,
                height: 80,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Login Account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.account_circle_outlined,
                  size: 27,
                )
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              'Hello, Welcome back to your account.',
              style: TextStyle(
                  color: '#969696'.toColor(),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10),
                height: 56,
                decoration: BoxDecoration(
                  color: 'F5F5F5'.toColor(),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Your username',
                      hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: '969696'.toColor())),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10),
                height: 56,
                decoration: BoxDecoration(
                  color: 'F5F5F5'.toColor(),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black,
                      ),
                      hintText: 'Your password',
                      hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: '969696'.toColor())),
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                Text(
                  'Remember password',
                  style: TextStyle(
                      color: '5C5C5C'.toColor(),
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: '347AE2'.toColor()),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('or'),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: '347AE2'.toColor()),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 56,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(color: '#9FC9EF'.toColor()),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'If you don’t have an account',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: '347AE2'.toColor()),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DottedBorder(
                      strokeWidth: 2,
                      radius: const Radius.circular(6),
                      dashPattern: const [6, 5, 5, 4],
                      padding: const EdgeInsets.all(5),
                      borderType: BorderType.RRect,
                      color: '9747FF'.toColor(),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const verifyScreen(),
                          ));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

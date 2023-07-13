import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';

import '../registerPage/components.dart';

class createPasswordScreen extends StatefulWidget {
  const createPasswordScreen({super.key});

  @override
  State<createPasswordScreen> createState() => _createPasswordScreenState();
}

class _createPasswordScreenState extends State<createPasswordScreen> {
  TextEditingController createPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Center(
                  child: Image.asset(
                    'assets/png/passordScreen.png',
                    width: 55,
                    height: 67,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Create password',
                  style: TextStyle(
                      fontSize: 20,
                      color: '5C5C5C'.toColor(),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 50,
                ),
                form(usernameController, 'Create username'),
                const SizedBox(
                  height: 20,
                ),
                form(createPassword, 'Create password'),
                const SizedBox(
                  height: 20,
                ),
                form(confirmPassword, 'Confirm password'),
                const SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const registerUserDataScreen(),
                    //));
                  },
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(color: '#9FC9EF'.toColor()),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

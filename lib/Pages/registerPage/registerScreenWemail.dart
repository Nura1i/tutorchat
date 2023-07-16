import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/registerPage/components.dart';
import 'package:tutorchat/Pages/registerPage/registerUserDataWemailScreen.dart';
import 'package:tutorchat/extentions.dart';
import 'package:tutorchat/widgets/sms_validator.dart';

class registerScreenWemail extends StatefulWidget {
  final userToken;
  const registerScreenWemail({super.key, required this.userToken});

  @override
  State<registerScreenWemail> createState() => _registerScreenWphoneState();
}

class _registerScreenWphoneState extends State<registerScreenWemail> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 65,
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
                      'Register',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                  'Hello, Welcome to TutorChat!',
                  style: TextStyle(
                      color: '#969696'.toColor(),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 50,
                ),
                form(usernameController, 'Username'),
                const SizedBox(
                  height: 20,
                ),
                form(phoneController, 'Phone number'),
                const SizedBox(
                  height: 20,
                ),
                form(passwordController, 'Create password'),
                const SizedBox(
                  height: 20,
                ),
                form(confirmController, 'Confirm password'),
                const SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: () {
                    if (usernameController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmController.text.isEmpty ||
                        confirmController.text != passwordController.text) {
                      smsValidator(context, 'Valid data');
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => registerUserDataWemailScreen(
                            userToken: widget.userToken,
                            password: passwordController.text,
                            confirmPassword: confirmController.text,
                            phone: phoneController.text,
                            username: usernameController.text),
                      ));
                    }
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

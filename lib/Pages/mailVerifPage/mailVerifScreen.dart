import 'package:flutter/material.dart';
import 'package:tutorchat/extentions.dart';

import 'mailPinCodeScreen.dart';

class mailVerifScreen extends StatefulWidget {
  const mailVerifScreen({super.key});

  @override
  State<mailVerifScreen> createState() => _phoneVerifScreenState();
}

class _phoneVerifScreenState extends State<mailVerifScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                  child: Image(
                image: AssetImage('assets/png/LanguagePageLogo.png'),
              )),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Image.asset(
                    'assets/png/repairMail.png',
                    width: 70,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Verification',
                    style: TextStyle(
                        fontSize: 20,
                        color: '5C5C5C'.toColor(),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Verificate with Email',
                    style: TextStyle(
                        fontSize: 16,
                        color: '969696'.toColor(),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.16,
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
                    color: 'F5F5F5'.toColor(),
                    child: TextField(
                      cursorColor: Colors.blueGrey,
                      controller: emailController,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 15),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: '969696'.toColor(),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const mailPinScreen(),
                      ));
                    },
                    child: Container(
                      height: 56,
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(color: '#9FC9EF'.toColor()),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

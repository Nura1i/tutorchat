import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tutorchat/extentions.dart';

import 'createPasswordScreen.dart';

class repairPhoneScreen extends StatefulWidget {
  final phoneNumber;
  const repairPhoneScreen({super.key, required this.phoneNumber});

  @override
  State<repairPhoneScreen> createState() => _repairPhoneScreenState();
}

class _repairPhoneScreenState extends State<repairPhoneScreen> {
  TextEditingController smsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 44,
      textStyle: const TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: 'D9D9D9'.toColor(),
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      ),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  Image.asset(
                    'assets/png/enterPincode.png',
                    width: 55,
                    height: 55,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Repair password',
                    style: TextStyle(
                        fontSize: 20,
                        color: '5C5C5C'.toColor(),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Shu raqamga yuborilgan sms kodni kiriting',
                    style: TextStyle(
                        fontSize: 15,
                        color: '969696'.toColor(),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${widget.phoneNumber}',
                    style: TextStyle(
                        color: '347AE2'.toColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 105,
                  ),
                  Pinput(
                    length: 6,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    controller: smsController,
                    defaultPinTheme: defaultPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    showCursor: true,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Raqamni o'zgartirish",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                        Text(
                          "Qayta jo'natish",
                          style: TextStyle(
                              color: '347AE2'.toColor(),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const createPasswordScreen(),
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

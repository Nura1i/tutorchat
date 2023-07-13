import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/PhoneVerificationPage/pinCodeScreen.dart';
import 'package:tutorchat/extentions.dart';

class phoneVerifScreen extends StatefulWidget {
  const phoneVerifScreen({super.key});

  @override
  State<phoneVerifScreen> createState() => _phoneVerifScreenState();
}

class _phoneVerifScreenState extends State<phoneVerifScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
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
                    height: 90,
                  ),
                  Image.asset(
                    'assets/png/phoneVerify.png',
                    width: 50,
                    height: 71,
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
                    'Verificate with phone number',
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
                    color: 'F5F5F5'.toColor(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            '+998',
                            style: TextStyle(
                                fontSize: 16, color: '969696'.toColor()),
                          ),
                        ),
                        const Text(
                          "|",
                          style: TextStyle(fontSize: 33, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          cursorColor: Colors.blueGrey,
                          maxLength: 9,
                          controller: phoneController,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontSize: 15),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: 'Enter Number',
                            hintStyle: TextStyle(
                                fontSize: 15, color: '969696'.toColor()),
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const pinCodeScreen(),
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

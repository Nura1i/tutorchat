import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:http/http.dart';
import 'package:pinput/pinput.dart';
import 'package:tutorchat/Pages/mailVerifPage/mailVerifScreen.dart';
import 'package:tutorchat/Pages/mailVerifPage/responses.dart';
import 'package:tutorchat/const.dart';
import 'package:tutorchat/extentions.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:tutorchat/widgets/sms_validator.dart';

import '../../models/tokenModel.dart';
import '../registerPage/registerScreenWemail.dart';

class mailPinScreen extends StatefulWidget {
  final email;
  const mailPinScreen({super.key, required this.email});

  @override
  State<mailPinScreen> createState() => _mailPinScreenState();
}

class _mailPinScreenState extends State<mailPinScreen> {
  TextEditingController smsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    CountdownTimerController? controller;
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
                    height: 125,
                  ),
                  Image.asset(
                    'assets/png/pinMail.png',
                    width: 50,
                    height: 50,
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
                  const SizedBox(
                    height: 90,
                  ),
                  Text(
                    'Shu emailga yuborilgan sms kodni kiriting',
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
                    widget.email,
                    style: TextStyle(
                        color: '347AE2'.toColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const mailVerifScreen(),
                            ));
                          },
                          child: const Text(
                            "Emailni o'zgartirish",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                        CountdownTimer(
                          controller: controller,
                          widgetBuilder: (context, time) {
                            if (time == null) {
                              return GestureDetector(
                                  onTap: () async {
                                    setState(() {});
                                    await mailVerifFunc(widget.email!, context);
                                  },
                                  child: Text(
                                    "Qayta jo'natish",
                                    style: TextStyle(
                                        color: '347AE2'.toColor(),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ));
                            }
                            return Text(
                                '0${time.min ?? '0'}:${time.sec! < 10 ? '0${time.sec}' : '${time.sec}'}');
                          },
                          endTime: endTime,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Response response = await mailPinVerifFunc(
                          widget.email, smsController.text);

                      if (response.statusCode == 200) {
                        final token = tokenModelFromJson(response.body);
                        userToken = token.token;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              registerScreenWemail(userToken: token.token),
                        ));
                      } else {
                        smsValidator(context, 'SMS kod xato');
                      }
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

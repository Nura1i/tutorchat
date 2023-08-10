import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:tutorchat/Pages/repairPage/repairMailScreen.dart';
import 'package:tutorchat/Pages/repairPage/response.dart';
import 'package:tutorchat/extentions.dart';

import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../../widgets/sms_validator.dart';

class repairScreen extends StatefulWidget {
  const repairScreen({super.key});

  @override
  State<repairScreen> createState() => _repairScreenState();
}

class _repairScreenState extends State<repairScreen> {
  var selectedType = 1;

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Image.asset(
                    'assets/png/repairScreen.png',
                    width: 55,
                    height: 71,
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
                  Text(
                    selectedType == 1
                        ? 'Send code to your number'
                        : 'Send code to your Email',
                    style: TextStyle(
                        fontSize: 16,
                        color: '969696'.toColor(),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: '9FC9EF'.toColor(),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedType = 1;
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: selectedType == 1
                                  ? BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          inset: true,
                                          color: const Color(0xff000000)
                                              .withOpacity(0.4),
                                          // color: Colors.grey.withOpacity(0.8),
                                          blurRadius: 1,
                                          spreadRadius: 0,
                                          offset: const Offset(-2, 2),
                                        ),
                                        BoxShadow(
                                          inset: true,
                                          color: Colors.white.withOpacity(0.7),
                                          // color: Colors.grey.withOpacity(0.8),
                                          blurRadius: 1,
                                          spreadRadius: 0,
                                          offset: const Offset(2, -2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0xffF5F5F5)
                                          .withOpacity(0.5),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  'Phone',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: '969696'.toColor(),
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedType = 2;
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: selectedType == 2
                                  ? BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          inset: true,
                                          color: const Color(0xff000000)
                                              .withOpacity(0.4),
                                          // color: Colors.grey.withOpacity(0.8),
                                          blurRadius: 1,
                                          spreadRadius: 0,
                                          offset: const Offset(-2, 2),
                                        ),
                                        BoxShadow(
                                          inset: true,
                                          color: Colors.white.withOpacity(0.7),
                                          // color: Colors.grey.withOpacity(0.8),
                                          blurRadius: 1,
                                          spreadRadius: 0,
                                          offset: const Offset(2, -2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0xffF5F5F5)
                                          .withOpacity(0.5),
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 45),
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: '969696'.toColor(),
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  selectedType == 2
                      ? Container(
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
                        )
                      : Container(
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
                                style:
                                    TextStyle(fontSize: 33, color: Colors.grey),
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
                    height: 150,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (selectedType == 1) {
                        if (phoneController.text.length == 9) {
                          int? numb = int.tryParse(phoneController.text);
                          if (numb is num) {
                            phoneVerifRepairFunc(
                                '+998${phoneController.text}', context);
                          } else {
                            smsValidator(context, 'not valid phoneNumber');
                          }
                        } else {
                          smsValidator(context, 'not valid phoneNumber');
                        }
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const repairMailScreen(),
                        ));
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

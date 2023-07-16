import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutorchat/extentions.dart';
import 'package:tutorchat/widgets/sms_validator.dart';

import '../LoginPage/loginPageScreen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key, required this.title});
  final String title;

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final items = ['English', 'Русский', "O'zbekcha"];
  String? selectedValue;
  Icon icon = const Icon(Icons.keyboard_arrow_down_sharp);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                  child: Image(
                image: AssetImage('assets/png/LanguagePageLogo.png'),
              )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/GlobusForLanguage.svg',
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Language',
                        style: TextStyle(
                            color: '#5C5C5C'.toColor(),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans'),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 110,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    // alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(color: '#F5F5F5'.toColor()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        onMenuStateChange: (isOpen) {
                          setState(() {
                            if (isOpen) {
                              icon = const Icon(Icons.keyboard_arrow_up_sharp);
                            } else {
                              icon =
                                  const Icon(Icons.keyboard_arrow_down_sharp);
                            }
                          });
                        },
                        iconStyleData: IconStyleData(icon: icon),
                        isExpanded: true,
                        hint: Text(
                          'Select Language',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: 140,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 135,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      if (selectedValue != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const loginScreen(),
                          ),
                        );
                      } else {
                        smsValidator(context, 'Select Langugage');
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

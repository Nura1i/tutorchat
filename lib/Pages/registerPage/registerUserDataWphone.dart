import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/registerPage/components.dart';
import 'package:tutorchat/extentions.dart';

class registerUserDataWphoneScreen extends StatefulWidget {
  final username;
  final email;
  final password;
  final confirmPassword;
  const registerUserDataWphoneScreen(
      {super.key,
      required this.username,
      required this.email,
      required this.password,
      required this.confirmPassword});

  @override
  State<registerUserDataWphoneScreen> createState() =>
      _registerUserDataScreenState();
}

class _registerUserDataScreenState extends State<registerUserDataWphoneScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController tgLinkController = TextEditingController();
  TextEditingController inLinkController = TextEditingController();
  TextEditingController fbLinkController = TextEditingController();
  final speciality = ['Teacher', "Student"];
  final gender = ['Male', "Female"];
  String? selectedSpeciality;
  String? selectedGender;
  Icon icon = const Icon(Icons.keyboard_arrow_down_sharp);
  var photo;
  _update() {
    setState(() {
      log('message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () async {
                  await displayBottomSheet(context, _update);
                },
                child: Center(
                  child: imagge == null
                      ? Image.asset(
                          'assets/png/setPhoto.png',
                          width: 90,
                          height: 90,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            height: 90,
                            width: 90,
                            imagge!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Set Photo',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'OpenSans'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  'Fill in the following information',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: '969696'.toColor(),
                      fontFamily: 'OpenSans'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              form(nameController, 'F.I.SH'),
              const SizedBox(
                height: 20,
              ),
              form(dataController, 'dd.mm.yyyy'),
              const SizedBox(
                height: 20,
              ),
              form(adressController, 'Adress'),
              const SizedBox(
                height: 20,
              ),
              form(tgLinkController, 'Telegram Link'),
              optional(),
              const SizedBox(
                height: 20,
              ),
              form(inLinkController, 'Instagram Link'),
              optional(),
              const SizedBox(
                height: 20,
              ),
              form(fbLinkController, 'Facebook Link'),
              optional(),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: double.infinity,
                // alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: const Color(0xff9B9B9B).withOpacity(0.15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    onMenuStateChange: (isOpen) {
                      setState(() {
                        if (isOpen) {
                          icon = const Icon(Icons.keyboard_arrow_up_sharp);
                        } else {
                          icon = const Icon(Icons.keyboard_arrow_down_sharp);
                        }
                      });
                    },
                    iconStyleData: IconStyleData(icon: icon),
                    isExpanded: true,
                    hint: Text(
                      'Select Speciality',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: speciality
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
                    value: selectedSpeciality,
                    onChanged: (String? value) {
                      setState(() {
                        selectedSpeciality = value;
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
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: double.infinity,
                // alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: const Color(0xff9B9B9B).withOpacity(0.15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    onMenuStateChange: (isOpen) {
                      setState(() {
                        if (isOpen) {
                          icon = const Icon(Icons.keyboard_arrow_up_sharp);
                        } else {
                          icon = const Icon(Icons.keyboard_arrow_down_sharp);
                        }
                      });
                    },
                    iconStyleData: IconStyleData(icon: icon),
                    isExpanded: true,
                    hint: Text(
                      'Select Gender',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: gender
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
                    value: selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        selectedGender = value;
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
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
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

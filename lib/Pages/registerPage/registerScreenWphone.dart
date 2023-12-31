import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/registerPage/components.dart';
import 'package:tutorchat/Pages/registerPage/registerUserDataWphone.dart';
import 'package:tutorchat/extentions.dart';
import 'package:tutorchat/widgets/sms_validator.dart';

class registerScreenWphone extends StatefulWidget {
  final userToken;
  const registerScreenWphone({super.key, required this.userToken});

  @override
  State<registerScreenWphone> createState() => _registerScreenWphoneState();
}

class _registerScreenWphoneState extends State<registerScreenWphone> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
            child: Form(
              key: _formKey,
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                  formValid(
                      usernameController, 'Your username', 'Username is empty'),
                  const SizedBox(
                    height: 20,
                  ),
                  formValid(emailController, 'Email', 'Email is empty'),
                  const SizedBox(
                    height: 20,
                  ),
                  formValid(passwordController, 'Create password',
                      'Password is empty'),
                  const SizedBox(
                    height: 20,
                  ),
                  formValid(confirmController, 'Confirm password',
                      'Confirm password is empty'),
                  const SizedBox(
                    height: 90,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (confirmController.text == passwordController.text &&
                          _formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => registerUserDataWphoneScreen(
                            username: usernameController.text,
                            email: emailController.text,
                            confirmPassword: confirmController.text,
                            password: passwordController.text,
                          ),
                        ));
                      } else {
                        smsValidator(context, 'Empty data');
                      }
                      if (confirmController.text != passwordController.text) {
                        smsValidator(context, 'Password is not equal');
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
            ),
          )),
    );
  }
}

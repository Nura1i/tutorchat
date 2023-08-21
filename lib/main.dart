import 'package:flutter/material.dart';
import 'package:tutorchat/Pages/languagePage/languageScreen.dart';
import 'package:tutorchat/controllerPage/controllerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ControllerPage()
        //const registerScreenWphone(userToken: ''),
        );
  }
}

import 'package:flutter/material.dart';
import 'package:tutorchat/controllerPage/controllerPage.dart';
import 'package:tutorchat/models/profileModel.dart';

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
        home: ControllerPage(
          userData: ProfileModel(
              id: 'id',
              username: 'username',
              fullName: 'fullName',
              description: 'description',
              type: 'type',
              telegram: 'telegram',
              instagram: 'instagram',
              facebook: 'facebook',
              image: 'image',
              countPost: 2),
        ));
  }
}

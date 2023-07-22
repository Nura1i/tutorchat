import 'package:flutter/material.dart';

class UserSearchWidget extends StatefulWidget {
  String userimage;
  String username;
  UserSearchWidget({required this.userimage, required this.username});

  @override
  State<UserSearchWidget> createState() => _UserSearchWidgetState();
}

class _UserSearchWidgetState extends State<UserSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListTile(
         leading: CircleAvatar(
           child: Image(
             width: 40,
             height: 40,
             fit: BoxFit.cover,
             image: AssetImage(widget.userimage),),
         ),
         title: Text(widget.username, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey.shade900, fontFamily: 'OpenSans'),),
         subtitle: Text('username',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff96A0B5)),),
       ),
    );
  }
}

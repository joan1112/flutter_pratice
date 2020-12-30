import 'package:flutter/material.dart';

import 'constData.dart';
class AddFriendPage extends StatefulWidget {
  @override
  _AddFriendPageState createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainThemeColor,
      child: Scaffold(
        appBar: AppBar(
          title: Text('添加朋友'),
          elevation: 0.0,

        ),
        body: Container(
          child: Center(
            child: Text('123'),
          ),
        ),
      ),
    );
  }
}

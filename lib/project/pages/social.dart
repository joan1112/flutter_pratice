import 'package:flutter/material.dart';

import 'discover_cell.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  final Widget _line = Container(
    child: Row(
      children: [
        Container(width: 40,height: 0.4,color: Colors.white,),
        Container(height: 0.4,color: Colors.grey,),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    Color _themeColor = Color.fromRGBO(220, 220, 220, 1);
    return Container(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: _themeColor, title: Text('发现',style: TextStyle(color: Colors.black),), elevation: 0.0),
        body: Container(
          color: _themeColor,
          child: ListView(
            children: [
              DiscoverCell(title: "朋友圈",imageName: "images/朋友圈.png",),
              _line,
              DiscoverCell(title: "摇一摇",imageName: "images/摇一摇.png",),
              _line,
              SizedBox(height: 10,),
              DiscoverCell(title: "扫一扫",imageName: "images/扫一扫2.png",),
              _line,
              DiscoverCell(title: "看一看",imageName: "images/看一看icon.png",),
              SizedBox(height: 10,),
              DiscoverCell(title: "搜一搜",imageName: "images/搜一搜 2.png",),
              _line,
              DiscoverCell(title: "附近的人",imageName: "images/附近的人icon.png",),
              SizedBox(height: 10,),
              DiscoverCell(title: "购物",imageName: "images/购物.png",subImageName: "images/badge.png",subTitle: "尽享好物",),
              _line,
              DiscoverCell(title: "游戏",imageName: "images/游戏.png",),
              _line,
              DiscoverCell(title: "小程序",imageName: "images/小程序.png",),


            ],
          ),
        ),
      ),
    );
  }
}

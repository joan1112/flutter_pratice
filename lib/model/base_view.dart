import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  final String _title1 = "goods natvie";
  final String _atten = "joan";

  @override
  Widget build(BuildContext context) {
    return Text(
      '<<$_title1>>--$_atten主要介绍了ListView的一些公共参数以及常用的构造函数。不同的构造函数对应了不同的列表项生成模型，如果需要自定义列表项生成模型，可以通过ListView.custom来自定义，它需要实现一',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 16
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
class RichTextDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '<<an quicth>>',
        style: TextStyle(fontSize: 30, color: Colors.blue),
        children: <TextSpan>[
          TextSpan(
              text: ' good havs',
              style: TextStyle(fontSize: 20, color: Colors.yellow)),
          TextSpan(
              text: ' good havs',
              style: TextStyle(fontSize: 18, color: Colors.lightBlue)),
        ],
      ),
    );
  }
}

class BaseTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [Text('123'),Container(
          color: Colors.red,
          child: Icon(Icons.add),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 10),
        )],
      ),
    );
  }
}


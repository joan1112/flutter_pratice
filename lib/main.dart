import 'package:flutter/material.dart';//uikit
import 'package:flutterapp/project/pages/constData.dart';
import 'model/root_page.dart';
import 'model/state_msg.dart';
//import 'model/list_view.dart';
//wideget
//build 渲染到
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RootPage(),
        backgroundColor: MainThemeColor,
      ),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(220, 220, 220, 1),
          shadowColor:Colors.blueGrey,
        highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: Color.fromRGBO(1, 0, 0, 0.0),
         cardColor: Color.fromRGBO(1,1,1,0.65)
      ),
    );
  }
}



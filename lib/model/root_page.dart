import 'package:flutter/material.dart';
import 'package:flutterapp/project/pages/friends.dart';
import 'package:flutterapp/project/pages/chat/page_one.dart';
import 'package:flutterapp/project/pages/person.dart';
import 'package:flutterapp/project/pages/social.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex = index;
              _controller.jumpToPage(currentIndex);
            });
          },
          selectedFontSize: 12,
          fixedColor: Colors.green,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_chat.png')),
              activeIcon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_chat_hl.png')),
              label: '微信',
            ),
            BottomNavigationBarItem(
              icon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_friends.png')),
              activeIcon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_friends_hl.png')),
              label: '通讯录',
            ),
            BottomNavigationBarItem(
              icon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_discover.png')),
              activeIcon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_discover_hl.png')),
              label: '发现',
            ),
            BottomNavigationBarItem(
              icon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_mine.png')),
              activeIcon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage('images/tabbar_mine_hl.png')),
              label: '我的',
            )
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: <Widget>[PageOne(), FriendList(), Social(), PersonOne()],
        ),
      ),
    );
  }
}

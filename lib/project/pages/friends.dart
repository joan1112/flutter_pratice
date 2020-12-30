import 'package:flutter/material.dart';
import 'package:flutterapp/project/pages/friend/friend_list_page.dart';

import 'add_friend_page.dart';

class FriendList extends StatefulWidget {

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FriendListStatues();
  }

}
class _FriendListStatues extends State<FriendList> with AutomaticKeepAliveClientMixin<FriendList>{


  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('通讯录'),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return AddFriendPage();
                    }));
              },
              child: Container(
                width: 25,
                margin: EdgeInsets.only(right: 10),
                child: Image(
                  image: AssetImage('images/icon_friends_add.png'),
                ),
              ),
            )
          ],
        ),
        body: Center(
            child: FriendListPage()
        ),
      ),
    );
  }
}
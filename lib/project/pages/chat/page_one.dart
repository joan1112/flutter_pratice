import 'package:flutter/material.dart';
import 'package:flutterapp/project/pages/chat/chat_data_mode.dart';
import 'package:flutterapp/project/pages/chat/search_page.dart';
import 'package:flutterapp/project/pages/constData.dart';
import 'package:flutterapp/project/pages/friend/friend_model.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PageOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageOneStatue();
  }
}

List<PopupMenuItem<String>> _itemBuildPopMenu(BuildContext context) {
  return <PopupMenuItem<String>>[
    _buildItem('images/微信 支付.png', '发起群聊'),
    _buildItem('images/微信卡包.png', '添加朋友'),
    _buildItem('images/微信收藏.png', '扫一扫'),
    _buildItem('images/扫一扫2.png', '收付款'),
  ];
}

PopupMenuItem<String> _buildItem(String asset, String tit) {
  return PopupMenuItem(
    child: Row(
      children: [
        Image(
          image: AssetImage(asset),
          width: 30,
        ),
        Container(
          width: 20,
        ),
        Text(
          tit,
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}

class _PageOneStatue extends State<PageOne>
    with AutomaticKeepAliveClientMixin<PageOne> {
  @override
  bool get wantKeepAlive => true;

  Widget topSearch() {
    return Container(
      color: MainThemeColor,
      height:46,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder:(BuildContext context){
              return SearchPage(data1:_datas);

            }),
          );
        },
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.all(5),

          height: 36,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("images/放大镜b.png",),width: 18,
                color: Colors.grey,
              ),
              Text('  搜索' ,style: TextStyle(fontSize: 14,color: Colors.grey),)
            ],
          ),
        ),
      )
    );
  }

  List<ChatDataModel> _datas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData().then((data) {
      setState(() {
        _datas = data;
      });
    }).whenComplete(() {
    }).catchError((error) {
    });
  }

  Future<List<ChatDataModel>> _getData() async {
    final _url = "http://rap2api.taobao.org/app/mock/224518/api/chat/list";
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      List maps = body["chat_list"];

      List<ChatDataModel> chatList = maps
          .map<ChatDataModel>((item) => ChatDataModel.fromJson(item))
          .toList();
      return chatList;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MainThemeColor,
          elevation: 0.0,
          title: Text(
            '微信',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: PopupMenuButton(
                offset: Offset(0, 10.0),
                child: Image(
                  image: AssetImage('images/相机.png'),
                  width: 25,
                ),
                itemBuilder: _itemBuildPopMenu,
              ),
            )
          ],
        ),
        body: Container(
          color: MainThemeColor,
          child: Container(
            child: ListView.builder(
              itemCount: _datas.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return topSearch();
                } else {
                  return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                              title: Text(
                                _datas[index - 1].name,
                              ),
                              subtitle: Container(
                                height: 20,
                                width: 20,
                                child: Text(
                                  _datas[index - 1].message,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(_datas[index - 1].imageUrl),
                              )),
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 0.6,
                              ),
                              Container(
                                  width: screenWidth(context) - 60,
                                  height: 0.6,
                                  color: MainThemeColor)
                            ],
                          )
                        ],
                      ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

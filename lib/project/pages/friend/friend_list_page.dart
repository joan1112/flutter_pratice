import 'package:flutter/material.dart';
import 'package:flutterapp/project/pages/friend/friend_model.dart';
import 'package:flutterapp/project/pages/friend/right_flater.dart';

import '../constData.dart';

class FriendListPage extends StatefulWidget {
  @override
  _FriendListPageState createState() => _FriendListPageState();
}

//lsit
class _FriendListPageState extends State<FriendListPage> {
  final List<Friends> topData = [
    Friends(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageUrl: 'images/群聊.png', name: '群聊'),
    Friends(imageUrl: 'images/标签.png', name: '标签'),
    Friends(imageUrl: 'images/公众号.png', name: '公众号'),
  ];
  final List<Friends> moreData = [];
  final offsetList = {
    INDEX_WORDS[0]:0.0,
    INDEX_WORDS[1]:0.0,
  };

  ScrollController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moreData..addAll(data)..addAll(data);
    moreData.sort((Friends a, Friends b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });

    _controller = ScrollController();

    double _offset = 54.0*4;
    for(int i=0;i<moreData.length;i++){
      if(i<1){
        offsetList.addAll({moreData[i].indexLetter:_offset});
        _offset  = _offset+84;


      }else if(moreData[i].indexLetter!=moreData[i-1].indexLetter) {
        offsetList.addAll({moreData[i].indexLetter:_offset});
        _offset  = _offset+84;
      }else{
        _offset  = _offset+54;

      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainThemeColor,
      child: Stack(
        children: [
          ListView.builder(
            controller: _controller,
            itemCount: moreData.length + 4,
            itemBuilder: (BuildContext context, int index) {
              if (index < 4) {
                return _FriendCell(
                  assetImage: topData[index].imageUrl,
                  userName: topData[index].name,
                );
              }
              var group = moreData[index - 4].indexLetter;
              if(index>4){
                if(moreData[index - 4].indexLetter!=moreData[index - 5].indexLetter){
                  group =  moreData[index - 4].indexLetter;
                }else{
                  group = null;
                }
              }

              return _FriendCell(
                imageUrl: moreData[index - 4].imageUrl,
                userName: moreData[index - 4].name,

                groupTitle: group,
              );
            },
          ),
          IndexFlatter(
            indexSelectCallBack: (String str){
              print('come === $str');
              if(offsetList[str]!=null){
                _controller.animateTo(offsetList[str],duration: Duration(milliseconds: 10),curve: Curves.easeIn);

              }

            },
          )
        ],
      ),
    );
  }
}

//cell
class _FriendCell extends StatelessWidget {
  final imageUrl;
  final assetImage;
  final userName;
  final groupTitle;

  const _FriendCell(
      {this.imageUrl, this.userName, this.assetImage, this.groupTitle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: groupTitle != null ? 30 : 0,
            color: MainThemeColor,
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            child: groupTitle != null ? Text(groupTitle) : null,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                        image: assetImage != null
                            ? AssetImage(assetImage)
                            : NetworkImage(imageUrl)),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 53.5,
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width - 70,
                      child: Text(
                        userName,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: .5,
                      color: MainThemeColor,
                      width: MediaQuery.of(context).size.width - 70,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

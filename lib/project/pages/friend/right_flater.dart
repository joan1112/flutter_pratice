import 'package:flutter/material.dart';
import 'package:flutterapp/project/pages/constData.dart';

import 'friend_model.dart';
class IndexFlatter extends StatefulWidget {

  final void Function(String str) indexSelectCallBack;

  const IndexFlatter({Key key, this.indexSelectCallBack}) : super(key: key);

  @override
  _IndexFlatterState createState() => _IndexFlatterState();
}

int getIndex(BuildContext context,Offset offsetY){
  RenderBox box = context.findRenderObject();
  double y = box.globalToLocal(offsetY).dy;
  var  itemHeight =  screenHeight(context) / 2 / INDEX_WORDS.length;
  int index = y~/itemHeight.clamp(0, INDEX_WORDS.length-1);

  return index;
}

class _IndexFlatterState extends State<IndexFlatter> {

 bool _indicatorHidden = true;
 String _currentStr = 'A';
 double _currentOffset = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> indexList = [];
    for (int i = 0;i < INDEX_WORDS.length;i++){

      indexList.add(Expanded(child: Text(INDEX_WORDS[i],style: TextStyle(fontSize: 12),),)) ;

    }
    return Positioned(
        top: MediaQuery.of(context).size.height/8,
        right: 0.0,
        height: MediaQuery.of(context).size.height/2 ,
        width: 120,
        child: Row(
          children: [
            Container(
              width:80,
              alignment: Alignment(0,_currentOffset),
              child:_indicatorHidden == true ? null:Stack(
                alignment: Alignment(-0.2,0),
                children: [
                  Image(image: AssetImage('images/气泡.png'),width: 60),
                  Text(_currentStr,style: TextStyle(color: Colors.white,fontSize: 35),)
                ],
              ),
            ),
            GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details){
                int index = getIndex(context, details.globalPosition);
                widget.indexSelectCallBack(INDEX_WORDS[index]);

                setState(() {
                  _currentOffset = 2.2/(INDEX_WORDS.length-1) * index -1.1;
                  _indicatorHidden = false;
                  _currentStr =  INDEX_WORDS[index];
                });

              },
              onVerticalDragDown: (DragDownDetails details){
                int index = getIndex(context, details.globalPosition);
                widget.indexSelectCallBack(INDEX_WORDS[index]);

                setState(() {
                  _currentOffset = 2.2/(INDEX_WORDS.length-1) * index-1.1;
                  _indicatorHidden = false;
                  _currentStr =  INDEX_WORDS[index];

                });

              },
              onVerticalDragCancel: (){
                setState(() {
                  _indicatorHidden = true;

                });
              },
              onVerticalDragEnd: (DragEndDetails details){
                setState(() {
                  _indicatorHidden = true;

                });
              },

              child: Container(
                width: 20,
                color: Colors.grey,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indexList,
                ),
              ),
            )
          ],
        )


    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutterapp/project/pages/page_next.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageName;
  final String subImageName;

  const DiscoverCell(
      {Key key,
        @required this.title,
      this.subTitle,
      @required this.imageName,
      this.subImageName})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DiscoverCellStatues();
  }


}

class _DiscoverCellStatues extends State<DiscoverCell>{
  Color _themeColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context){
                  return  PageNext(title:widget.title);
                }
            )
        );

        setState(() {
          _themeColor = Colors.white;
        });
      },

      onTapDown: (TapDownDetails details){
        setState(() {
          _themeColor = Colors.grey;
        });
      },
      onTapCancel: (){
        setState(() {
          _themeColor = Colors.white;
        });
      },
      child:  Container(
        color: _themeColor,
        padding: EdgeInsets.all(10),
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Row(children: [
                  Image(
                    image: AssetImage(widget.imageName),
                    width: 20,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(widget.title)
                ])),
            Container(
              child: Row(
                children: [
                  widget.subTitle!=null?Text(widget.subTitle):Text(""),
                  Container(width: 15,),
                  widget.subImageName!=null?Image(image: AssetImage(widget.subImageName),height: 15,):Container(),

                  Image(image: AssetImage('images/icon_right.png'),width: 20,)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

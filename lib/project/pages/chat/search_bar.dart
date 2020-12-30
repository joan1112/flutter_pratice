import 'package:flutter/material.dart';
import 'package:flutterapp/project/pages/constData.dart';

class SearchBar extends StatefulWidget {

  final void Function(String str) valueChanged;

  const SearchBar({Key key, this.valueChanged}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _showClear = false;

  _onChange(String value){
    widget.valueChanged(value);

    if(value.length>0){
      _showClear = true;
    }else{
      _showClear = false;

    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 40,
          ),
          Container(
            height: 44,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  width: screenWidth(context) - 50,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('images/放大镜b.png'),
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            controller: _controller,
                            onChanged: _onChange,
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5,top: -10),
                              hintText: '搜索',
                            ),
                          ),
                        )
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.clear();
                          _onChange('');
                        },
                        child:_showClear==true? Icon(
                          Icons.cancel,
                          size: 20,
                          color: Colors.grey,
                        ):Container(),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    '取消',
                    style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

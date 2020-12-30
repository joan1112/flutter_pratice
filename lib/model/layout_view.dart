import 'package:flutter/material.dart';

//row column  stack
//expanded
//positioned
class LayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment(0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        crossAxisAlignment: CrossAxisAlignment.baseline, //文字底部对齐
//        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(
            child: Container(
                child: Icon(Icons.add, size: 60), color: Colors.yellow),
          ),
          Expanded(
            child:
                Container(child: Icon(Icons.add, size: 60), color: Colors.red),
          ),
          Expanded(
              child: Container(
            child: Text('n',style: TextStyle(fontSize: 16,color: Colors.white),),
            color: Colors.blue,
            height: 60,
          ))
        ],
      ),
    );
  }
}
